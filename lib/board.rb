class Board
  attr_reader :cells
  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
    }
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def array_ordered?(array_1, array_2)
    checked_array1 = array_1.chunk_while{ |num1, num2|
    num2 == num1 + 1}.to_a
    checked_array2 = array_2.chunk_while{ |num1, num2|
    num2 == num1 + 1}.to_a

    if checked_array1.count == 1 && checked_array2.count == 1
      false
    elsif checked_array1[0] == array_1 && checked_array2[0] == array_2
      true
    elsif checked_array1.uniq.count == 1 && checked_array2[0] == array_2
      true
    else
      false
    end
  end

  def valid_placement?(ship, coordinates)
    letters, nums = [], []
    coordinates.each do |coordinate|
      letters << coordinate.split(//)[0].ord
      nums << coordinate.split(//)[1].to_i
    end

    check = array_ordered?(letters, nums)

    if ship.length == coordinates.count && check == true
      true
    else
      false
    end
  end

  def place(ship, coordinates)
    valid = []

    coordinates.map do |coordinate|
      valid << valid_coordinate?(coordinate)
    end

    is_valid_coordinates = valid.all? { |coordinate| coordinate == true}
    is_valid_placement = valid_placement?(ship, coordinates)
    doesnt_have_ship = coordinates.map {|coordinate| @cells[coordinate].ship.class != Ship}.uniq[0]

    if is_valid_coordinates && is_valid_placement && doesnt_have_ship
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
    end
    else
      "Invalid placement. Please try again."
    end
  end
end
