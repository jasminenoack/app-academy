class Array
  def my_uniq
    self.each_with_object([]) do |el, uniqs|
      uniqs << el unless uniqs.include?(el)
    end
  end

  def two_sum
    array = []

    (0...length - 1).each do |i|
      (i...length).each do |j|
        array << [i, j] if self[i] + self[j] == 0
      end
    end

    array
  end

  def my_transpose
    return self unless self[0].is_a?(Array)
    rows, columns = self.length, self[0].length
    new_array = Array.new(columns) { Array.new(rows) }
    (0...rows).each do |row|
      (0...columns).each do |column|
        new_array[column][row] = self[row][column]
      end
    end

    new_array
  end
end

class Hanoi
  attr_reader :board

  def self.setup
    Hanoi.new([[3,2,1],[],[]])
  end

  def initialize(board)
    @board = board
  end

  def render
    render_str = ""

    2.downto(0) do |depth|
      (0..2).each do |column|
        render_str << " "
        char = board[column][depth]
        render_str << (char.nil? ? " " : char.to_s)
      end
      render_str << "\n"
    end

    render_str
  end

  def move(start, finish)
    raise "invalid move" unless [start, finish].all? { |num| num.between?(0,2) }
    raise "invalid move" if board[start].empty?
    unless board[finish][0].nil?
      raise "invalid move" if board[start][0] > board[finish][0]
    end
    board[finish] << board[start].pop

  end

  def won?
    board[0].empty? && board[1..2].any?{ |column| column.empty? }
  end

end

def stock_picker(days)
  best_days = []
  profit = 0

  (0...days.length - 1).each do |day1|
    (day1...days.length).each do |day2|
      if days[day2] - days[day1] > profit
        profit = days[day2] - days[day1]
        best_days = [day1, day2]
      end
    end
  end
  best_days
end
