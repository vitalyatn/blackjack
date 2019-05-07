class Card
  attr_reader :suit, :value, :rank, :cards

  SUITS = [:♣, :♦, :♥, :♠]
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, :j, :q, :k, :a]
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, [1,11]]

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end
