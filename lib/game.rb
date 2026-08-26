require_relative "display"
require_relative "board"

class Game
  def initialize
    @display = Display.new
    @board = Board.new
    @players = [
      { name: "Player Two", symbol: "X" },
      { name: "Player One", symbol: "O" }
    ]
    @count = 1
  end

  def start
    puts "Welcome to a new game of Connect Four"
    loop do
      @display.show_board(@board)
      @board.receive_token(player_input, current_player_symbol)
      break if game_over?
      @count += 1
    end
  end

  def player_input
    valid_input = "0123456"
    loop do
      puts "#{current_player_name} select a column to enter your token:"
      column = gets.chomp
      return column.to_i if valid_input.include?(column)
      puts "Error you must insert a valid column number"
    end
  end

  def current_player_name
    @players[@count % 2][:name]
  end

  def current_player_symbol
    @players[@count % 2][:symbol]
  end

  def game_over?
    @count > 42
  end
end
