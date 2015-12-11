require 'spec_helper'
require './app/dealer'
require './app/player'
require './app/card'

describe Hand do
  let(:dealer) { Dealer.new }
  let(:player) { Player.new }

  describe '#hand_value' do
    it 'returns 0 if the hand is empty' do
      expect(dealer.hand_value).to eq 0
    end

    it 'returns 10 if the hand has one Jack, Queen, or King' do
      card = Card.new('JackQueenOrKing', 'Spades')
      dealer.hand << card

      expect(dealer.hand_value).to eq 10
    end

    it 'returns the correct number 2-10 given the corresponding card value' do
      card1 = Card.new(2, 'Diamonds')
      card2 = Card.new(10, 'Hearts')
      card3 = Card.new(7, 'Spades')
      dealer.hand << card1
      expect(dealer.hand_value).to eq 2

      dealer.hand << card2
      expect(dealer.hand_value).to eq 12

      dealer.hand << card3
      expect(dealer.hand_value).to eq 19
    end

    it 'returns 11 when the card is an ace' do
      card = Card.new('Ace', 'Diamonds')
      dealer.hand << card

      expect(dealer.hand_value).to eq 11
    end

    it 'counts the ace as 1 when the initial hand value is over 21' do
      card1 = Card.new(10, 'Diamonds')
      card2 = Card.new(10, 'Hearts')
      card3 = Card.new('Ace', 'Diamonds')
      player.hand << card1
      player.hand << card2
      player.hand << card3

      expect(player.hand_value).to eq 21
    end

    it 'counts the second ace as 1 if hand value is still over 21' do
      card1 = Card.new(10, 'Diamonds')
      card2 = Card.new(10, 'Hearts')
      card3 = Card.new('Ace', 'Diamonds')
      card4 = Card.new('Ace', 'Hearts')
      dealer.hand << card1
      dealer.hand << card2
      dealer.hand << card3
      dealer.hand << card4

      expect(dealer.hand_value).to eq 22
    end

    it 'counts the third ace as 1 if the hand value is still over 21' do
      card1 = Card.new(10, 'Diamonds')
      card2 = Card.new(10, 'Hearts')
      card3 = Card.new('Ace', 'Diamonds')
      dealer.hand << card1
      dealer.hand << card2
      3.times do
        dealer.hand << card3
      end

      expect(dealer.hand_value).to eq 23
    end

    it 'counts the 21st ace as 1 if the hand value is still over 21' do
      card3 = Card.new('Ace', 'Diamonds')
      21.times do
        player.hand << card3
      end

      expect(player.hand_value).to eq 21
    end
  end

  describe '#hand_busted?' do
    it 'returns false when the hand is empty' do
      expect(dealer.hand_busted?).to eq(false)
    end

    it 'returns false when the hand is 21' do
      card2 = Card.new(10, 'Hearts')
      card3 = Card.new('Ace', 'Diamonds')
      player.hand << card2
      player.hand << card3

      expect(player.hand_busted?).to eq(false)
    end

    it 'returns false when the hand is less than 21' do
      card2 = Card.new(10, 'Hearts')
      card3 = Card.new(10, 'Diamonds')
      dealer.hand << card2
      dealer.hand << card3

      expect(dealer.hand_busted?).to eq(false)
    end

    it 'returns true when the hand is over 21' do
      card1 = Card.new(10, 'Hearts')
      card2 = Card.new(10, 'Hearts')
      card3 = Card.new(10, 'Diamonds')
      player.hand << card1
      player.hand << card2
      player.hand << card3

      expect(player.hand_busted?).to eq(true)
    end
  end
end