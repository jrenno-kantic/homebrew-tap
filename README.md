# jrenno-kantic Homebrew Tap

Homebrew formulae maintained by Jacky Renno.

## HERD

[HERD](https://github.com/jrenno-kantic/herd) is a terminal control plane for
`llama-server`.

Install the formula directly:

```bash
brew install jrenno-kantic/tap/herd-llm
```

The formula installs the executable as `herd` and includes the `llama.cpp` and
`hf` runtime dependencies required for launching and downloading models.

Alternatively, tap the repository first:

```bash
brew tap jrenno-kantic/tap
brew install herd-llm
```

## hf-to-local

[hf-to-local](https://github.com/jrenno-kantic/hf-to-local) creates local model
folders that link into the Hugging Face Hub cache, so tools that expect a plain
directory of model files can read the cache without a second copy on disk.

```bash
brew install jrenno-kantic/tap/hf-to-local
```

This one ships as a **cask** rather than a formula, because it drops in a
prebuilt binary. Homebrew only supports casks on macOS; on Linux and Windows,
install from the
[release archive](https://github.com/jrenno-kantic/hf-to-local/releases)
instead.

## Brewfile

```ruby
tap "jrenno-kantic/tap"
brew "herd-llm"
cask "hf-to-local"
```

## Maintenance

Both packages are published here automatically on each tagged upstream release
— HERD's formula by [dist](https://axodotdev.github.io/cargo-dist) and
hf-to-local's cask by [GoReleaser](https://goreleaser.com). Edit the upstream
project and cut a tag; hand edits to `Formula/` or `Casks/` here are overwritten
by the next release.
