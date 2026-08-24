class Display
  def show_board(board = nil)
    puts "Nothing to show." unless board
    return unless board

    board.width.times do |i|
      print " #{i}"
    end
    print "\n"

    board.lines.each do |line|
      print "|"
      print line.join("|")
      print "|\n"
    end
  end
end
