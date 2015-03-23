class Eight_Queens

  def initialize
    @board = Array.new(64, " ").each_slice(8).to_a
    @placed = []
    @queens = 0
  end

  def clear_board
    @board = Array.new(64, " ").each_slice(8).to_a
  end

  def display
    @board.each do |row|
      p row.join
    end
    puts "---------------"
    nil
  end

  def place(row, column)
    if complete_column?(column) && complete_row?(row) && complete_x?(row, column)
      @board[row][column] = 'Q'
      @placed << [row, column]
      @queens += 1
      return true
    end
    false
  end

  def complete_column?(column)
    (0..7).each do |row|
      return false if @board[row][column] == 'Q'
    end
    true
  end

  def complete_row?(row)
    (0..7).each do |column|
      return false if @board[row][column] == 'Q'
    end
    true
  end

  def complete_x?(row, column)
    diagonal?(row, column, -1, -1) && diagonal?(row, column, -1, 1) && diagonal?(row, column, 1, -1) && diagonal?(row, column, 1, 1)
  end

  def diagonal?(row, column, row_change, column_change)
    row += row_change
    column += column_change
    while row >= 0 && column >=0 && row <= 7 && column <= 7
      return false if @board[row][column] == 'Q'
      row += row_change
      column += column_change
    end
    true
  end

  def solve
    row = 0
    column = 0
    until @queens == 8
    #  debugger
      display
      unless attempt_place(row, column)
        row, column = backtrack
        column += 1
      else
        column = 0
      end
    end
  end

  def backtrack
    last_placed = @placed.pop
    row = last_placed[0]
    column = last_placed[1]
    @queens -= 1
    @board[row][column] = " "
    return row, column
  end

  def attempt_place(start_row, start_column)
    (start_row..7).each do |row|
      (start_column..7).each do |column|
        if place(row, column)
          return true
        end
      end
    end
    false
  end
end
