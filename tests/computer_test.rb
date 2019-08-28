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
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @computer = Computer.new(@computer_board)
  end

  def test_if_exists
    assert_instance_of Computer, @computer
  end

  def test_computer_can_take_board
    assert_instance_of Board, @computer.board
  end

  def test_if_placed_ship
    @computer.calculate_coordinates(@computer_cruiser)
    x = @computer.board.cells.values.count do |cell|
      cell.ship != nil
    end
    assert_equal 3, x
  end

  # def test_if_computer_fails
  #   assert_equal "Computer couldn't place a ship. Please start again.", @computer.calculate_coordinates(@computer_cruiser)
  # end

end
