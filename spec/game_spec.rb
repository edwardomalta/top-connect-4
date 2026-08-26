require_relative "../lib/game"

describe Game do
  context "when it starts" do
    subject(:game_start) { described_class.new }
    it "says hello" do
      expect(game_start).to receive(:puts).with("Hello 4!").once
      game_start.start
    end
  end
  context "when it receives the correct input" do
    subject(:game_input) { described_class.new }
    number_input = '5'
    before do
      allow(game_input).to receive(:gets).and_return(number_input)
      allow(game_input).to receive(:puts)
    end
    it "returns number: #{number_input} " do
      expect(game_input.player_input).to be_an(Integer)
      expect(game_input.player_input).to eq(5)
    end
  end
end
