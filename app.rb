require_relative 'game'

game = Game.new('white land draw.deck')

game.print_deck
puts "hand\n\n"
game.print_hand
