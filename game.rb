require_relative 'deck'
require 'pry'

class Game
  def initialize(filename)
    @deck = Deck.new(filename)
    @hand = []
    @lands = []
    @graveyard = []
  end

  def reset!
    @deck.combine!(@hand)
    @deck.combine!(@lands)
    @deck.combine!(@graveyard)
    @deck.shuffle!
    7.times { draw! }

  end

  def simulate(params)
  #params includes first: (default false), and tolerance: (default 0) lands greater than 4
    reset!
    4.times { take_a_turn(params[first]) }
    return true if is_win?(params[tolerance] ? params[tolerance] : 0)
    false
  end

  def draw!
    card = @deck.draw
  end


  def take_a_turn(is_first)
    draw!
    play_land!
    cast_spell!(is_first)
  end

  def play_land!
    @hand.each_with_index |card, i| do
      if card.type == 'land'
        @lands << @hand.delete_at(i)
        break
      end
    end

  end

  def cast_spell!(is_first)

  end

  def is_win?(tolerance)

  end

  def print_deck
    @deck.print_deck
  end

  def print_hand
    @hand.each do |card|
      puts card.name
    end
  end
end

