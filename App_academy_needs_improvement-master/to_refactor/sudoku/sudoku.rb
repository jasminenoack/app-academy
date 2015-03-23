require "byebug"


class Sudoku
  attr_accessor :puzzle, :rotated, :guess, :guesses, :major_guesses, :incorrect

  def initialize(file)
    puzzle=File.open(file).read.split("\n")
    @puzzle=[]
    @guess = false
    @guesses = []
    @major_guesses =[]
    @incorrect=[]
    puzzle.each{|row| @puzzle << row.split("").map{|num| num=="0" ? "_" : num.to_i}}
  end

  def display
    @puzzle.each_with_index do |row, index|
      puts "---------------------" if index==3 || index==6
      puts "#{row[0]} #{row[1]} #{row[2]} | #{row[3]} #{row[4]} #{row[5]} | #{row[6]} #{row[7]} #{row[8]}"
    end
    puts
  end

  def rotate
    @rotated = Array.new(81, "_").each_slice(9).to_a
    (0..8).each do |column|
      (0..8).each do |row|
        @rotated[row][column]=@puzzle[column][row]
      end
    end
    @rotated
  end

  def check(nums)
    possible=[]
    (1..9).each {|num| possible << num if !nums.include?(num) }
    possible
  end

  def check_row(row)
    row=@puzzle[row]
    check(row)
  end

  def check_column(column)
    @rotate=rotate
    column=@rotated[column]
    check(column)
  end

  def find_square(row, column)
    start_h=(((row)/3)*3)
    start_v=(((column)/3)*3)
    square=[]
    (start_h..start_h+2).each do |row|
      (start_v..start_v+2).each do |column|
        square << [row, column]
      end
    end
    square
  end

  def check_square(row, column)
    places=find_square(row, column)
    square=[]
    places.each {|place| square << @puzzle[place[0]][place[1]]}
    check(square)
  end

  def check_place (row, column)
    return @puzzle[row][column] if @puzzle[row][column]!="_"
    check_row(row) & check_column(column) & check_square(row, column)
  end

  def solve_squares
    (0..8).each do |row|
      (0..8).each do |column|
        options=check_place(row, column)
        if options.class==Array && options.length==1
          @puzzle[row][column]=options[0]
          @guesses<<[row, column] if @guess
        end
      end
    end
    self
  end

  def check_incomplete
    incomplete=@puzzle.map {|row| row.count("_")}.inject(:+)
  end

  def find_options(places)
    options=[]
    places.each do |place|
      options << check_place(place[0],place[1])
    end
    options
  end

  def compare (options)
    nums=options.flatten.sort
    (1..9).each {|num| nums.delete(num) if nums.count(num)>1}
    nums
  end

  def update_from_compare(singles, options, places)
    singles.each do |num|
      if options.include?(num)
        next
      else
        options.each_with_index do |nums, index|
          next if nums.class==Fixnum
          if nums.include?(num)
            row = places[index][0]
            column = places[index][1]
            @puzzle[row][column]=num
            @guesses<< [row, column] if @guess
          end
        end
      end
    end
  end

  def compare_row(row)
    rows=Array.new(9, row)
    columns=(0..8).to_a
    places=rows.zip(columns)
    options=find_options(places)
    singles=compare(options)
    update_from_compare(singles, options, places)
  end

  def compare_rows
    (0..8).each {|num| compare_row(num)}
  end

  def compare_column(column)
    columns=Array.new(9, column)
    rows=(0..8).to_a
    places=rows.zip(columns)
    options=find_options(places)
    singles=compare(options)
    update_from_compare(singles, options, places)
  end

  def compare_columns
    (0..8).each {|num| compare_column(num)}
  end

  def compare_square(row, column)
    places = find_square(row, column)
    options = find_options(places)
    singles = compare(options)
    update_from_compare(singles, options, places)
  end

  def compare_squares
    (0..2).each do |row|
      (0..2).each do |column|
        compare_square(row*3, column*3)
      end
    end
  end

  def complete_puzzle
    incomplete=check_incomplete
    while incomplete>0
      start=incomplete
      solve_squares
      incomplete=check_incomplete
      if incomplete == start
        compare_squares
        compare_rows
        compare_columns
        incomplete=check_incomplete
        if incomplete == start
          break
        end
      end
    end
  end

  def guess_process
    loop do
      if solvable?
        take_a_guess(pick_empty)
        complete_puzzle
        if check_incomplete==0
          display
          break
        elsif solvable?
          guess_process
          break if check_incomplete==0
        else
          backtrack
        end
      end
      
    end

  end

  def pick_empty
    available_places.each do |place|
      options=check_place(*place)
      options.each do |set|
        options.each do |num|
          next if @incorrect.include?([*place,num])
          return [*place, num]
        end
      end
    end
    nil
  end


  def take_a_guess(nums)
    @guess=true
    test_case=nums
    @major_guesses<<test_case
    @guesses<<["mg", @major_guesses.length-1]
    @puzzle[test_case[0]][test_case[1]]=test_case[2]
  end

  def available_places
    open_places=[]
    (0..8).each do |row|
      (0..8).each do |column|
        if @puzzle[row][column]=="_"
          open_places<<[row, column]
        end
      end
    end
    open_places
  end

  def solvable?
    open_places=available_places
    open_places.each do |place|
      if check_place(*place).empty?
        return false
      end
    end
    true
  end

  def backtrack
    loop do
      break if @guesses.empty?
      guess = @guesses.pop
      if guess[0]=="mg" && guess[1]==0
        guess = @major_guesses.pop
        @incorrect << guess
        @puzzle[guess[0]][guess[1]]="_"
      elsif guess[0]=="mg"
        guess=@major_guesses.pop
        @puzzle[guess[0]][guess[1]]="_"
      else
        @puzzle[guess[0]][guess[1]]="_"
      end
    end
  end

