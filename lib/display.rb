class Display
  def show_board(board = nil)
    puts "Nothing to show." unless board
    return unless board
    puts "------"
    board.lines.each do |line|
      puts line
    end
  end
end
