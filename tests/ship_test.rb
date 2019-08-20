require './lib/ship'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class TestShip < Minitest::Test
  def setup
    @new_ship = Ship.new("Ship")
  end

  def test_ship_exists
    assert_instance_of Ship, @new_ship
  end

  def test_it_has_a_name
    assert_equal "Ship", @new_ship.name
  end

end
