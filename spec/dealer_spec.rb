require 'spec_helper'
require './app/dealer'
require './app/card'
require './app/deck'
require './spec/custom/should_have_attr_accessor'

describe Dealer do
  let(:dealer) { described_class.new }
  let(:deck) { Deck.new }

  it { expect(dealer).to have_attr_accessor(:hand) }

  describe '#take_turn' do
    it 'does not add cards to dealers hand if dealers hand equals 17' do
      card1 = Card.new('King', 'Spades')
      card2 = Card.new(7, 'Hearts')
      dealer.hand << card1
      dealer.hand << card2
      dealer.take_turn(deck)

      expect(dealer.hand.size).to eq(2)
    end

    it 'does not add cards to dealers hand if dealers hand is greater than 17' do
      card1 = Card.new('King', 'Spades')
      card2 = Card.new(8, 'Hearts')
      dealer.hand << card1
      dealer.hand << card2
      dealer.take_turn(deck)

      expect(dealer.hand.size).to eq(2)
    end

    it 'keeps adding cards to dealers hand until dealer reaches 17' do
      dealer.take_turn(deck)

      expect(dealer.hand_value).to be >= 17
    end
  end
end