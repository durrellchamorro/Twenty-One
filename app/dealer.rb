require_relative 'hand'
require_relative 'participant'

class Dealer < Participant
  include Hand

  attr_accessor :hand

  def initialize
    @hand = []
  end

  def take_turn(deck)
    deck.deal(1, self) until hand_value >= 17
  end
end