require './lib/ship'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class TestShip < Minitest::Test
  def setup
    @new_ship = Ship.new
  end

  def test_ship_exists
    assert_instance_of Ship, @new_ship
  end


end
