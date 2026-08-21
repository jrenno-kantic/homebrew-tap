class HerdLlm < Formula
  desc "Terminal control plane for llama-server"
  homepage "https://github.com/jrenno-kantic/herd"
  version "0.8.9"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/jrenno-kantic/herd/releases/download/v0.8.9/herd-aarch64-apple-darwin.tar.xz"
      sha256 "6152aee82a957a1c15a36c11998827cfa0dd846bd7ecc653493b9ee116963f43"
    end
    if Hardware::CPU.intel?
      url "https://github.com/jrenno-kantic/herd/releases/download/v0.8.9/herd-x86_64-apple-darwin.tar.xz"
      sha256 "64d708b127e501cb6cbe96015d2f3b8c857c1a1486165bba5cb0ab723968b5dd"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/jrenno-kantic/herd/releases/download/v0.8.9/herd-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "9d19eea284e92ead8769e88ab56bc31933b80a45a1b4e9ce1bc5bc8395ed763d"
  end
  license "MIT"
  depends_on "hf"
  depends_on "llama.cpp"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "herd"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "herd"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "herd"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
