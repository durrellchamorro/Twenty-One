module Hand
  def hand_value
    return 0 if hand.empty?
    result = hand.map do |card|
      if card.value == "Ace"
        11
      elsif card.value.to_i == 0
        10
      else
        card.value
      end
    end.inject(:+)
    handle_aces!(result)
  end

  def hand_busted?
    if hand_value == 0
      false
    elsif hand_value <= 21
      false
    else
      true
    end
  end

  private

  def handle_aces!(hand_value)
    hand.count { |card| card.value == "Ace" }.times do
      break if hand_value <= 21
      hand_value -= 10
    end
    hand_value
  end
end