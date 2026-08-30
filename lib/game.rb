require_relative "display"
require_relative "board"
require_relative "connect_explorer"

class Game
  attr_reader :winner
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
      update_game_status
      break if game_over?
      @count += 1
    end
  end

  def update_game_status
    @winner = current_player_name if move_wins?
  end

  def move_wins?
    require "pry-byebug"; binding.pry if @count > 9
    explorer = ConnectExplorer.new(@board)
    result = explorer.explore(@board.current_token_at)
    result.any? { |n| n < 3 }
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
