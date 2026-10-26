class MubitCli < Formula
  desc "Command-line client for the Mubit console"
  homepage "https://github.com/MubitLabs/mubit-cli"

  on_macos do
    on_arm do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.0/mubit-cli-1.0.0-macos-arm64.tar.gz"
      sha256 "bae2e5012046853fe9aaad05e61b0e7b90f97063578ba0bf5545f41fd7c4e8b4"
    end
    on_intel do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.0/mubit-cli-1.0.0-macos-x86_64.tar.gz"
      sha256 "581e452fa833830d3574011e94c0ff3e48fa0d36dcc3916a1f2f45ba0e8efc2f"
    end
  end

  on_linux do
    # The credential store reaches the secret service over D-Bus, so
    # the binary loads libdbus at run time.
    depends_on "dbus"

    on_arm do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.0/mubit-cli-1.0.0-linux-arm64.tar.gz"
      sha256 "5aa99740cb151fd984c473c2ddabc3be2f6d0ce64b208da87cbb660b031c1fe5"
    end
    on_intel do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.0/mubit-cli-1.0.0-linux-x86_64.tar.gz"
      sha256 "b3165592ab7f08cba628ec1025b667e8f82ea2973149d4bae22c34e236d8db21"
    end
  end

  def install
    # Each archive holds one top-level directory and Homebrew unpacks
    # into it, so these paths are relative to that directory.
    bin.install "mubit-cli"
    doc.install "README.md"
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/mubit-cli --version")
  end
end
