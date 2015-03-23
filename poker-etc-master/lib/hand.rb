require_relative 'card.rb'

class Hand
  HANDS = [
    :high_card,
    :pair,
    :two_pair,
    :three_of_a_kind,
    :straight,
    :flush,
    :full_house,
    :four_of_a_kind,
    :straight_flush,
  ]

  attr_accessor :cards

  def self.create_hand(deck)
    deck.take(5)
  end

  def empty?
    cards.empty?
  end

  def initialize(cards = [])
    @cards = cards
  end

  def add(cards)
    @cards += cards
  end

  def discard(*card_pos)
    if card_pos.empty?
      discarding = @cards
    else
      unless card_pos.all? { |num| num.between?(0,4)}
        raise "you can only discard cards in your hand"
      end
      raise "not time to discard" unless @cards.count == 5

      discarding = []
      card_pos.each do |pos|
        discarding << @cards[pos]
      end
    end
    @cards -= discarding
    discarding
  end

  def identify
    return :straight_flush if straight? && flush?
    return :straight if straight?
    return :flush if flush?
    return :four_of_a_kind if four_kind?
    return :full_house if full_house?
    return :three_of_a_kind if three_kind?
    return :two_pair if two_pair?
    return :pair if pair?
    :high_card
  end

  def score
    HANDS.index(identify)
  end

  def won?(other_hand)
    return true if score > other_hand.score
    return false if other_hand.score < score
    sorted_hand = sorts_hand
    sorted_hand.each_with_index do |(count, value), index|
      return true if value > other_hand.high_card(index)
      return false if value < other_hand.high_card(index)
    end
    raise "unable to score"
  end

  def sorts_hand
    hand = find_match_values.map { |value, count| [Card::VALUES[value], count] }
    hand.sort_by { |value, count| [count, value] }.reverse
  end

  def highest_card(n)
    sorts_hand[0][0]
  end

  private

    def pair?
      find_match_values.values.include?(2)
    end

    def two_pair?
      find_match_values.values.select { |count| count == 2}.count == 2
    end

    def three_kind?
      find_match_values.values.include?(3)
    end

    def full_house?
      find_match_values.values.sort == [2, 3]
    end

    def four_kind?
      find_match_values.values.include?(4)
    end

    def straight?
      cards = @cards.sort.reverse

      cards[0..-2].each_with_index do |card, index|
        if card.value == :ace
           return false unless cards.any? { |c| c.value == :two || c.value == :king }
           if  cards.select { |c| c.value == :two || c.value == :king }.count > 1
             return false
           end
           next
        end

        return false unless card - cards[index + 1] == 1
      end
      true
    end

    def flush?
      @cards.all? { |card| card.suit == @cards[0].suit }
    end

    def find_match_values
      values = Hash.new(0)

      @cards.each do |card|
        values[card.value] += 1
      end

      values
    end



end
