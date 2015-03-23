require 'card'

describe Card do

  describe "#initialize" do

    let(:card) {Card.new(:hearts, :two)}

    it "assigns a suit" do
      expect(card.suit).to eq(:hearts)
    end

    it "assigns a value" do
      expect(card.value).to eq(:two)
    end

  end

  describe "Constants" do
    it "has 4 possible suits" do
      expect(Card::SUITS.count).to eq(4)
    end

    it "has 13 possible values" do
      expect(Card::VALUES.count).to eq(13)
    end
  end

  let (:card1) {Card.new(:hearts, :three)}
  let (:card2) {Card.new(:hearts, :two)}

  it "compares cards based on value" do
    card3 = Card.new(:spades, :three)

    expect(card1 < card2).to be false
    expect(card1 > card2).to be true
    expect(card1 == card3).to be true
    expect(card1 == card2).to be false
  end

  it "can use the sort function" do
    expect([card1, card2].sort).to eq([card2,card1])
  end

  it "subtracts values of cards" do
    expect(card1 - card2).to be(1)
  end

end
