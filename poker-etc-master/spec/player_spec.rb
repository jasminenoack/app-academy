require 'player'

describe Player do
  let(:player) {Player.new(500)}

  describe "#initialize" do
    it "has an empty hand on creation" do
      expect(player.hand).to be_empty
    end

    it "has a pot of money above 0 on creation" do
      expect(player.pot).not_to be 0
    end
  end

  describe "@hand" do
    it "#take puts cards in hand" do
      deck = (double "deck")
      cards = [
                    Card.new(:spades, :seven),
                    Card.new(:spades, :six)
                  ]

      expect(player.hand).to receive(:add).with(cards)

      player.take(cards)
    end

    it "can #fold a hand calls discard without arguments" do
      player.hand = Hand.new([
                    Card.new(:spades, :seven),
                    Card.new(:spades, :six),
                    Card.new(:spades, :five),
                    Card.new(:spades, :four),
                    Card.new(:spades, :two)
                    ])
      player.fold
      expect(player.hand).to be_empty
    end
  end

  describe "gameplay" do
    it "#discard calls discard in hand" do
      player.hand = Hand.new([
        Card.new(:spades, :seven),
        Card.new(:spades, :six),
        Card.new(:spades, :five),
        Card.new(:spades, :four),
        Card.new(:spades, :two)
        ])
      expect(player.hand).to receive(:discard).with(2).and_return([Card.new(:spades, :five)])
      player.discard(2)
    end

    it "knows can ask the hand if it #won?" do
      player.hand = (double "hand")
      other_hand = (double "hand")

      expect(player.hand).to receive(:won?).with(other_hand)
      player.won?(other_hand)
    end
  end

  describe "@pot" do
    it "can #receive winnings and add them to the pot" do
      player.receive_winnings(200)

      expect(player.pot).to eq(700)
    end

    let(:game) {double "game"}

    it "can make a bet" do
      expect(game).to receive(:make_bet).with(player, 100)
      player.bet(game, 100)
      expect(player.pot).to eq(400)
    end
  end

end
