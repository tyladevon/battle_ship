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
    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]
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
    assert_equal false, @board.valid_placement?(@ship, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@ship_1, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@ship, ["A1", "B2", "C3"])
  end

  def test_for_placed_ship
    @board.place(@ship, ["A1", "A2", "A3"])

    assert_equal @ship, @cell_1.ship
    assert_equal @ship, @cell_2.ship
    assert_equal @ship, @cell_3.ship
    assert_equal "Invalid placement. Please try again.", @board.place(@ship, ["A1", "A2", "A6"])
    assert_equal "Invalid placement. Please try again.", @board.place(@ship_1, ["A1", "A2"])
  end
end
