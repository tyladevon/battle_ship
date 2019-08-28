require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'

def start
  loop do
    puts "Welcome to BATTLESHIP"
    puts "Enter p to Play. Enter q to quit"

    user_input = gets.chomp.downcase
    if user_input == "p"

      @computer_board = Board.new
      @computer_cruiser = Ship.new("Cruiser", 3)
      @computer_submarine = Ship.new("Submarine", 2)
      @computer = Computer.new(@computer_board)

      @player_board = Board.new
      @player_cruiser = Ship.new("Cruiser", 3)
      @player_submarine = Ship.new("Submarine", 2)

      @computer.calculate_coordinates(@computer_cruiser)
      @computer.calculate_coordinates(@computer_submarine)

      puts "I have laid out my ships on the grid."
      puts "You now need to lay out your two ships."
      puts "The Cruiser is two units long and the Submarine is three units long."

      puts @player_board.render(true)
      puts "Enter the squares for the Cruiser (3 spaces):"
      puts "Separate coordinates with spaces."

      loop do
        print "> "
        user_input = gets.chomp.upcase
        coordinates = user_input.split
        if @player_board.validate_all(@player_cruiser, coordinates)
          @player_board.place(@player_cruiser, coordinates)
          break
        end
        puts @player_board.place(@player_cruiser, coordinates)
      end
      puts @player_board.render(true)
      puts "Enter the squares for the Submarine (2 spaces):"
      puts "Separate coordinates with spaces."
      loop do
        print "> "
        user_input = gets.chomp.upcase
        coordinates = user_input.split
        if @player_board.validate_all(@player_submarine, coordinates)
          @player_board.place(@player_submarine, coordinates)
          break
        end
        puts @player_board.place(@player_submarine, coordinates)
      end
      until @computer_cruiser.sunk? && @computer_submarine.sunk? || @player_cruiser.sunk? && @player_submarine.sunk?
        puts "=============COMPUTER BOARD============="
        puts @computer_board.render
        puts "==============PLAYER BOARD=============="
        puts @player_board.render(true)
        loop do
          puts ''
          puts "Enter the coordinate for your shot:"
          print "> "
          user_input = gets.chomp.upcase
          puts ''
          coordinate = user_input
          if @computer_board.valid_coordinate?(user_input) && @computer_board.cells[user_input].fired_upon? == true
            puts "This cell has already been fired upon. Please try again."
            next
          elsif @computer_board.valid_coordinate?(user_input)
            @computer_board.cells[user_input].fire_upon
            break
          end
          puts "Invalid coordinate. Please try again."
        end
        computer_shot = @computer.computer_shot(@player_board)
        computer_shot
        if @computer_board.cells[user_input].render == "M"
          puts "Your shot on #{user_input} was a miss."
        elsif @computer_board.cells[user_input].render == "H"
          puts "Your shot on #{user_input} was a hit."
        elsif @computer_board.cells[user_input].render == "X"
          puts "Your shot on #{user_input} sunk their ship!"
        end
        if computer_shot.render == "M"
          puts "My shot on #{computer_shot.coordinate} was a miss."
        elsif computer_shot.render == "H"
          puts "My shot on #{computer_shot.coordinate} was a hit."
        elsif computer_shot.render == "X"
          puts "My shot on #{computer_shot.coordinate} sunk your ship!"
        end
        puts ''
      end
      puts "=============COMPUTER BOARD============="
      puts @computer_board.render(true)
      puts "==============PLAYER BOARD=============="
      puts @player_board.render(true)
      if @computer_cruiser.sunk? && @computer_submarine.sunk?
        puts "You won!"
      else
        puts "I won!"
      end
    else
      break
    end
  end
end
start
