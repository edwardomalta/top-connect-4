require_relative "../lib/connect_explorer"

describe ConnectExplorer do
  describe "#horizontal" do
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
    subject(:explore_full_range) { described_class.new }
    context "when receives a position" do
      it "returns an array of counts of every direction" do
        result = explore_full_range.explore(position, board)
        expect(result).to be_an(Array).and all(be_an(Integer)).and all(be >= 1)
      end
    end
  end
end