end





=begin
t=Time.now
puts 1
puzzle = Sudoku.new('puzzle1.txt')
puzzle.guess_process
puts 2
puzzle = Sudoku.new('puzzle2.txt')
puzzle.guess_process
puts 3
puzzle = Sudoku.new('puzzle3.txt')
puzzle.guess_process
puts 4
puzzle = Sudoku.new('puzzle4.txt')
puzzle.guess_process
puts 5
puzzle = Sudoku.new('puzzle6.txt')
puzzle.guess_process
puts 6
puzzle = Sudoku.new('puzzle5.txt')
puzzle.guess_process
puts 7
puzzle = Sudoku.new('puzzle7.txt')
puzzle.guess_process
puts 8
puzzle = Sudoku.new('puzzle8.txt')
puzzle.guess_process
puts 9
puzzle = Sudoku.new('puzzle9.txt')
puzzle.guess_process
puts 10
puzzle = Sudoku.new('puzzle10.txt')
puzzle.guess_process
puts 11
puzzle = Sudoku.new('puzzle11.txt')
puzzle.guess_process
puts 12
puzzle = Sudoku.new('puzzle12.txt')
puzzle.guess_process
puts 13
puzzle = Sudoku.new('puzzle13.txt')
puzzle.guess_process
puts 14
puzzle = Sudoku.new('puzzle14.txt')
puzzle.guess_process
puts 15
puzzle = Sudoku.new('puzzle15.txt')
puzzle.guess_process
puts 16
puzzle = Sudoku.new('puzzle16.txt')
puzzle.guess_process
puts 17
puzzle = Sudoku.new('puzzle17.txt')
puzzle.guess_process
puts 18
puzzle = Sudoku.new('puzzle18.txt')
puzzle.guess_process





puts Time.now - t
# time 15.756
# time 15.715
# time 15.537
# time 15.681
# time 15.828
# average 15.703

puts 19
puzzle = Sudoku.new('puzzle19.txt')
puzzle.guess_process


=end
puts 20
puzzle = Sudoku.new('puzzle20.txt')
puzzle.guess_process



















# there are puzzles unsolvable by hand that now computer algorithms are being tested to solve.
