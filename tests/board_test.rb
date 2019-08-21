require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class TestBoard < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @ship = Ship.new("Cruiser", 3)
    @cell_2 = Cell.new("A1")
    @board = Board.new
  end

  def test_if_exists
    assert_instance_of Board, @board
  end
end
