require 'spec_helper'
require './app/player'
require './app/deck'
require './spec/custom/should_have_attr_accessor'

describe Player do
  let(:player) { Player.new }
  let(:deck) { Deck.new }

  it { expect(player).to have_attr_accessor(:hand) }

  describe '#take_turn' do
    it 'deals one card to the player if the player asks to hit only one time' do
      allow(player).to receive(:obtain_players_choice_to_hit_or_stay).and_return('h', 's')
      player.take_turn(deck)

      expect(player.hand.size).to eq(1)
    end

    it 'does not allow the player to keep hitting after the player busted' do
      card = Card.new('King', 'Diamonds')
      card2 = Card.new('Queen', 'Spades')
      player.hand << card
      player.hand << card2
      allow(player).to receive(:obtain_players_choice_to_hit_or_stay).and_return('h', 'h')
      player.take_turn(deck)

      expect(player.hand.size).to eq(3)
    end
  end
end
