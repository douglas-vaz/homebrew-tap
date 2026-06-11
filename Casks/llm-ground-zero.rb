cask "llm-ground-zero" do
  version "0.1.2"
  sha256 "d9364e0aa8982682014b66415c22740001bc4163655413ca1efa7a7bd7f2821a"

  url "https://github.com/douglas-vaz/llm-ground-zero/releases/download/v#{version}/llm-ground-zero-#{version}-universal.dmg"
  name "LLM Ground Zero"
  desc "Shared memory and usage dashboard for CLI coding agents"
  homepage "https://github.com/douglas-vaz/llm-ground-zero"

  depends_on macos: :big_sur

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
