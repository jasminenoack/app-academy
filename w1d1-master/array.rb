require 'byebug'

class Array

  # retrun array of unique values
  def my_uniq
    uniq_array = []

    self.each do |item|
      uniq_array << item unless uniq_array.include?(item)
    end

    uniq_array
  end


  def two_sum
    pairs = []

    (0...self.length-1).each do |index1|
      (index1+1...self.length).each do |index2|
        pairs << [index1, index2] if self[index1] + self[index2] == 0
      end
    end

    pairs
  end


  def my_each
    n = 0

    while n < self.length
      yield (self[n])
      n += 1
    end

    self
  end


end


# there is a great trick for this in the solutions.
# Array.new(size){|index| values}
# this allows you to use a block to create array entries.
# this allows you to create a multidimensional array that allows you to
# alter each seperately unlie (size, default)
def my_transpose(rows)
  dimension = rows.count
  cols = Array.new(dimension){Array.new(dimension)}

  (0...rows.length).each do |column|
    (0...rows.length).each do |row|
      cols[column][row] = rows[row][column]
    end
  end

  cols
end


def stock_picker(week)
  max_profit = 0
  best_days = []

  (0...week.length - 1).each do |day1|
    (day1 + 1...week.length).each do |day2|
 #     debugger
      profit = week[day2] - week[day1]
      best_days, max_profit = [day1, day2], profit if profit > max_profit
    end
  end

  best_days
end