require_relative "deck.rb"

class Game
  attr_accessor :deck, :pot, :bets

  def initialize(deck = Deck.setup)
    @deck = deck
    @bets = {}
    @pot = 0
  end

  def table(*players)
    players.each do |player|
      bets[player] = 0
    end
  end

  def receive_bet(player, amt)
    @bets[player] = amt
    @pot += amt
  end

end
