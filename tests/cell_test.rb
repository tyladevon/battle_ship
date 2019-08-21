require './lib/ship'
require './lib/cell'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class TestCell < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @ship = Ship.new("Cruiser", 3)
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
    @cell.place_ship(@ship)
    assert_equal false, @cell.empty?
  end

  def test_if_ship_is_placed
    @cell.place_ship(@ship)

    assert_instance_of Ship, @cell.placement[@cell.coordinate]
  end

  def test_ship_takes_ship
    @cell.place_ship(@ship)

    assert_equal @ship, @cell.ship
  end

  def test_for_fired_upon
    assert_equal false, @cell.fired_upon?
  end
end
