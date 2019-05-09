class Deck

  attr_reader :cards, :suits, :values

  def initialize
    @cards = []
    create_deck
  end

  def create_deck
   Card::SUITS.each do |suit|
     Card::VALUES.each_with_index do |value, index|
        @cards << Card.new(suit, value, Card::RANKS[index])
      end
    end
    @cards.shuffle!
  end

end

