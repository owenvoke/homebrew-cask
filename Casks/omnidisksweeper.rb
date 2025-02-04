cask "omnidisksweeper" do
  if MacOS.version <= :sierra
    version "1.10"
    sha256 "0d8f5b7ff075fca4503a41e1ea898a145001f3f602f6b53ffb310e0a465af080"
    url "https://downloads.omnigroup.com/software/MacOSX/10.12/OmniDiskSweeper-#{version}.dmg"
  elsif MacOS.version <= :high_sierra
    version "1.11"
    sha256 "f06b150239e5c5ee27615b1e8bd6ec2c87c61c4cda575547f124ff84986b6f37"
    url "https://downloads.omnigroup.com/software/MacOSX/10.13/OmniDiskSweeper-#{version}(n).dmg"
  else
    version "1.14"
    sha256 "0b1ccb9c9c47306a3e8c9147f61a3ca1d329338612f438f863b19cc34dbca0f1"
    url "https://downloads.omnigroup.com/software/macOS/11/OmniDiskSweeper-#{version}.dmg"
  end

  name "OmniDiskSweeper"
  desc "Finds large, unwanted files and deletes them"
  homepage "https://www.omnigroup.com/more/"

  livecheck do
    url "https://update.omnigroup.com/appcast/com.omnigroup.OmniDiskSweeper"
    regex(/OmniDiskSweeper[._-](\d+(?:\.\d+)+)\.dmg/i)
  end

  auto_updates true
  depends_on macos: ">= :sierra"

  app "OmniDiskSweeper.app"

  zap trash: [
    "~/Library/Application Scripts/com.omnigroup.OmniSoftwareUpdate.OSUCheckService",
    "~/Library/Caches/com.apple.helpd/Generated/OmniDiskSweeper Help*",
    "~/Library/Caches/com.omnigroup.OmniDiskSweeper",
    "~/Library/Containers/com.omnigroup.OmniSoftwareUpdate.OSUCheckService",
    "~/Library/Preferences/com.omnigroup.OmniDiskSweeper.plist",
    "~/Library/Preferences/com.omnigroup.OmniSoftwareUpdate.plist",
  ]
end
