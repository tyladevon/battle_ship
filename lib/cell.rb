
class Cell
  attr_reader :coordinate, :ship, :placement

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.class != Ship
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @ship != nil && !fired_upon?
      @ship.hit
    end
    @fired_upon = true
  end

  def render(default = false)
    if default == true &&  @ship != nil && @fired_upon == false
      "S"
    elsif @ship != nil && @ship.sunk? == true
      "X"
    elsif @ship == nil && @fired_upon == true
      "M"
    elsif @ship != nil && @fired_upon == true
      "H"
    else
      "."
    end
  end
end
