require './lib/ship'
require './lib/cell'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class TestCell < Minitest::Test

  def setup
    @cell = Cell.new("B4")
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_for_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_if_ship_returns_nil
    assert_nil @cell.ship
  end

  def test_cell_empty
    assert_equal true, @cell.empty?
  end 
end
