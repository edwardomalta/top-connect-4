class Game
  def start
    puts "Hello 4!"
  end

  def player_input
    valid_input = "0123456"
    loop do
      puts "Select a column to enter your token:"
      column = gets.chomp
      return column.to_i if valid_input.include?(column)
      puts "Error you must insert a valid column number"
    end
  end
end
