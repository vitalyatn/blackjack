class User
  attr_accessor :bank, :name, :cards
  BET_AMOUNT = 10
  START_BALANCE = 100
  MAX_CARDS_COUNT = 3


  def initialize(name = "Jack")
    @bank = START_BALANCE
    @name = name
    @cards = []
  end

  def add_to_bank(amount)
    @bank += amount
  end

  def sub_from_bank
    @bank -= BET_AMOUNT
  end

  def score
    points ||= 0
    if points.zero?
      @cards.each do |card|
        if card.value == :a
          value = points <= 10 ? card.rank[1] : card.rank[0]
        else
          value = card.rank
        end
        points += value
      end
    end
    points
  end

end
