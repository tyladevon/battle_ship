class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship
    @placement = {
      @coordinate => @coordinate
    }
  end

  def empty?
    @placement.values[0] != @ship
  end
end
