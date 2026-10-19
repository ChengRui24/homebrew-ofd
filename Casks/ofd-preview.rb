cask "ofd-preview" do
  version "1.0.0"
  sha256 "415900bb32fa9f3d2ed965e48cad0efd3d3995b19035db9181221884fb24e076"

  url "https://github.com/ChengRui24/OFD-preview-Mac/releases/download/v#{version}/OFD-Preview-macOS-arm64.zip"
  name "OFD预览"
  name "OFD Preview"
  desc "OFD document viewer and converter for macOS"
  homepage "https://github.com/ChengRui24/OFD-preview-Mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "OFD预览.app"

  zap trash: [
    "~/Library/Saved Application State/com.local.ofdtool.savedState",
  ]

  caveats <<~EOS
    This application is not notarized by Apple. On first launch, macOS may
    block it. Right-click the app → Open → Open, or allow it in
    System Settings → Privacy & Security.

    To make it the default app for .ofd files:
      Finder → right-click a .ofd → Get Info → Open with → OFD预览 → Change All
  EOS
end
