class MubitCli < Formula
  desc "Command-line client for the Mubit console"
  homepage "https://github.com/MubitLabs/mubit-cli"

  on_macos do
    on_arm do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.3/mubit-cli-1.0.3-macos-arm64.tar.gz"
      sha256 "0aedca5b71c69b8b5db8bd7497bd7c1e3c4aac04d1aa2dd7746789c8a7ad4120"
    end
    on_intel do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.3/mubit-cli-1.0.3-macos-x86_64.tar.gz"
      sha256 "e8624c02640cfc20f4c8f48bd4d1c4420c53b26a654ea5665232c5436ea5fcb1"
    end
  end

  on_linux do
    # The credential store reaches the secret service over D-Bus, so
    # the binary loads libdbus at run time.
    depends_on "dbus"

    on_arm do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.3/mubit-cli-1.0.3-linux-arm64.tar.gz"
      sha256 "d4c4be78c556af7a03352d805b127b25efbc4d5c21f0db5b294149b36ccee449"
    end
    on_intel do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.3/mubit-cli-1.0.3-linux-x86_64.tar.gz"
      sha256 "51a9795d5f047a4e85f9fd504f95617ccad21972b26a99cab6836a567f8be89a"
    end
  end

  def install
    # Each archive holds one top-level directory and Homebrew unpacks
    # into it, so these paths are relative to that directory.
    bin.install "mubit-cli"
    doc.install "README.md"
  end

  test do
    assert_match "1.0.3", shell_output("#{bin}/mubit-cli --version")
  end
end
