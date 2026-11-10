#!/usr/bin/env python3
"""Publish the latest verified Mektup release to this tap; never update hosts."""

import hashlib
import json
from pathlib import Path
import re
import subprocess
import tempfile
import time

REPO = "agensfield/homebrew-tap"
PRODUCT = "agensfield/mektup"


def gh(*args):
    return subprocess.check_output(["gh", *args], text=True).strip()


def api(repo, route):
    return json.loads(gh("api", f"repos/{repo}/{route}"))


def render(formula, release, manifest):
    tag = release["tag_name"]
    if release["draft"] or release["prerelease"] or not re.fullmatch(r"v[0-9]+\.[0-9]+\.[0-9]+", tag):
        raise ValueError("expected a published stable product release")
    version = tag[1:]
    old = re.search(r"/download/v([0-9]+\.[0-9]+\.[0-9]+)/", formula)[1]
    if tuple(map(int, old.split("."))) >= tuple(map(int, version.split("."))):
        return None
    assets = {a["name"]: a for a in release["assets"]}
    digest = "sha256:" + hashlib.sha256(manifest).hexdigest()
    if assets["checksums.txt"].get("digest") != digest:
        raise ValueError("checksum manifest differs from GitHub's asset digest")
    entries = {}
    for line in manifest.decode().splitlines():
        checksum, name = line.split()
        if name in entries or not re.fullmatch(r"[0-9a-f]{64}", checksum):
            raise ValueError("invalid or duplicate manifest entry")
        entries[name] = checksum
    expected = {f"mektup_{version}_{system}_{arch}.tar.gz" for system in ("darwin", "linux")
                for arch in ("amd64", "arm64")}
    for name in expected | {n + ".sbom.json" for n in expected}:
        if "sha256:" + entries[name] != assets[name].get("digest"):
            raise ValueError("archive/SBOM manifest differs from GitHub's asset digest")
    formula = formula.replace(old, version)

    def archive(match):
        name = match[2]
        if name not in expected:
            raise ValueError("unexpected formula archive")
        return match[1] + entries[name] + match[3]

    formula, count = re.subn(r'(url "https://github.com/agensfield/mektup/releases/download/'
                             r'v[0-9.]+/(mektup_[^"\n]+\.tar\.gz)"\n\s+sha256 ")'
                             r'[0-9a-f]+(")', archive, formula)
    if count != 4:
        raise ValueError("formula archive layout changed")
    return formula


def main():
    release = api(PRODUCT, "releases/latest")
    formula = Path("Formula/mektup.rb")
    with tempfile.TemporaryDirectory() as temporary:
        root = Path(temporary)
        gh("release", "download", release["tag_name"], "--repo", PRODUCT,
           "--pattern", "checksums.txt", "--dir", str(root))
        result = render(formula.read_text(), release, (root / "checksums.txt").read_bytes())
    if result is None:
        print("Mektup formula is already current; no publication or CI dispatch.")
        return
    # Publication verification belongs to the product release job, including
    # archive bytes, native binary metadata and a fresh public Go install.
    tag = api(PRODUCT, f"git/ref/tags/{release['tag_name']}")["object"]
    sha = api(PRODUCT, f"git/tags/{tag['sha']}")["object"]["sha"] if tag["type"] == "tag" else tag["sha"]
    runs = api(PRODUCT, f"actions/workflows/release.yml/runs?head_sha={sha}&per_page=100")["workflow_runs"]
    if not any(r["conclusion"] == "success" and r["head_sha"] == sha for r in runs):
        raise ValueError("product packaging/verification workflow has not passed yet")
    formula.write_text(result)
    subprocess.run(["git", "diff", "--check"], check=True)
    subprocess.run(["git", "add", "--", "Formula/mektup.rb"], check=True)
    subprocess.run(["git", "commit", "-m", f"chore: update mektup to {release['tag_name'][1:]}"], check=True)
    subprocess.run(["git", "push", "origin", "HEAD:main"], check=True)
    head = subprocess.check_output(["git", "rev-parse", "HEAD"], text=True).strip()
    # A GITHUB_TOKEN push does not trigger push workflows: dispatch explicitly.
    gh("workflow", "run", "mektup.yml", "--repo", REPO, "--ref", "main")
    for _ in range(18):
        runs = api(REPO, f"actions/workflows/mektup.yml/runs?head_sha={head}&event=workflow_dispatch&per_page=100")["workflow_runs"]
        if runs:
            run = max(runs, key=lambda r: r["id"])
            gh("run", "watch", str(run["id"]), "--repo", REPO, "--exit-status", "--interval", "15")
            print(f"Published formula {release['tag_name']}: {run['html_url']}")
            return
        time.sleep(10)
    raise RuntimeError("formula CI dispatch not visible; inspect before resuming")


if __name__ == "__main__":
    main()
