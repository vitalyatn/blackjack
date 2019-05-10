class Dealer < User

  def show_cards(flag = 0)
    if flag == 1
      super
    else
      str = "Карты игрока #{@name}:\n"
      @cards.each {|card|  str += "| * | " }
      str += "\nСумма очков: * \n"
    end
  end
end
