class Pointer
  attr_reader :origin, :current_position, :symbol
  def initialize(origin, matrix = nil)
    @origin = origin # it will be an array for now
    @current_position = @origin.dup
    @matrix = matrix
    @symbol = current_symbol if matrix
  end

  def move_horizontal(steps)
    @current_position[1] += steps
  end

  def move_vertical(steps)
    @current_position[0] += steps
  end

  def move_slash(steps)
    @current_position[0] -= steps
    @current_position[1] += steps
  end

  def move_backslash(steps)
    @current_position[0] -= steps
    @current_position[1] -= steps
  end

  def current_symbol
    #require "pry-byebug"; binding.pry;
    @matrix[@current_position[0]][@current_position[1]]
  end
end

# tal vez para el futuro
class Point
  attr_accessor :line, :col
  def initialize(line, col)
    @line = line
    @col = col
  end

  def initialize_copy(original)
    super
  end
end
