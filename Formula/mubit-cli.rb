class MubitCli < Formula
  desc "Command-line client for the Mubit console"
  homepage "https://github.com/MubitLabs/mubit-cli"

  on_macos do
    on_arm do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.1/mubit-cli-1.0.1-macos-arm64.tar.gz"
      sha256 "184f0e0259562fa257d4712ad22be094401efea70234f0b1601fbb1de435fac8"
    end
    on_intel do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.1/mubit-cli-1.0.1-macos-x86_64.tar.gz"
      sha256 "174ea4931339c9b04f94a6cd542f6adf108af24ec5823295ce96358af8440f6c"
    end
  end

  on_linux do
    # The credential store reaches the secret service over D-Bus, so
    # the binary loads libdbus at run time.
    depends_on "dbus"

    on_arm do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.1/mubit-cli-1.0.1-linux-arm64.tar.gz"
      sha256 "92cb7a89b73ffd108389a7eed3171c691c955056ed7c896b04817344b5085845"
    end
    on_intel do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.1/mubit-cli-1.0.1-linux-x86_64.tar.gz"
      sha256 "e9a651ce52015518617b0e17c100e7b07ef4ab0d2f345c6acf4247c61a8bbae9"
    end
  end

  def install
    # Each archive holds one top-level directory and Homebrew unpacks
    # into it, so these paths are relative to that directory.
    bin.install "mubit-cli"
    doc.install "README.md"
  end

  test do
    assert_match "1.0.1", shell_output("#{bin}/mubit-cli --version")
  end
end
