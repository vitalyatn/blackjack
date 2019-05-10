class Game
  attr_accessor :player, :dealer, :deck, :bank
  BLACKJACK = 21
  DEAD_HEAT = 'ничья'

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
    user.points = 0
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
    if valid?(user)
      user.cards << @deck.cards.delete(@deck.cards.sample)
      user.sum_of_point(user.cards.last)
    end
  end

  def valid?(user)
    validate!(user)
      true
    rescue StandardError
      false
  end

  def define_winner
    if @player.points > @dealer.points && @player.points <= BLACKJACK || @dealer.points > BLACKJACK && @player.points <= BLACKJACK
      @player
    elsif @dealer.points > @player.points && @dealer.points <= BLACKJACK || @dealer.points <= BLACKJACK && @player.points > BLACKJACK
      @dealer
    else
      DEAD_HEAT
    end
  end

  def open_cards
    total_of_game = ""
    total_of_game += @player.show_cards
    total_of_game += @dealer.show_cards(1)
    winner = define_winner
    if winner != DEAD_HEAT
      winner.add_to_bank(@bank)
      total_of_game += "Победил: #{winner.name}.
      \rБаланс #{@player.name} = #{@player.bank}
      \rБаланс #{@dealer.name} = #{@dealer.bank}"
    else
      @player.add_to_bank(@bank/2)
      @dealer.add_to_bank(@bank/2)
      total_of_game += "ПОБЕДИЛА ДРУЖБА!"
    end
    @bank = 0
    return_cards(@player)
    return_cards(@dealer)
    total_of_game
  end

  private
  def validate!(user)
       raise 'Карт не может быть больше трёх' if user.cards.count == User::MAX_CARDS_COUNT
  end

end
