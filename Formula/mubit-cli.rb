class MubitCli < Formula
  desc "Command-line client for the Mubit console"
  homepage "https://github.com/MubitLabs/mubit-cli"

  on_macos do
    on_arm do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.5/mubit-cli-1.0.5-macos-arm64.tar.gz"
      sha256 "b708de642bbe4de66dd2116f453074e1706937e4194ace6bb023919cb95503e4"
    end
    on_intel do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.5/mubit-cli-1.0.5-macos-x86_64.tar.gz"
      sha256 "e61335bf77c25564609074018d3e0ecbef8ac560b4a5201d29eb5b342f216237"
    end
  end

  on_linux do
    # The credential store reaches the secret service over D-Bus, so
    # the binary loads libdbus at run time.
    depends_on "dbus"

    on_arm do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.5/mubit-cli-1.0.5-linux-arm64.tar.gz"
      sha256 "c57e63375ec780140899eb54c872ad516e45239f5d6be284630848e5634e4568"
    end
    on_intel do
      url "https://github.com/MubitLabs/mubit-cli/releases/download/v1.0.5/mubit-cli-1.0.5-linux-x86_64.tar.gz"
      sha256 "ef9a4a0aacba1b7e38051d34a6bfaa354f040f89914812ca9b191c131eb8db0f"
    end
  end

  def install
    # Each archive holds one top-level directory and Homebrew unpacks
    # into it, so these paths are relative to that directory.
    bin.install "mubit-cli"
    doc.install "README.md"
  end

  test do
    assert_match "1.0.5", shell_output("#{bin}/mubit-cli --version")
  end
end
