require './lib/ship'
require './lib/cell'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class TestCell < Minitest::Test

  def setup
    @cell = Cell.new
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  
end
