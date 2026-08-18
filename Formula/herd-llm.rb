class HerdLlm < Formula
  desc "Terminal control plane for llama-server"
  homepage "https://github.com/jrenno-kantic/herd"
  url "https://github.com/jrenno-kantic/herd/archive/refs/tags/v0.8.7.tar.gz"
  sha256 "c47cdc60e2da3b6eedd02375aa10ca6bb8182849f40b98b0fd8b6ecd58d3dba6"
  license "MIT"
  head "https://github.com/jrenno-kantic/herd.git", branch: "main"

  depends_on "rust" => :build
  depends_on "hf"
  depends_on "llama.cpp"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "herd #{version}", shell_output("#{bin}/herd --version")
  end
end
