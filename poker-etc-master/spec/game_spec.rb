require 'game'
require 'player'

describe Game do
  let(:game) { Game.new }

  describe "#initialize" do

    it "initializes with a full deck" do
      expect(game.deck.count).to eq 52
    end

    it "initializes with an empty bets hash" do
      expect(game.bets).to be_empty
    end

    it "initializes with an empty pot" do
      expect(game.pot).to be 0
    end
  end

  it "creates a table of players" do
    game.table(Player.new(100), Player.new(100), Player.new(100), Player.new(100))
    expect(game.bets.count).to eq 4
  end

  describe "pot" do
    it "tracks bets" do
      player = (double "player")
      game.receive_bet(player, 100)
      expect(game.bets).to include({player => 100})
    end

    it "pays winner"
  end

  describe "plays hand" do
    it "shuffles the deck"
    it "deals cards"
    it "discards a burn card"
    it "collects discards"
    it "gives out new cards"
    it "finds the winner"
  end


end
