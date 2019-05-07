require_relative 'card'
require_relative 'deck'

deck = Deck.new
deck.cards.each {|x| puts "#{x.value}#{x.suit} = #{x.rank}"}

