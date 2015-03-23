require 'byebug'

class Array

  def my_uniq
    n = 0
    uniq_array = []
    self.each do |n|
      uniq_array << n unless uniq_array.include?(n)
    end
    uniq_array
  end

  def two_sum
    return_array = []
    (0...self.length-1).each do |n|
      (n+1...self.length).each do |i|
        return_array << [n, i] if self[n] + self[i] == 0
      end
    end
    return_array
  end

  def my_each
    n = 0

    while n < self.length
      yield (self[n])
      n += 1
    end
    return self
  end

end

class Hanoi
  def initialize
    @towers = [[0,1,2,3],[],[]]
  end

  def move(pile1, pile2)
    disk = @towers[pile1][0]
    top = @towers[pile2][0]
    if @towers[pile2].empty? || top > disk
      @towers[pile2].unshift(@towers[pile1].shift)
    else
      p "Illegal move."
    end
    display
  end

  def display
    p @towers
    check_win
  end

  def check_win
    puts "you win" if @towers[2] == [0,1,2,3]
  end

end


def my_transpose(matrix)
  return_array = []
  (0...matrix.length).each do |column|
    return_array << []
    (0...matrix.length).each do |row|
      return_array[column][row] = matrix[row][column]
    end
  end
  return_array
end

def stock_picker(week)
  max_profit = 0
  days = []
  (0...week.length - 1).each do |day1|
    (day1 + 1...week.length).each do |day2|
      profit = week[day2] - week[day1]
      days, max_profit = [day1, day2], profit if profit > max_profit
    end
  end
  days
end

def num_to_s(num, base)
  strings = {
    0 => '0',
    1 => '1',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9',
    10 => 'A', 11 => 'B',
             12 => 'C', 13 => 'D', 14 => 'E', 15 => '15' }
  divisor = 1
  string = ""
  until (num / divisor) < base
    string << strings[num / divisor % base]
    divisor *= base
  end
  string << strings[num / divisor]
  string.reverse
end

def caesar(string, shift)
  alphabet = ('a'..'z').to_a
  return_string = ''
  string.downcase!
  string.each_char do |char|
    if alphabet.include?(char)
      new_index = (alphabet.index(char) + shift) % alphabet.length
      return_string << alphabet[new_index]
    else
      return_string << char
    end
  end

  return_string
end

class MyHashSet
  attr_accessor :store

  def initialize
    @store = {}
    p @store.class
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    @store.has_key?(el)
  end

  def delete(el)
    return false unless @store.include?(el)
    @store.delete(el)
    true
  end

  def to_a
    @store.keys
  end

  def union(set2)
    @store.merge(set2.store)
  end

  def intersect(set2)
    @store.keys & set2.to_a
  end

  def minus(set2)
    @store.keys - set2.to_a
  end
end

def double_array(array)
  array.map { |n| n * 2 }
end

def median(array)
  center = array.length / 2
  return array[center] if array.length.odd?
  (array[center] + array[center-1]) / 2.0
end

def concatenate(strings)
  strings.inject(:+)
end

def display_multi(array)
  array.each {|line| puts line.join(" ") }
  nil
end

def find_value_multi(array, search_value)
  array.each_with_index do |row, index|
    return [index, row.index(search_value)] unless row.index(search_value).nil?
  end
end

def maze_solver
  maze=[]
  File.open('./maze.txt').each_line do |line|
    maze << line.chomp.split("")
  end

  start = find_value_multi(maze, 'S')
  finish = find_value_multi(maze, 'E')
  current = start
  # until current == finish
  #   row = current[0]
  #   column = current[1]
  #   if maze[row-1][column] == ' '
  #     maze[row-1][column] = 'X'
  #     current = [row-1, column]
  #   elsif maze[row][column+1] == ' ' ||  maze[row][column+1] == 'E'
  #     maze[row][column+1] = 'X' unless maze[row][column+1] == 'E'
  #     current = [row, column+1]
  #   else
  #     maze[row+1][column] = 'X'
  #     current = [row+1, column]
  #   end
  #   display_multi(maze)
  # end

  display_multi(maze)

  nil
end

def check_surround(maze, current, counter)
  $complete ||= []
  $shortest_path ||= 100
  new_maze = my_dup(maze)
  current_counter = counter
  row = current[0]
  column = current[1]
  if check_win?(new_maze, current)
    if counter < $shortest_path
      display_multi(new_maze)
      $shortest_path = counter
      $complete = new_maze
    end
  end

  if writable?(new_maze, row-1, column, counter)
    new_maze[row-1][column] = counter
    check_surround(new_maze, [row-1,column], current_counter+1)
  end
  if writable?(new_maze, row, column+1, counter)
    new_maze[row][column+1] = counter
    check_surround(new_maze, [row,column+1], current_counter+1)
  end
  if writable?(new_maze, row+1, column, counter)
    new_maze[row+1][column] = counter
    check_surround(new_maze, [row+1,column], current_counter+1)
  end
  if writable?(new_maze, row, column-1, counter)
    new_maze[row][column-1] = counter
    check_surround(new_maze, [row,column-1], current_counter+1)
  end
end

def writable?(maze, row, column, counter)
  return false if counter > $shortest_path
  return true if maze[row][column] == " "
  if maze[row][column].class == Fixnum
    return true if maze[row][column] > counter
  end
  false
end


def check_win?(maze, current)
  row = current[0]
  column = current[1]
  return true if maze[row-1][column] == 'E'
  return true if maze[row+1][column] == 'E'
  return true if maze[row][column-1] == 'E'
  return true if maze[row][column+1] == 'E'
  false
end

def my_dup(maze)
  return_array = []
  maze.each do |row|
    return_row = []
    row.each do |place|
      return_row << place
    end
    return_array << return_row
  end
  return_array
end


def solve_2
  maze=[]
  File.open('./maze.txt').each_line do |line|
    maze << line.chomp.split("")
  end
  start = find_value_multi(maze, 'S')
  check_surround(maze, start, 1)
  solution = to_X($complete)
  display_multi(solution)
  nil
end

def to_X(maze)
  p maze
  maze.each_with_index do |places, row|
    places.each_with_index do |place, column|
      maze[row][column] = 'X' if place.class == Fixnum
    end
  end
  maze
end


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
