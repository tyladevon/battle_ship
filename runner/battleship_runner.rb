require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'


@computer_board = Board.new
@computer_cruiser = Ship.new("Cruiser", 3)
@computer_submarine = Ship.new("Submarine", 2)
@computer = Computer.new(@computer_board)

@player_board = Board.new
@player_cruiser = Ship.new("Cruiser", 3)
@player_submarine = Ship.new("Submarine", 2)

def start
  puts "Welcome to BATTLESHIP"
  puts "Enter p to Play. Enter q to quit"
  user_input = gets.chomp
  if user_input == "p"
    @computer.calculate_coordinates(@computer_cruiser)
    @computer.calculate_coordinates(@computer_submarine)
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is two units long and the Submarine is three units long."
    puts @player_board.render(true)
    puts "Enter the squares for the Cruiser (3 spaces):"
    puts "Separate coordinates with spaces."
    print "> "
    user_input = gets.chomp
    coordinates = user_input.split
    @player_board.place(@player_cruiser, coordinates)
    puts @player_board.render(true)
    puts "Enter the squares for the Submarine (2 spaces):"
    puts "Separate coordinates with spaces."
    print "> "
    user_input = gets.chomp
    coordinates = user_input.split
    @player_board.place(@player_submarine, coordinates)
    puts @player_board.render(true)
    # require 'pry'; binding.pry
  end

end

start
