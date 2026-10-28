class MubitCli < Formula
  desc "Command-line client for the Mubit console"
  homepage "https://github.com/MubitLabs/mubit-cli"

  on_macos do
    on_arm do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.4/mubit-cli-1.0.4-macos-arm64.tar.gz"
      sha256 "c632665d2e10c1bf032f1c9c51e6a7a362ca1ff871bbc123383810e34225aa14"
    end
    on_intel do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.4/mubit-cli-1.0.4-macos-x86_64.tar.gz"
      sha256 "1241149f79c2d1f549015246516bf4dac6b4d2e89b846af3f12bfd3fe1e67c54"
    end
  end

  on_linux do
    # The credential store reaches the secret service over D-Bus, so
    # the binary loads libdbus at run time.
    depends_on "dbus"

    on_arm do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.4/mubit-cli-1.0.4-linux-arm64.tar.gz"
      sha256 "5aec997e37a7098e39973f4f569c9f061345a9e749db9e10ad154464e5beb327"
    end
    on_intel do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.4/mubit-cli-1.0.4-linux-x86_64.tar.gz"
      sha256 "cbb187984889ac6ba5721590e91990af528ff4155704242a55ffe2a556aa4831"
    end
  end

  def install
    # Each archive holds one top-level directory and Homebrew unpacks
    # into it, so these paths are relative to that directory.
    bin.install "mubit-cli"
    doc.install "README.md"
  end

  test do
    assert_match "1.0.4", shell_output("#{bin}/mubit-cli --version")
  end
end
