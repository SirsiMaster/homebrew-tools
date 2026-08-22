# typed: false
# frozen_string_literal: true

# GoReleaser-compatible headless package. On macOS the Pantheon app cask is the
# canonical product and already exposes its bundled `sirsi` executable. This
# separately named formula exists for headless/automation installations and can
# never collide with the cask token.
class SirsiPantheonCli < Formula
  desc "Headless Sirsi Pantheon CLI and agent"
  homepage "https://github.com/SirsiMaster/sirsi-pantheon"
  version "0.23.8-beta"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/SirsiMaster/sirsi-pantheon/releases/download/v0.23.8-beta/sirsi-pantheon_0.23.8-beta_darwin_amd64.tar.gz"
      sha256 "dce2c0ef099adeaa9b4ea4f3563ab53da01913278c873c60ab78b741e7ae0a03"
    else
      url "https://github.com/SirsiMaster/sirsi-pantheon/releases/download/v0.23.8-beta/sirsi-pantheon_0.23.8-beta_darwin_arm64.tar.gz"
      sha256 "2029c9b9f842d17bced13634e2bb31adf22d164f5ad7c12ca82b639f6b6c20a9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/SirsiMaster/sirsi-pantheon/releases/download/v0.23.8-beta/sirsi-pantheon_0.23.8-beta_linux_amd64.tar.gz"
      sha256 "62d8e609059edf10c0d72c646b0a9912d1873dba9195a65be87f408659525922"
    else
      url "https://github.com/SirsiMaster/sirsi-pantheon/releases/download/v0.23.8-beta/sirsi-pantheon_0.23.8-beta_linux_arm64.tar.gz"
      sha256 "546317aea15e9fbcd2bd1a720940d8264f6f931b34bd8a4de3a414c9d0cae5a5"
    end
  end

  def install
    bin.install "sirsi"
    bin.install "sirsi-agent"
  end

  test do
    system "#{bin}/sirsi", "version"
  end
end
