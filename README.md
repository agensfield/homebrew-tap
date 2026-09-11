# Agensfield Homebrew Tap

Homebrew tap for Agensfield tools.

## Install

```sh
brew tap agensfield/tap
```

## Packages

### Formulae

- `verso` - Deliberate Codex account switching (alpha).
- `scriba` - Local-first usage tracking for Claude Code and Codex.

## Install Packages

```sh
brew install agensfield/tap/scriba
brew install agensfield/tap/verso
```

## Updating Formulae

Run the `Update Formula` workflow with:

- `formula`: formula name, for example `scriba`
- `tag`: release tag, for example `v0.2.1`
- `repository`: source repository, for example `agensfield/scriba`

Formulae use GitHub release tarballs. Each release should publish:

- `<formula>_<version>_darwin_arm64.tar.gz`
- `<formula>_<version>_darwin_amd64.tar.gz`
- `<formula>_<version>_linux_arm64.tar.gz`
- `<formula>_<version>_linux_amd64.tar.gz`

## Update / Uninstall

```sh
brew update
brew upgrade scriba
brew uninstall scriba
```
