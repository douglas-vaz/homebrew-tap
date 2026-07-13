cask "llm-ground-zero" do
  version "0.2.0"
  sha256 "749e2ac716f920ad9cdfdab61189fb7c7edaad796333d1aad58acd37dc6a9438"

  url "https://github.com/douglas-vaz/llm-ground-zero/releases/download/v#{version}/llm-ground-zero-#{version}-universal.dmg"
  name "LLM Ground Zero"
  desc "Local AI usage advisor and shared memory for CLI coding agents"
  homepage "https://github.com/douglas-vaz/llm-ground-zero"

  depends_on macos: :monterey

  app "LLM Ground Zero.app"

  zap trash: [
    "~/Library/Application Support/LLM Ground Zero",
    "~/Library/Logs/llm-ground-zero",
  ]

  caveats <<~EOS
    This app is not code-signed, so macOS Gatekeeper will block it on
    first launch. Allow it with:
      xattr -dr com.apple.quarantine "/Applications/LLM Ground Zero.app"

    The dashboard reads data set up by the llm-ground-zero CLI tooling.
    For shared agent memory and usage tracking, also run:
      git clone https://github.com/douglas-vaz/llm-ground-zero ~/llm-ground-zero
      cd ~/llm-ground-zero && ./setup.sh
  EOS
end
