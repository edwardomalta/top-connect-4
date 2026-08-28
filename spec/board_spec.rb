require_relative "../lib/board"

describe Board do
  describe "#receive_token" do
    context "when it receives a move" do
      subject(:board_token) { described_class.new }
      it "registers and update its state" do
        lines = board_token.lines
        expect { board_token.receive_token(1, "O") }.to change { board_token.lines }
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

  describe "#column" do
    subject(:board_column) { described_class.new }
    it "returns an array of lenght of the @height" do
      column_nmb = 2
      result = board_column.column(column_nmb)
      expect(result.length).to eq(board_column.height)
    end
  end

  describe "#col_last_empty_slot" do
    subject(:board_empty_slot) { described_class.new }
    context "when the column is empty" do
      before do
        allow(board_empty_slot).to receive(:column).and_return(
          Array.new(board_empty_slot.height, " ") 
        )
      end
      it "returns the index of the last slot: line 5" do
        col_nmb = 2
        line, col = board_empty_slot.col_last_empty_slot(col_nmb)
        expect(line).to eq(5)
        expect(col).to eq(2)
      end
    end

    context "when the column has 3 used slots" do
      before do
        my_col = Array.new(board_empty_slot.height, " ")
        3.times do |i|
          my_col[-(i+1)] = "X"
        end
        allow(board_empty_slot).to receive(:column).and_return(my_col)
      end
      it "returns line 2" do
        col_nmb = 3
        line, col = board_empty_slot.col_last_empty_slot(col_nmb)
        expect(line).to eq(2)
        expect(col).to eq(3)
      end
    end
  end

  describe "#out_of_board?" do
    subject(:board) { described_class.new }
    context "when the position is inside the board" do
      it "is false" do
        inboard = [0, 0]
        expect(board.out_of_board?(inboard)).to be(false)
      end
    end
    context "when the position is out of the board" do
      it "is true if -1, -1" do
        outboard = [-1, -1]
        expect(board.out_of_board?(outboard)).to be(true)
      end
      it "is true if 6, 7 (limits of the default board)" do
        outboard = [6, 7]
        expect(board.out_of_board?(outboard)).to be(true)
      end
    end
  end
end
