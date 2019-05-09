class User
  attr_reader :bank, :name, :points, :cards
  BET_AMOUNT = 10
  START_BALANCE = 100
  MAX_CARDS_COUNT = 3

 #признак, по которому отображаются либо *, либо норм значения у диллера
  @@flag = 0
  def self.flag
    @@flag
  end

  def initialize(name = "Jack")
    @bank = START_BALANCE
    @name = name
    @cards = []
    @points = 0
  end

  #взять карту
  def take_card(deck)
    @cards << deck.cards.delete(deck.cards.sample)
    sum_of_point(@cards.last)
    if @points > 21
      raise "Пербор"
    end
  end

  #отобразить карты
  def show_cards
    str = ""
    @cards.each {|card|  str += "| #{card.value} #{card.suit}| " }
    str += "\nСумма очков: #{@points}"
  end

  def return_cards
   @cards = []
   @points = 0
   @@flag = 0
  end

  def self.open_cards(player, dealer)
    @@flag = 1
    puts "Ваши карты:"
    puts "  #{player.show_cards}"
    puts "Карты диллера:"
    puts "  #{dealer.show_cards}"
    if player.points > dealer.points && player.points < 21
      player.add_to_bank
      dealer.sub_from_bank
      puts "Вы победили. Ваш банк = #{player.bank}"
    elsif dealer.points > player.points || player.points > 21
      dealer.add_to_bank
      player.sub_from_bank
      puts "Вы проиграли. Ваш банк = #{player.bank}"
    else
      puts "Ничья"
    end
    player.return_cards
    dealer.return_cards
  end

  def add_to_bank
    @bank += 10
  end

  def sub_from_bank
    @bank -= 10
  end


  private

  def sum_of_point(card)
    value = 0
    if card.value == :a
      if points <= 10
        value = card.rank[1]
      else
        value = card.rank[0]
      end
    else
      value = card.rank
    end
    @points += value
  end




end
