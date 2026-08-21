require_relative "../lib/board"

describe Board do
  describe "#receive_token" do
    context "when it receives a move" do
      subject(:board_token) { described_class.new }
      it "registers and update its state" do
        expect { board_token.receive_token(1, "O") }.to change(board_token, :slots)
      end
    end
  end
  
  describe "#column_is_full?" do
    context "when a column is full" do
      subject(:board_full_column) { described_class.new }
      it "returns true" do
        allow(board_full_column).to receive(:column).and_return(["X", "X", "X", "X"])
        result = board_full_column.column_is_full?(1)
        expect(result).to be(true)
      end
    end
  end
end
