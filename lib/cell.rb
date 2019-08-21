class Cell
  attr_reader :coordinate, :ship, :placement

  def initialize(coordinate)
    @coordinate = coordinate
    @ship
    @placement = Hash.new(0)
    @fired_upon = false
  end

  def empty?
    @placement[@coordinate] != @ship
  end

  def place_ship(ship)
    @ship = ship
    @placement[@coordinate] = @ship
  end

  def fired_upon?
    @fired_upon
  end
end
