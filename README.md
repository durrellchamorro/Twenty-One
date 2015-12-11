This is a simplified version of Blackjack written in Ruby 2.2.1 through TDD that you can play in the command line.

Rules:
======
* Both the dealer and the player are initially dealt 2 cards from a 52-card deck.
* One of the dealer's cards is shown to the player.
* Aces count as 11 or 1.
* Jacks, Queens, and Kings count as 10
* The player takes the first turn, and can "hit" or "stay".
* If the player's hand value goes over 21, he loses.
* The dealer automatically plays after the player "stays" or goes over 21.
* The dealer must hit until his cards add up to at least 17.
* If the dealer goes over 21 and the player didn't go over 21, then the player wins.
* If both the dealer and the player do not go over 21, then the highest hand wins.
* If both players have the same hand value, then it is a push/tie.

