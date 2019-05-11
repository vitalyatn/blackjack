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
    print "Карты игрока #{user.name}:"
    if flag.zero?
      user.cards.each { print '| * | ' }
      puts "\nСумма очков: *"
    else
      user.cards.each { |card|  print "| #{card.value} #{card.suit}| " }
      puts "\nСумма очков: #{user.score}"
    end
  end

  def result_game
    show_cards(@game.player,1)
    show_cards(@game.dealer,1)
    win = @game.open_cards
    puts win == Game::DEAD_HEAT ? "Победила дружба!" : "Победил: #{win.name}"
    puts "Баланс игроков:
      \r#{@game.player.name}: #{@game.player.bank}
      \r#{@game.dealer.name}: #{@game.dealer.bank}"
  end

  def start_game
    user_registration
    loop do
      raise "Игру продолжить невозможно" if @game.check_bank?
      @game.deck = Deck.new
      @game.get_cards
      @game.make_bet
      show_cards(@game.player,1)
      show_cards(@game.dealer)
      loop do
        show_dialog
        act = gets.chomp.to_i
        case act
        when 1
          @game.take_card(@game.player)
          show_cards(@game.player, 1)
        when 2
          @game.take_card(@game.dealer)
          show_cards(@game.dealer)
        when 3
          result_game
          break
        else
          puts "Неизвестное действие"
        end
      end
      puts "Сыграть еще?(введите 'д' или 'н')"
      break if gets.chomp == 'н'
      rescue
        puts "Баланс пустой! Играть дальше невозможно!"
        break
    end
  end
end
