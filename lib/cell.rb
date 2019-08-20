class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship
    @placement = Hash.new(0)
  end

  def empty?
    @placement[@coordinate] != @ship
  end
end
