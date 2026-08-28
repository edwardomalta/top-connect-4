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
    count = 0
    
  end
  def vertical
    count = 0
  end
  def slash
    count = 0
  end
  def backslash
    count = 0
  end
end
