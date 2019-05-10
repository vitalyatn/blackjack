class Interface

  def user_registration
    puts "Введите имя:"
    name_player = gets.chomp
    @game = Game.new(name_player)
    puts "Начинаем игру. Против вас играет Jack"
  end

  def show_dialog
    puts "Что дальше?
      1 - взять карту
      2 - пропустить ход
      3 - открыть карты"
  end

  def show_cards (user, flag = 0)
    puts user.show_cards(flag)
  end

   def start_game
    user_registration
    loop do
      raise "Игру продолжить невозможно" if @game.check_bank?
      @game.deck = Deck.new
      @game.get_cards
      @game.make_bet
      show_cards(@game.player)
      show_cards(@game.dealer)
      loop do
        show_dialog
        act = gets.chomp.to_i
        case act
        when 1
          @game.take_card(@game.player)
          show_cards(@game.player)
        when 2
          @game.take_card(@game.dealer) if @game.dealer.points <= 17
          show_cards(@game.dealer)
        when 3
          puts @game.open_cards
          break
        else
          puts "Неизвестное действие"
        end
      end
    puts "Сыграть еще?(введите 'д' или 'н')"
    break if gets.chomp == 'н'
      end
    end
end
