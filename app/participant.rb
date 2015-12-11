class Participant
  def show_cards
    if self.class == Player
      puts "Your cards:"
    else
      puts "Dealer's cards:"
    end
    hand.each do |card|
      puts "#{card.value} of #{card.suit}"
    end
  end
end