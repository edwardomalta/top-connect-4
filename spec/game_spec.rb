require_relative "../lib/game"
require_relative "../lib/display"

describe Game do
  context "when it starts" do
    subject(:game_start) { described_class.new }
    let(:Display) { double("Display") }
    before do
      game_start.instance_variable_set(:@display, Display)
      allow(Display).to receive(:show_board)
      allow(game_start).to receive(:player_input).and_return(5)
      allow(game_start).to receive(:game_over?).and_return(true)
      allow(game_start).to receive(:update_game_status).and_return(false)
    end
    it "welcomes the player" do
      message = "Welcome to a new game of Connect Four"
      expect(game_start).to receive(:puts).with(message).once
      game_start.start
    end
    it "prints the board" do
      expect(Display).to receive(:show_board).once
      game_start.start
    end
    it "makes a player move" do
      expect(game_start).to receive(:player_input).once
      game_start.start
    end
    it "ends when game_over? condition is meet" do
      expect(game_start).to receive(:game_over?).once
      game_start.start
    end
  end
  context "when receives the correct input" do
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

  describe "#update_game_status" do
    context "when it detects a winner" do
      subject(:game_winner) { described_class.new }
      let(:Display) { double("Display") }
      before do
        game_winner.instance_variable_set(:@display, Display)
        allow(Display).to receive(:show_board)
        allow(game_winner).to receive(:player_input).and_return(5)
        allow(game_winner).to receive(:game_over?).and_return(true)
      end

      it "sets the player winner" do
        allow(game_winner).to receive(:move_wins?).and_return(true)
        expect { game_winner.update_game_status }.to change { game_winner.winner }
      end
    end
  end
end
