require_relative 'card'
require_relative 'deck'
require_relative 'user'
require_relative 'player'
require_relative 'dealer'

  puts "Введите имя:"
  name_player = gets.chomp
  player = Player.new(name_player)
  puts "Начинаем игру. Против вас играет Jack"
  dealer = Dealer.new

loop do
  if player.bank == 0 || dealer.bank == 0
    puts "Игру продолжить невозможно"
    break
  end
  deck = Deck.new

  2.times do
    player.take_card(deck)
    dealer.take_card(deck)
  end

  puts "Ваши карты:"
  puts player.show_cards

  puts "Карты противника:"
  puts dealer.show_cards
  #puts "Сумма очков: #{player.points}"

  loop do
    puts "Что дальше?
    1 - взять карту
    2 - пропустить ход
    3 - открыть карты"

    act = gets.chomp.to_i

    case act
    when 1
      begin
        player.take_card(deck)
        puts player.show_cards
        puts ""
      rescue RuntimeError => e
        puts "#{e.message}"
        User.open_cards(player, dealer)
        break
      end
    when 2
      dealer.take_card(deck) if dealer.points <= 17
      puts dealer.show_cards
    when 3
      User.open_cards(player, dealer)
      break
    else
      puts "Неизвестное действие"
    end
  end
  puts "Сыграть еще?(введите 'д' или 'н')"
  break if gets.chomp == 'н'

end
#dealer.show_cards



