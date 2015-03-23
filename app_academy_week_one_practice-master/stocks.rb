class Stock

  def initialize(stock_prices)
    @prices = stock_prices
  end

  def best_profit
    days = []
    best_profit = 0

    (0...@prices.length-1).each do |i|
      (i+1...@prices.length).each do |j|
        profit = @prices[j] - @prices[i]
        days, best_profit = [i,j], profit if profit > best_profit
      end
    end
    days
  end

end

if __FILE__ == $PROGRAM_NAME
  ibm = Stock.new([1,2,1,4,-2,5,6])
  apple = Stock.new([-2,1,2,1,4,-2])
  microsoft = Stock.new([5,4,3,2,1])

  p ibm.best_profit
  p apple.best_profit
  p microsoft.best_profit
end
