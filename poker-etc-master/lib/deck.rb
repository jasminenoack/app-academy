require_relative "card.rb"

class Deck
  attr_reader :discard_pile

  def self.setup
    cards = []

    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end

    Deck.new(cards)
  end

  def initialize(cards)
    @cards = cards
    @discard_pile = []
  end

  def count
    @cards.count
  end

  def discard(cards)
    @discard_pile += cards
  end

  def shuffle!
    @cards.shuffle!
  end

  def take(n)
    @cards.shift(n)
  end

  def return_discards(cards)
    @cards += cards
    shuffle
  end

  def cards_left?
    count > 0
  end

end
