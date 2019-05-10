class User
  attr_accessor :bank, :name, :points, :cards
  BET_AMOUNT = 10
  START_BALANCE = 100
  MAX_CARDS_COUNT = 3


  def initialize(name = "Jack")
    @bank = START_BALANCE
    @name = name
    @cards = []
    @points = 0
  end

  #отобразить карты
  def show_cards(flag = 0)
    str = "Карты игрока #{@name}:\n"
    @cards.each {|card|  str += "| #{card.value} #{card.suit}| " }
    str += "\nСумма очков: #{@points}\n"
  end

  def add_to_bank(amount)
    @bank += amount
  end

  def sub_from_bank
    @bank -= BET_AMOUNT
  end

  def sum_of_point(card)
    if card.value == :a
      value = points <= 10 ? card.rank[1] : value = card.rank[0]
    else
      value = card.rank
    end
    @points += value
  end
end
