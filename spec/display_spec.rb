require_relative "../lib/display"

describe Display do
  describe "#show_board" do
    context "when it recieves no board" do
      subject(:display_nothing) { described_class.new }
      it "says 'nothing to show" do
        allow(display_nothing).to receive(:puts).with("Nothing to show.").once
        display_nothing.show_board
      end
    end

    context "when it receives a board" do
      let(:board) { double("board") }
      subject(:display_board) { described_class.new }
      puts "1-2-3, 4, 5, 7"
      it "prints the board" do
        fake_lines = [
          [ " ", " ", " ", " ", " ", " ", " "],
          [ " ", " ", " ", " ", " ", " ", " "],
          [ " ", " ", " ", " ", " ", " ", " "],
          [ " ", " ", " ", " ", " ", " ", " "],
          [ " ", " ", " ", " ", " ", " ", " "],
          [ " ", " ", " ", " ", " ", " ", " "],
        ]
        allow(board).to receive(:lines).and_return(fake_lines)
        expect(display_board).to receive(:puts).exactly(7).times # assuming it has 6 rows
        display_board.show_board(board)
      end
    end
  end
end
