# Homebrew cask for Mapo. Lives in the tap repo Bur2ak/homebrew-tap as
# Casks/mapo.rb; scripts/release.sh --publish prints the new version/sha256.
cask "mapo" do
  version "0.3.0"
  sha256 "8aafaa04b6d7d39be6254ad90108998e49a35085e0b73c6b89a1388069dbb66a"

  url "https://github.com/Bur2ak/mapo/releases/download/v#{version}/Mapo-#{version}.dmg"
  name "Mapo"
  desc "Live map of a codebase for developers and their AI agents"
  homepage "https://github.com/Bur2ak/mapo"

  livecheck do
    url "https://github.com/Bur2ak/mapo/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Mapo.app"

  zap trash: [
    "~/Library/Application Support/Mapo",
    "~/Library/Caches/io.github.bur2ak.mapo",
    "~/Library/HTTPStorages/io.github.bur2ak.mapo",
    "~/Library/Logs/Mapo",
    "~/Library/Preferences/io.github.bur2ak.mapo.plist",
  ]
end
