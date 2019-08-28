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
    elsif checked_array1[0] == array_1 && checked_array2.uniq.count == 1
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

  def validate_all(ship, coordinates)
    valid = []

    coordinates.map do |coordinate|
      valid << valid_coordinate?(coordinate)
    end

    is_valid_coordinates = valid.all? { |coordinate| coordinate == true}
    is_valid_placement = valid_placement?(ship, coordinates)
    doesnt_have_ship = coordinates.find {|coordinate|
      if @cells[coordinate]
        @cells[coordinate].ship
      end
    }
    is_valid_coordinates && is_valid_placement && doesnt_have_ship == nil
  end


  def place(ship, coordinates)
    if validate_all(ship, coordinates)
      # require 'pry'; binding.pry
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    else
      "Invalid placement. Please try again."
    end
  end

  def grab_cells(default = false)
    a_cells = "A"
    @cells.values.each do |cell|
      a_cells += ' ' + cell.render(default) if cell.coordinate.start_with?("A")
    end
    b_cells = "B"
    @cells.values.each do |cell|
      b_cells += ' ' + cell.render(default) if cell.coordinate.start_with?("B")
    end
    c_cells = "C"
    @cells.values.each do |cell|
      c_cells += ' ' + cell.render(default) if cell.coordinate.start_with?("C")
    end
    d_cells = "D"
    @cells.values.each do |cell|
      d_cells += ' ' + cell.render(default) if cell.coordinate.start_with?("D")
    end
    "  1 2 3 4 \n#{a_cells} \n#{b_cells} \n#{c_cells} \n#{d_cells} \n"
  end

  def render(default = false)
    grab_cells(default)
  end

end
