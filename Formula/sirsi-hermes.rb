# typed: false
# frozen_string_literal: true

class SirsiHermes < Formula
  desc "Thunderbolt transport CLI and MLX launcher"
  homepage "https://github.com/SirsiMaster/sirsi-hermes"
  url "https://github.com/SirsiMaster/sirsi-hermes/releases/download/v1.2.2/sirsi-hermes-1.2.2.tar.gz"
  version "1.2.2"
  sha256 "c8838b88796df8c8cb834298132774e19e7d46c599730c544452be37e85bc3ef"
  license :cannot_represent

  depends_on macos: :ventura

  def install
    bin.install "bin/hermes"
    bin.install "bin/sirsi-hermes"
    bin.install "bin/HermesMenuBar" if File.exist?("bin/HermesMenuBar")
    bin.install "bin/sirsimpi-launch"
    bin.install "bin/sirsimpi-helper"
    bin.install "bin/tb-lanes-ensure.sh"
    lib.install "lib/libsirsimpi.dylib"
    lib.install Dir["lib/*.h"]
    pkgshare.install Dir["share/*"]
  end

  test do
    assert_match "hermes 1.2.2", shell_output("#{bin}/hermes version")
  end
end
