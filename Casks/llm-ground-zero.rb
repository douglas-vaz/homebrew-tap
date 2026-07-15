cask "llm-ground-zero" do
  version "0.3.1"
  sha256 "9c63bcc57e1b9f59d6b089b4667c77c8e61f994c4b06604ad8ddb060d898de1d"

  url "https://github.com/douglas-vaz/llm-ground-zero/releases/download/v#{version}/llm-ground-zero-#{version}-universal.dmg"
  name "LLM Ground Zero"
  desc "Local AI usage advisor, token savings, and shared memory for CLI coding agents"
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
