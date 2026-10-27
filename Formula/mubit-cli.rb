class MubitCli < Formula
  desc "Command-line client for the Mubit console"
  homepage "https://github.com/MubitLabs/mubit-cli"

  on_macos do
    on_arm do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.2/mubit-cli-1.0.2-macos-arm64.tar.gz"
      sha256 "901388d115335a64cb685e8bd4b025c0f6c31f167d788bc5fd2eebcb91545865"
    end
    on_intel do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.2/mubit-cli-1.0.2-macos-x86_64.tar.gz"
      sha256 "b533ae65549002217a85988a2aa6a477b4285b1bfb6081f6aaee060ce47dd328"
    end
  end

  on_linux do
    # The credential store reaches the secret service over D-Bus, so
    # the binary loads libdbus at run time.
    depends_on "dbus"

    on_arm do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.2/mubit-cli-1.0.2-linux-arm64.tar.gz"
      sha256 "d412bf7014881bae1fafdc1bf1aac2f9f93b9f47c49ed454a6967eb48ff3dd37"
    end
    on_intel do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.2/mubit-cli-1.0.2-linux-x86_64.tar.gz"
      sha256 "9c3c1ff447c5587bae1c690640a1d54b78fe1586b8beb96b7cb43c068d576913"
    end
  end

  def install
    # Each archive holds one top-level directory and Homebrew unpacks
    # into it, so these paths are relative to that directory.
    bin.install "mubit-cli"
    doc.install "README.md"
  end

  test do
    assert_match "1.0.2", shell_output("#{bin}/mubit-cli --version")
  end
end
