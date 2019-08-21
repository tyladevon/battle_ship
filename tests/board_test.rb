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
end
