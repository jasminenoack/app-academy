require 'hand.rb'

describe Hand do

  let(:hand) { Hand.new }

  describe "@cards" do
    it "initializes with cards instance variable" do
      expect(hand).to respond_to(:cards)
    end

    it "defaults to an empty hand" do
      expect(hand.cards).to be_empty
    end

    it "can take an array" do
      full_hand = Hand.new( [
        Card.new(:spades, :seven),
        Card.new(:spades, :six),
        Card.new(:spades, :five),
        Card.new(:spades, :four),
        Card.new(:spades, :two)
        ])
      expect(full_hand.cards).not_to be_empty
    end

  end

  let(:deck) { double("deck") }
  let(:deck_cards) { [
                    Card.new(:spades, :seven),
                    Card.new(:spades, :six),
                    Card.new(:spades, :five),
                    Card.new(:spades, :four),
                    Card.new(:spades, :two)
                  ] }

  it "::create_hand returns a hand of 5 cards" do
    allow(deck).to receive(:take).with(5).and_return(deck_cards)

    expect(Hand.create_hand(deck)).to eq(deck_cards)
  end

  it "#add cards to the hand" do
    hand.add(deck_cards)
    expect(hand.cards).to eq(deck_cards)
  end

  describe "discard" do
    it "checks that player has 5 cards" do
      expect { hand.discard(2,4) }.to raise_error("not time to discard")
    end

    let(:discard_hand) {Hand.new([
                        Card.new(:clubs,:jack),
                        Card.new(:clubs,:ten),
                        Card.new(:clubs,:nine),
                        Card.new(:clubs,:eight),
                        Card.new(:clubs,:seven)
                        ])}

    it "only discards from player hand" do
      expect { discard_hand.discard(2,5) }.to raise_error("you can only discard cards in your hand")
    end

    it "removes cards from hand" do
      discard_hand.discard(2,4)
      expect(discard_hand.cards.count).to be 3
    end

    it "returns discarded cards. " do
      game = double("game")
      expect(discard_hand.discard(2,4)).to eq([Card.new(:clubs,:nine),Card.new(:clubs,:seven)])
    end

  end



  describe "#identify" do
    it ":straight_flush" do
      hand = Hand.new([
        Card.new(:clubs,:jack),
        Card.new(:clubs,:ten),
        Card.new(:clubs,:nine),
        Card.new(:clubs,:eight),
        Card.new(:clubs,:seven)
        ])
      expect(hand.identify).to eq(:straight_flush)
    end

    it ":four_of_a_kind" do
      hand = Hand.new([
        Card.new(:clubs,:ten),
        Card.new(:diamonds,:ten),
        Card.new(:spades,:ten),
        Card.new(:hearts,:ten),
        Card.new(:clubs,:seven)
        ])
        expect(hand.identify).to eq(:four_of_a_kind)
    end

    it ":full_house" do
      hand = Hand.new([
        Card.new(:clubs,:ten),
        Card.new(:diamonds,:ten),
        Card.new(:spades,:ten),
        Card.new(:hearts,:seven),
        Card.new(:clubs,:seven)
        ])
        expect(hand.identify).to eq(:full_house)
    end

    it ":flush" do
      hand = Hand.new([
        Card.new(:clubs,:jack),
        Card.new(:clubs,:ten),
        Card.new(:clubs,:nine),
        Card.new(:clubs,:eight),
        Card.new(:clubs,:six)
        ])
        expect(hand.identify).to eq(:flush)
      end

    it ":straight" do
      hand = Hand.new([
        Card.new(:clubs,:jack),
        Card.new(:clubs,:ten),
        Card.new(:hearts,:nine),
        Card.new(:clubs,:eight),
        Card.new(:clubs,:seven)
        ])
        expect(hand.identify).to eq(:straight)
      end

    it ":straight with aces" do
      hand = Hand.new([
        Card.new(:clubs,:jack),
        Card.new(:clubs,:ten),
        Card.new(:hearts,:ace),
        Card.new(:clubs,:king),
        Card.new(:clubs,:queen)
        ])
      expect(hand.identify).to eq(:straight)

      hand = Hand.new([
        Card.new(:clubs,:ace),
        Card.new(:clubs,:two),
        Card.new(:hearts,:three),
        Card.new(:clubs,:four),
        Card.new(:clubs,:five)
        ])
      expect(hand.identify).to eq(:straight)
    end
    # acknowledge aces in straights
    it ":three_of_a_kind" do
      hand = Hand.new([
        Card.new(:clubs,:ten),
        Card.new(:diamonds,:ten),
        Card.new(:spades,:ten),
        Card.new(:hearts,:two),
        Card.new(:clubs,:seven)
        ])
        expect(hand.identify).to eq(:three_of_a_kind)
      end

    it ":two_pair" do
      hand = Hand.new([
        Card.new(:clubs,:ten),
        Card.new(:diamonds,:two),
        Card.new(:spades,:ten),
        Card.new(:hearts,:two),
        Card.new(:clubs,:seven)
        ])
        expect(hand.identify).to eq(:two_pair)
      end


    it ":high_card" do
      hand = Hand.new([
      Card.new(:clubs,:ace),
      Card.new(:clubs,:two),
      Card.new(:hearts,:three),
      Card.new(:clubs,:four),
      Card.new(:clubs,:king)
      ])
      expect(hand.identify).to eq(:high_card)
    end


  end

  describe "#score" do
    it "scores hands based on the HANDS CONSTANT" do
      hand = Hand.new([
        Card.new(:clubs,:ten),
        Card.new(:diamonds,:two),
        Card.new(:spades,:ten),
        Card.new(:hearts,:six),
        Card.new(:clubs,:seven)
        ])
    expect(hand.score).to eq(1)
    end
  end

  describe "#won?" do
    it "compares different hands" do
      hand = Hand.new([
        Card.new(:clubs,:ten),
        Card.new(:diamonds,:ten),
        Card.new(:spades,:ten),
        Card.new(:hearts,:ten),
        Card.new(:clubs,:seven)
        ])

        other_hand = (double "other_hand")
        expect(other_hand).to receive(:score).and_return(3)

        expect(hand).to be_won(other_hand)
    end

    it "detemines the won if two players have the same score" do
      hand = Hand.new([
        Card.new(:clubs,:jack),
        Card.new(:clubs,:ten),
        Card.new(:hearts,:nine),
        Card.new(:clubs,:eight),
        Card.new(:clubs,:seven)
        ])
      other_hand = (double "other_hand")
      expect(other_hand).to receive(:score).and_return(4)
      expect(other_hand).to receive(:score).and_return(4)

      expect(other_hand).to receive(:high_card).with(0).and_return(13)
      expect(other_hand).to receive(:high_card).with(0).and_return(13)

      expect(hand).not_to be_won(other_hand)

    end

  end

  describe "#highest_card" do
    it "sorts the cards in scoring order and returns the requested card" do
      hand = Hand.new([
        Card.new(:clubs,:jack),
        Card.new(:clubs,:ten),
        Card.new(:hearts,:nine),
        Card.new(:clubs,:eight),
        Card.new(:clubs,:seven)
        ])

      expect(hand.highest_card(0)).to eq(11)
    end
  end

end
