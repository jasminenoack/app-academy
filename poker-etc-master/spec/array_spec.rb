require 'rspec'
require 'array'

describe Array do
  describe "#my_uniq" do
    it "handles an empty array" do
      expect([].my_uniq).to eq([])
    end

    it "handles an array of one item" do
      expect([1].my_uniq).to eq([1])
    end

    it 'handles and array with no duplicates' do
      expect([1,2,3,4].my_uniq).to eq([1,2,3,4])
    end

    it 'removes duplicates' do
      expect([1,1,2,2,3,3,4,4].my_uniq).to eq([1,2,3,4])
    end

    it 'does not change the order of the first instances' do
      expect([1,2,5,2,3,2,5].my_uniq).to eq([1,2,5,3])
    end
  end

  describe "#two_sum" do
    it "handles an empty array" do
      expect([].two_sum).to eq([])
    end

    it "handles an array of one item" do
      expect([1].two_sum).to eq([])
    end

    it 'handles and array with no results' do
      expect([1,2,3,4].two_sum).to eq([])
    end

    it 'finds one result' do
      expect([-1,1,-6,2].two_sum).to eq([[0,1]])
    end

    it 'finds multiple results' do
      expect([-1,1,-2,-2,-6,2].two_sum).to eq([[0, 1], [2, 5], [3, 5]])
    end
  end

  describe "#my_transpose" do
    it "handles and empty array" do
      expect([].my_transpose).to eq([])
    end

    it "handles an array of one" do
      expect([2].my_transpose).to eq([2])
    end

    it "handles a 2*3 matrix" do
      expect([[2,3,4],[4,5,6]].my_transpose).to eq([[2,4],[3,5],[4,6]])
    end
  end
end

describe Hanoi do

  describe "::setup" do

    let(:hanoi) {Hanoi.setup}

    it "sets the variable board to an array" do
      expect(hanoi.board).to eq([[3,2,1],[],[]])
    end

  end

  describe "#render" do
    it "turns the board into a string" do
      hanoi2 = Hanoi.setup

      expect(hanoi2.render).to eq(" 1    \n 2    \n 3    \n")

    end
  end


  describe "#move" do

    let(:hanoi) {Hanoi.setup}

    it "moves a piece to another column" do
      hanoi.move(0, 1)

      expect(hanoi.board).to eq([[3,2],[1],[]])
    end

    it "will not take a piece from an empty location" do
      expect { hanoi.move(2,0) }.to raise_error.with_message('invalid move')
    end


    it "dowsn't allow plays outside the board" do
      expect { hanoi.move(4, 0) }.to raise_error.with_message('invalid move')
      expect { hanoi.move(0, 4) }.to raise_error.with_message('invalid move')
    end

    it "will not place a piece on a larger disk" do
      hanoi.move(0, 1)
      expect { hanoi.move(0, 1) }.to raise_error.with_message('invalid move')
    end
  end


  describe "#won?" do
    it "determines a win" do
      hanoi1 = Hanoi.new([[],[3,2,1],[]])
      hanoi2 = Hanoi.new([[],[],[3,2,1]])

      expect(hanoi1).to be_won
      expect(hanoi2).to be_won

    end
    it "does not mistakenly label a win" do
      hanoi1 = Hanoi.new([[],[2,1],[3]])
      hanoi2 = Hanoi.new([[2],[],[3,1]])

      expect(hanoi1.won?).to be false
      expect(hanoi2.won?).to be false

    end
  end

end

describe "#stock_picker" do

  it "pickes the best days" do
    expect(stock_picker([1,4,2,5,2,6])).to eq([0,5])
  end

  it "does not attempt to sell before it buys" do
    expect(stock_picker([6,1,4,2,5,2])).to eq([1,4])
  end

  it "returns no buy if you will lose money" do
    expect(stock_picker([6,4,2,2,0])).to eq([])
  end

end
