class Dealer < User

  def show_cards
    if @@flag == 1
      super
    else
      str = ""
      @cards.each {|card|  str += "| * | " }
      str += "\nСумма очков: * "
    end
  end
end
