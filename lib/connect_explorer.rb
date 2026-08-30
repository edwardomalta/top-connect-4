require_relative "pointer"

class ConnectExplorer 
  FORWARD = 1
  BACKWARD = -1

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

  def symbol_counter(cardinal_move, direction)
    count = 0
    pointer = Pointer.new(@position, @board.lines)
    loop do
      pointer.send(cardinal_move, direction)
      break if @board.out_of_board?(pointer.current_position) or 
        @board.different_symbols?(pointer.origin, pointer.current_position)
      count += 1
    end
    count
  end

  def horizontal
    move = :move_horizontal
    symbol_counter(move, FORWARD) + 
    symbol_counter(move, BACKWARD)
  end
  def vertical
    move = :move_vertical
    symbol_counter(move, FORWARD) + 
    symbol_counter(move, BACKWARD)
  end
  def slash
    move = :move_slash
    symbol_counter(move, FORWARD) + 
    symbol_counter(move, BACKWARD)
  end
  def backslash
    move = :move_backslash
    symbol_counter(move, FORWARD) + 
    symbol_counter(move, BACKWARD)
  end
end
