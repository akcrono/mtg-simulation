require 'minitest/autorun'
require_relative 'card'

class DeckTest < MiniTest::Unit::TestCase

  def setup
    @test_deck = Deck.new('white land draw.deck')
  end

  def count_test
    assert_equal 60, @test_deck.count
  end

end
