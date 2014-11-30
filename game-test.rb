require 'minitest/autorun'
require_relative 'deck'

class GameTest < MiniTest::Unit::TestCase

  def setup
    @test_game = Game.new('white land draw.deck')
  end



end
