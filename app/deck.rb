require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    ['Spades', 'Hearts', 'Diamonds', 'Clubs'].each do |suit|
      ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King'].each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end

  def deal(number, participant)
    number.times do
      participant.hand << cards.pop
    end
  end
end