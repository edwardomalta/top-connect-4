require_relative "../lib/connect_explorer"
require_relative "../lib/board"

describe ConnectExplorer do
  describe "#horizontal" do
    context "when there are [ x, (x), x]" do
      board = Board.new(3, 3)
      board.receive_token(0, "X")
      board.receive_token(1, "X")
      board.receive_token(2, "X")
      subject(:explorer_horizontal) { described_class.new(board) }
      it "returns the count of simbols in both directions (2)" do
        explorer_horizontal.instance_variable_set(:@position, [2, 1])
        expect(explorer_horizontal.horizontal).to eq(2)
      end
    end
  end
  describe "#vertical" do
  end
  describe "#slash" do
  end
  describe "#backslash" do
  end
  describe "#explore" do
    let(:board) { double("board") }
    position = [4, 5]
    subject(:explore_full_range) { described_class.new(board) }
    context "when receives a position" do
      it "returns an array of counts of every direction" do
        result = explore_full_range.explore(position)
        expect(result).to be_an(Array).and all(be_an(Integer)).and all(be >= 1)
      end
    end
  end
end
