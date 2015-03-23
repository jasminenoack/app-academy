require 'deck'


describe Deck do

  let(:deck) {Deck.setup}

  describe "::setup" do
    it "creates a deck containing all cards" do
      expect(deck.count).to eq(52)
    end
  end

  it "it should not expose cards" do
    expect(deck).not_to respond_to(:cards)
  end

  describe "@discard_pile" do
    it "initializes with an empty discard pile" do
      expect(deck.discard_pile).to be_empty
    end

    it "#discard adds to discard pile" do
      cards = [Card.new(:hearts, :two), Card.new(:hearts, :ace)]
      deck.discard(cards)

      expect(deck.discard_pile).to eq(cards)
    end

    it "#discard does not change the deck count" do
      count = deck.count
      cards = [Card.new(:hearts, :two), Card.new(:hearts, :ace)]
      deck.discard(cards)

      expect(deck.count).to eq(count)
    end

    it "#return_discards to deck" do
      cards = deck.discard(deck.take(5))

      expect(deck).to receive(:shuffle)
      deck.return_discards(cards)
      expect(deck.count).to eq(52)
    end
  end


  it "#shuffle the cards: modifies @cards array" do
    cards = [Card.new(:clubs, :two),
             Card.new(:clubs, :ace),
             Card.new(:hearts, :two),
             Card.new(:hearts, :ace)
      ]

    shuffle_deck = Deck.new(cards)
    deck.shuffle!
    hand = deck.take(2)

    expect(hand).not_to eq(cards[0..1])
  end



  it "#take cards out of the deck from the top" do
    expect(deck.take(5).count).to eq(5)
    expect(deck.count).to eq(47)
  end

  describe "#cards_left?" do
    it "checks that there are cards in the deck" do
      expect(deck).to be_cards_left
    end

    it "checks that the deck is empty" do
      deck2 = Deck.new([])
      expect(deck2).not_to be_cards_left
    end
  end

end
