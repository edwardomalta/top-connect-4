class Board
  attr_reader :slots, :height, :width

  def initialize(width = 7, height = 6)
    @slots = Array.new(42, " ")
    @width = width
    @height = height
    @lines = create_lines(width, height)
  end

  def create_lines(width, height)
    Array.new(height) { Array.new(width, " ") }
  end

  def receive_token(column, symbol)
    @slots[column] = symbol
  end

  def column_is_full?(column)
    column_elements = column(column)
    column_elements.none?(" ")
  end

  def lines
    @lines
  end
end
