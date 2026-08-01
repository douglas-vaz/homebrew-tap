cask "llm-ground-zero" do
  version "0.3.4"
  sha256 "99c1f6f794dc985e43b46db5329de1f62e61454140abc889fc64ea8da6867c5f"

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
    The dashboard reads data set up by the llm-ground-zero CLI tooling.
    For shared agent memory and usage tracking, also run:
      git clone https://github.com/douglas-vaz/llm-ground-zero ~/llm-ground-zero
      cd ~/llm-ground-zero && ./setup.sh
  EOS
end
