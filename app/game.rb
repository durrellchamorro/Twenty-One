require_relative 'dealer'
require_relative 'deck'
require_relative 'player'

class Game
  attr_accessor :deck, :dealer, :player

  def initialize
    @deck = Deck.new
    @dealer = Dealer.new
    @player = Player.new
  end

  def play
    system 'clear'
    puts "Let's play twenty-one."
    shuffle_cards!
    deal_initial_cards
    show_dealers_face_up_card
    show_players_cards
    gameplay_loop
    show_final_cards
    puts "Good Bye"
  end

  private

  def shuffle_cards!
    deck.cards.shuffle!
  end

  def deal_initial_cards
    deck.deal(2, dealer)
    deck.deal(2, player)
  end

  def show_dealers_face_up_card
    value = dealer.hand.last.value
    suit = dealer.hand.last.suit
    puts "Dealers face up card: #{value} of #{suit} "
  end

  def show_players_cards
    player.show_cards
  end

  def gameplay_loop
    player.take_turn(deck)
    dealer.take_turn(deck)
    announce_game_outcome
  end

  def enumerate_gameplay_results
    case
    when player.hand_busted?
      -1
    when dealer.hand_busted?
      1
    when player.hand_value < dealer.hand_value
      -2
    when player.hand_value > dealer.hand_value
      2
    when player.hand_value == dealer.hand_value
      0
    end
  end

  def announce_game_outcome
    result = ""
    case enumerate_gameplay_results
    when -1
      result << "You busted!"
    when 1
      result << "You win! The dealer busted!"
    when -2
      result << "Dealer wins!"
    when 2
      result << "You won!"
    else
      result << "Push."
    end
    system 'clear'
    puts result
  end

  def show_final_cards
    puts "Final cards:"
    show_players_cards
    dealer.show_cards
  end
end

Game.new.play