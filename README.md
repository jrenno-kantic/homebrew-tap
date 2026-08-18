# jrenno-kantic Homebrew Tap

Homebrew formulae maintained by Kantic Analytics.

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

In a `Brewfile`:

```ruby
tap "jrenno-kantic/tap"
brew "herd-llm"
```
