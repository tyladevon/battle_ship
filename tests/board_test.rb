require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class TestBoard < Minitest::Test

  def setup
    @ship = Ship.new("Cruiser", 3)
    @ship_1 = Ship.new("Submarine", 2)
    @board = Board.new
  end
  def test_if_exists
    assert_instance_of Board, @board
  end

  def test_for_cells_indirectly
    assert_equal false, @board.cells["A1"].fired_upon?
    @board.cells["B3"].fire_upon
    assert_equal true, @board.cells["B3"].fired_upon?
    @board.cells["D2"].fire_upon
    assert_equal true, @board.cells["D2"].fired_upon?
  end

  def test_valid_coordinate
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal false, @board.valid_coordinate?("jty")
  end

  def test_valid_placement
    assert_equal false, @board.valid_placement?(@ship, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@ship_1, ["B3", "B4"])

  end
end
