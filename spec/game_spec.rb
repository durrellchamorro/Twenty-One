require 'spec_helper'
require './spec/custom/should_have_attr_accessor'
require './app/game'

describe Game do
  it { expect(subject).to have_attr_accessor(:deck) }
  it { expect(subject).to have_attr_accessor(:dealer) }
  it { expect(subject).to have_attr_accessor(:player) }

  let(:player) { Player.new }
  let(:dealer) { Dealer.new }
  let(:game) { Game.new }

  describe '#play' do
    context 'when the player busted' do
      it "it prints 'You busted!'" do
        allow(Player).to receive(:new).and_return(player)
        allow(Dealer).to receive(:new).and_return(dealer)
        allow(player).to receive(:obtain_players_choice_to_hit_or_stay).and_return('h', 'h', 'h')

        expect { game.play }.to output(/You busted!/).to_stdout
      end
    end

    context 'when the dealer busted' do
      it "it prints 'You win! The dealer busted!'" do
        allow(Player).to receive(:new).and_return(player)
        allow(Dealer).to receive(:new).and_return(dealer)
        allow(player).to receive(:obtain_players_choice_to_hit_or_stay).and_return('s')
        allow(dealer).to receive(:hand_busted?).and_return(true)

        expect { game.play }.to output(/You win! The dealer busted!/).to_stdout
      end
    end

    context 'when the dealer wins' do
      it "it prints 'Dealer wins!'" do
        allow(Player).to receive(:new).and_return(player)
        allow(Dealer).to receive(:new).and_return(dealer)
        allow(player).to receive(:obtain_players_choice_to_hit_or_stay).and_return('s')
        allow(player).to receive(:hand_value).and_return(19)
        allow(dealer).to receive(:hand_busted?).and_return(false)
        allow(dealer).to receive(:hand_value).and_return(20)

        expect { game.play }.to output(/Dealer wins!/).to_stdout
      end
    end

    context 'when the player wins' do
      it "it prints 'You won!'" do
        allow(Player).to receive(:new).and_return(player)
        allow(Dealer).to receive(:new).and_return(dealer)
        allow(player).to receive(:obtain_players_choice_to_hit_or_stay).and_return('s')
        allow(player).to receive(:hand_value).and_return(19)
        allow(dealer).to receive(:hand_busted?).and_return(false)
        allow(dealer).to receive(:hand_value).and_return(18)

        expect { game.play }.to output(/You won!/).to_stdout
      end
    end

    context 'when there is a push' do
      it "it prints 'Push'" do
        allow(Player).to receive(:new).and_return(player)
        allow(Dealer).to receive(:new).and_return(dealer)
        allow(player).to receive(:obtain_players_choice_to_hit_or_stay).and_return('s')
        allow(player).to receive(:hand_value).and_return(19)
        allow(dealer).to receive(:hand_busted?).and_return(false)
        allow(dealer).to receive(:hand_value).and_return(19)

        expect { game.play }.to output(/Push/).to_stdout
      end
    end
  end
end