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

  def fire_upon
    if @ship != nil
      @ship.hit
    end
    @fired_upon = true
  end

  def render(default = false)
    if default == true &&  @ship != nil
      "S"
    elsif default == false && @ship == nil && @fired_upon == true
      "M"
    elsif default == false && @ship != nil && @ship.sunk? == true
      "X"
    elsif default == false && @ship != nil && @fired_upon == true
      "H"
    else
      "."
    end
  end
end
