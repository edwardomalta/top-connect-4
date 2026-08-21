class Board
  attr_reader :slots

  def initialize
    @slots = Array.new(42, " ")
  end

  def receive_token(column, symbol)
    @slots[column] = symbol
  end

  def column_is_full?(column)
    column_elements = column(column)
    column_elements.none?(" ")
  end
end
