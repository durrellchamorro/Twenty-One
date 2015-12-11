require 'spec_helper'
require './app/card'
require './app/player'
require './app/dealer'

describe Participant do
  let(:dealer) { Dealer.new }
  let(:player) { Player.new }

  describe '#show_cards' do
    it "prints the correct cards" do
      card2 = Card.new(9, 'Hearts')
      card3 = Card.new(10, 'Diamonds')
      player.hand << card2
      player.hand << card3

      expect { player.show_cards }.to output(/10 of Diamonds/).to_stdout
      expect { player.show_cards }.to output(/9 of Hearts/).to_stdout
    end

    it "prints the correct participant" do
      card2 = Card.new(9, 'Hearts')
      card3 = Card.new(10, 'Diamonds')
      player.hand << card2
      player.hand << card3

      expect { player.show_cards }.to output(/Your cards:/).to_stdout
    end

    it "prints the correct participant" do
      card2 = Card.new(9, 'Hearts')
      card3 = Card.new(10, 'Diamonds')
      dealer.hand << card2
      dealer.hand << card3

      expect { dealer.show_cards }.to output(/Dealer's cards:/).to_stdout
    end
  end
end