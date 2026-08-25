class Board
  attr_reader :slots, :height, :width, :lines

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
    line, col = col_last_empty_slot(column)
    @lines[line][col] = symbol
  end

  def column_is_full?(column)
    column_elements = column(column)
    column_elements.none?(" ")
  end

  def column(col_nmb)
    current_lines = lines
    current_lines.map { |line| line[col_nmb] }
  end

  def col_last_empty_slot(col_nmb)
    current_column = column(col_nmb)
    line_index = current_column.rindex(" ")
    [line_index, col_nmb]
  end
end
