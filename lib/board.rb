class Board
  attr_reader :slots, :height, :width, :lines

  def initialize(height = 6, width = 7)
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

  def out_of_board?(position)
    line, col = *position
    line_range = 0..(@height - 1)
    col_range = 0..(@width - 1)
    not (line_range.include?(line)) or not (col_range.include?(col))
  end
end
