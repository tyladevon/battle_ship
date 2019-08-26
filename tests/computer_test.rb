require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class ComputerTest < Minitest::Test
  def setup
    @computer_board = Board.new
    @computer = Computer.new(@computer_board)
  end

  def test_if_exists
    assert_instance_of Computer, @computer
  end

  def test_computer_can_take_board
    assert_instance_of Board, @computer.board
  end
end
