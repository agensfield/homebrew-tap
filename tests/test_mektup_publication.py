import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('update_mektup', ROOT / 'scripts/update_mektup.py')
updater = importlib.util.module_from_spec(spec)
spec.loader.exec_module(updater)


class FormulaPublication(unittest.TestCase):
    def setUp(self):
        self.formula = (ROOT / 'Formula/mektup.rb').read_text()
        self.old = updater.re.search(r'/download/v([0-9.]+)/', self.formula)[1]
        major, minor, patch = map(int, self.old.split('.'))
        self.version = f'{major}.{minor}.{patch + 1}'
        self.entries = {}
        for system in ('darwin', 'linux'):
            for arch in ('amd64', 'arm64'):
                name = f'mektup_{self.version}_{system}_{arch}.tar.gz'
                for entry in (name, name + '.sbom.json'):
                    self.entries[entry] = hashlib.sha256(entry.encode()).hexdigest()
        self.manifest = '\n'.join(f'{digest}  {name}' for name, digest in self.entries.items()).encode()
        self.release = {'tag_name': 'v' + self.version, 'draft': False, 'prerelease': False,
                        'assets': [{'name': n, 'digest': 'sha256:' + d} for n, d in self.entries.items()] +
                                  [{'name': 'checksums.txt', 'digest': 'sha256:' + hashlib.sha256(self.manifest).hexdigest()}]}

    def test_exact_urls_hashes_and_version(self):
        value = updater.render(self.formula, self.release, self.manifest)
        self.assertNotIn('/download/v' + self.old + '/', value)
        self.assertEqual(value.count('/download/v' + self.version + '/'), 4)
        self.assertIn('"version":"' + self.version + '"', value)
        for name, digest in self.entries.items():
            if name.endswith('.tar.gz'):
                self.assertIn(digest, value)

    def test_current_release_is_idempotent(self):
        value = updater.render(self.formula, self.release, self.manifest)
        self.assertIsNone(updater.render(value, self.release, self.manifest))

    def test_manifest_mismatch_cannot_change_formula(self):
        with self.assertRaises(ValueError):
            updater.render(self.formula, self.release, self.manifest + b'altered')

    def test_archive_or_sbom_digest_mismatch_is_rejected(self):
        for index in (0, 1):
            release = copy.deepcopy(self.release)
            release['assets'][index]['digest'] = 'sha256:' + 'b' * 64
            with self.subTest(index=index), self.assertRaises(ValueError):
                updater.render(self.formula, release, self.manifest)

    def test_prerelease_draft_and_unsafe_tag_are_rejected(self):
        for key, value in [('draft', True), ('prerelease', True), ('tag_name', '../untrusted')]:
            release = dict(self.release, **{key: value})
            with self.subTest(key=key), self.assertRaises(ValueError):
                updater.render(self.formula, release, self.manifest)

    def test_formula_layout_change_is_rejected(self):
        with self.assertRaises(ValueError):
            updater.render(self.formula.replace('url "https://', 'url "http://', 1), self.release, self.manifest)

    def test_failed_product_verification_cannot_publish_formula(self):
        def api(repo, route):
            if route == 'releases/latest':
                return self.release
            if route.startswith('git/ref/'):
                return {'object': {'type': 'commit', 'sha': 'a' * 40}}
            if route.startswith('actions/'):
                return {'workflow_runs': [{'conclusion': 'failure', 'head_sha': 'a' * 40}]}
            raise AssertionError(route)

        def gh(*args):
            folder = Path(args[args.index('--dir') + 1])
            (folder / 'checksums.txt').write_bytes(self.manifest)
            return ''

        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            (root / 'Formula').mkdir()
            formula = root / 'Formula/mektup.rb'
            formula.write_text(self.formula)
            with patch.object(updater, 'api', side_effect=api), patch.object(updater, 'gh', side_effect=gh), \
                 patch.object(updater, 'Path', side_effect=lambda p: root / p), \
                 patch.object(updater.subprocess, 'run') as mutation:
                with self.assertRaisesRegex(ValueError, 'has not passed'):
                    updater.main()
                mutation.assert_not_called()
            self.assertEqual(formula.read_text(), self.formula)


if __name__ == '__main__':
    unittest.main()
