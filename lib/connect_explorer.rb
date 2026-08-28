require_relative "pointer"

class ConnectExplorer 
  def initialize(board)
    @board = board
  end
  def explore(position)
    @position = position
    [
      (1 + horizontal),
      (1 + vertical), 
      (1 + slash), 
      (1 + backslash)
    ]
  end
  def horizontal
    count_forward = 0
    pointer_forward = Pointer.new(@position, @board.lines)
    loop do
      pointer_forward.move_horizontal(1)
      break if (pointer_forward.symbol != pointer_forward.current_symbol) or @board.out_of_board?(pointer_forward.current_position)
      count_forward += 1
    end
    count_backward = 0
    pointer_backward = Pointer.new(@position, @board.lines)
    loop do
      pointer_backward.move_horizontal(-1)
      break if (pointer_backward.symbol != pointer_backward.current_symbol) or @board.out_of_board?(pointer_backward.current_position)
      count_backward +=1
    end
    count_forward + count_backward
  end
  def vertical
    count_forward = 0
    pointer_forward = Pointer.new(@position, @board.lines)
    loop do
      pointer_forward.move_vertical(1)
      break if (pointer_forward.symbol != pointer_forward.current_symbol) or @board.out_of_board?(pointer_backward.current_position)
      count_forward += 1
    end
    count_backward = 0
    pointer_backward = Pointer.new(@position, @board.lines)
    loop do
      pointer_backward.move_vertical(-1)
      break if (pointer_backward.symbol != pointer_backward.current_symbol) or @board.out_of_board?(pointer_backward.current_position)
      count_backward += 1
    end
    count_forward + count_backward
  end
  def slash
    count = 0
  end
  def backslash
    count = 0
  end
end
