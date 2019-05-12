class Game
  attr_accessor :player, :dealer, :deck, :bank
  BLACKJACK = 21
  DEAD_HEAT = 'ничья'
  MAX_DEALER_POINT = 17

  def initialize(name_player)
    @player = Player.new(name_player)
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def make_bet
    @player.sub_from_bank
    @dealer.sub_from_bank
    @bank = 2 * User::BET_AMOUNT
  end

  def return_cards(user)
    user.cards = []
  end

  def check_bank?
    @player.bank == 0 || @dealer.bank == 0
  end

  def get_cards
    2.times do
      take_card(@player)
      take_card(@dealer)
    end
  end

  def take_card(user)
    validate!(user)
    user.cards << @deck.cards.delete(@deck.cards.sample)
    rescue RuntimeError => e
      puts e.message
  end

  def define_winner
    if @player.score > @dealer.score && @player.score <= BLACKJACK ||
      @dealer.score > BLACKJACK && @player.score <= BLACKJACK
      @player
    elsif @dealer.score > @player.score && @dealer.score <= BLACKJACK ||
      @dealer.score <= BLACKJACK && @player.score > BLACKJACK
      @dealer
    else
      DEAD_HEAT
    end
  end

  def open_cards
    winner = define_winner
    if winner != DEAD_HEAT
      winner.add_to_bank(@bank)
    else
      @player.add_to_bank(@bank/2)
      @dealer.add_to_bank(@bank/2)
    end
    @bank = 0
    return_cards(@player)
    return_cards(@dealer)
    winner
  end

  private
  def validate!(user)
    raise  'Карт не может быть больше трёх' if user.cards.count == User::MAX_CARDS_COUNT
    raise  'Jack пропускает ход...' if user.is_a?( Dealer ) && user.score > MAX_DEALER_POINT
  end

end
