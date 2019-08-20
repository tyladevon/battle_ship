require './lib/ship'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class TestShip < Minitest::Test
  def setup
    @new_ship = Ship.new("Ship", 3)
  end

  def test_ship_exists
    assert_instance_of Ship, @new_ship
  end

  def test_it_has_a_name
    assert_equal "Ship", @new_ship.name
  end

  def test_for_length
    assert_equal 3, @new_ship.length
  end

  def test_for_health
    assert_equal 3, @new_ship.health
  end

  def test_for_sunk
    assert_equal false, @new_ship.sunk?
  end

  def test_for_hit
    @new_ship.hit
    assert_equal 2, @new_ship.health 
  end

end
