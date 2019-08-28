class Computer
  attr_reader :board
  def initialize(board)
    @board = board
  end

  def calculate_coordinates(ship)
    cells = @board.cells.values
    loop do
    cell = cells.sample
    letter = cell.coordinate.split(//)[0].ord
    number = cell.coordinate.split(//)[1].to_i
       if ["horizontal", "vertical"].sample == "horizontal"
         coordinates = []
         (number..number + ship.length - 1).to_a.each do |number|
           coordinates << (letter.chr + number.to_s)
         end
         if @board.validate_all(ship, coordinates) == false
           cells.delete(cell)
           next
         end
         if @board.validate_all(ship, coordinates)
           @board.place(ship, coordinates)
           break
         end
       elsif ["horizontal", "vertical"].sample == "vertical"
         coordinates = []
         (letter..letter + ship.length - 1).to_a.each do |letter|
           coordinates << (letter.chr + number.to_s)
         end
         if @board.validate_all(ship, coordinates) == false
           cells.delete(cell)
           next
         end
         if @board.validate_all(ship, coordinates)
           @board.place(ship, coordinates)
           break
         end
       end
       if cells.count == 0
         "Computer couldn't place a ship. Please start again."
       end
    end
  end

  def computer_shot(board)
    shot = board.cells.values.sample
    shot.fire_upon
    shot
  end
end
