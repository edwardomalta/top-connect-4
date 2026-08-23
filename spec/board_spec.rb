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

  describe "#lines" do
    subject(:board_structure) { described_class.new }

    it 'is an Array' do
      expect(board_structure.lines).to be_an(Array)
    end
    it 'has N arrays in it' do
      expect(board_structure.lines.length).to eq(board_structure.height)
    end
    it 'has in every line an array of N elements' do
      expect(board_structure.lines).to all(have_attributes(length: board_structure.width))
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
