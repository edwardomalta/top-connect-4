require_relative "../lib/game"

describe Game do
  context "when it starts" do
    subject(:game_start) { described_class.new }
    it "says hello" do
      expect(game_start).to receive(:puts).with("Hello 4!").once
      game_start.start
    end
  end
end
