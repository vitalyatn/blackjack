class User
  attr_reader :bank, :name
  BET_AMOUNT = 10
  START_BALANCE = 100
  MAX_CARDS_COUNT = 3


  def initialize(name = "Jack")
    @bank = START_BALANCE
    @name = name
    @cards = []
  end

  #взять карту
  def take_card(deck)
    @cards << deck.delete(deck.sample)
    deck
  end


  #пропустить ход

  #открыть карты

  #добавить в банк

  #вычесть из банка

  #отобразить карты

end
