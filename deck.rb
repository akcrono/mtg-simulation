require 'csv'
require_relative 'card'

class Deck

  def initialize(filename)
    @cards = load_deck(filename)
  end

  def load_deck(filename)
    answer = []
    CSV.foreach(filename) do |row|
      case row[2]
        when 'Tithe', "Sensei's Divining Top", "Sol Ring"
          cost = 1
          type = 'spell'
        when "Knight of the White Orchid", "Wall of Omens"
          cost = 2
          type = 'spell'
        when 'Plains'
          cost = nil
          type = 'land'
        else
          cost = 4
          type = 'spell'
      end
      row[1].to_i.times do
        answer << Card.new(row[2], type, cost)
      end
    end
    answer
  end

  def shuffle!
    @cards.shuffle!
  end

  def add_card!(card)
    @cards << card
  end

  def draw!
    @cards.pop
  end

  def combine!(hand)
    @cards = @cards.concat(hand)
  end

  def top_3_look
    [@cards[-1], @cards[-2], @cards[-3]]
  end

  def top_swap(card)
    return_card = @cards.pop
    @cards << card
    return_card
  end

  def find_land(number = 1)
    i = 0
    @cards.each_with_index do |card, i|
      return @cards.delete_at[i] if card.type == 'land'
    end
    nil
  end

  def print_deck
    @cards.each do |card|
      puts "#{card.name}: #{card.type}, #{card.cost}"
    end
  end
end
