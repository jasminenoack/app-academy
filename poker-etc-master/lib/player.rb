require_relative 'hand.rb'

class Player
  attr_accessor :hand, :pot

  def initialize(pot)
    @hand = Hand.new
    @pot = pot
  end

  def take(cards)
    hand.add(cards)
  end

  def fold
    hand.discard
  end

  def discard(n)
    hand.discard(n)
  end

  def won?(other_hand)
    hand.won?(other_hand)
  end

  def receive_winnings(winnings)
    @pot += winnings
  end

  def bet(game, amt)
    @pot -= amt
    game.make_bet(self, amt)
  end


end
