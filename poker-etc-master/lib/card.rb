class Card
  include Comparable

  SUITS = {
    :hearts => "of hearts",
    :spades => "of spaces",
    :diamonds => "of diamonds",
    :clubs => "of clubs"
  }

  VALUES = {
    :ace => 14,
    :king => 13,
    :queen => 12,
    :jack => 11,
    :ten => 10,
    :nine => 9,
    :eight => 8,
    :seven => 7,
    :six => 6,
    :five => 5,
    :four => 4,
    :three => 3,
    :two => 2,
  }

  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def <=>(anOther)
    VALUES[self.value] <=> VALUES[anOther.value]
  end

  def -(other_card)
    raise "not a card" unless other_card.is_a?(Card)

    VALUES[self.value] - VALUES[other_card.value]
  end

end
