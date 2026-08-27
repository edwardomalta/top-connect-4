class Pointer
  attr_reader :origin, :current_position
  def initialize(origin)
    @origin = origin # it will be an array for now
    @current_position = @origin.dup
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
