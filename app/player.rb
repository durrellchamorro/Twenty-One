require_relative 'hand'
require_relative 'participant'

class Player < Participant
  include Hand

  attr_accessor :hand

  def initialize
    @hand = []
  end

  def take_turn(deck)
    loop do
      break if hand_busted? || players_choice == 's'
      deck.deal(1, self)
      show_cards
    end
  end

  private

  def ask_player_to_hit_or_stay
    puts "Hit or stay? Enter 'h' or 's'"
  end

  def obtain_players_choice_to_hit_or_stay
    gets.strip.downcase
  end

  def players_choice
    ask_player_to_hit_or_stay
    choice = obtain_players_choice_to_hit_or_stay
    players_choice until ['h', 's'].include? choice
    choice
  end
end