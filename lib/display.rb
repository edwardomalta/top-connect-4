class Display
  def show_board(board = nil)
    puts "Nothing to show." unless board
    return unless board

    print "   "
    board.width.times do |i|
      print " #{i}"
    end
    print "\n"
    
    counter = 0
    board.lines.each do |line|
      print " #{counter} |"
      print line.join("|")
      print "|\n"
      counter += 1
    end
  end
end
