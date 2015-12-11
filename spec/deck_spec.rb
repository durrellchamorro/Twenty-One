require 'spec_helper'
require './spec/custom/should_have_attr_accessor'
require './app/deck'

describe Deck do
  let(:deck) { Deck.new }

  it { expect(deck).to have_attr_accessor(:cards) }

  describe '#initialize' do
    it 'creates a deck with 52 cards' do
      deck = Deck.new

      expect(deck.cards.size).to eq(52)
    end

    it 'creates a deck with 13 Spades' do
      suit = Deck.new.cards.select { |card| card.suit == 'Spades' }

      expect(suit.size).to eq(13)
    end

    it 'creates a deck with 13 Hearts' do
      suit = Deck.new.cards.select { |card| card.suit == 'Hearts' }

      expect(suit.size).to eq(13)
    end

    it 'creates a deck with 13 Diamonds' do
      suit = Deck.new.cards.select { |card| card.suit == 'Diamonds' }

      expect(suit.size).to eq(13)
    end

    it 'creates a deck with 13 Clubs' do
      suit = Deck.new.cards.select { |card| card.suit == 'Clubs' }

      expect(suit.size).to eq(13)
    end

    it 'creates a deck with 4 of every value' do
      random_value = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King'].sample
      four_cards = Deck.new.cards.select { |card| card.value == random_value }
      expect(four_cards.size).to eq(4)

      random_value = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King'].sample
      four_cards = Deck.new.cards.select { |card| card.value == random_value }
      expect(four_cards.size).to eq(4)

      random_value = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King'].sample
      four_cards = Deck.new.cards.select { |card| card.value == random_value }
      expect(four_cards.size).to eq(4)
    end
  end

  describe '#deal' do
    it "deals the correct number of cards to the participant's hand" do
      bob = Player.new
      deck = Deck.new
      deck.deal(1, bob)

      expect(bob.hand.size).to eq(1)
    end

    it "deals the correct number of cards to the participant's hand" do
      bob = Dealer.new
      deck = Deck.new
      deck.deal(2, bob)

      expect(bob.hand.size).to eq(2)
    end

    it 'reduces the number of cards in the deck by the number of cards dealt' do
      bob = Player.new
      deck = Deck.new
      deck.deal(1, bob)

      expect(deck.cards.size).to eq(51)
    end
  end
end