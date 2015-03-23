class Board

  POSITIONS = {
    1 => [0,0],
    2 => [0,1],
    3 => [0,2],
    4 => [1,0],
    5 => [1,1],
    6 => [1,2],
    7 => [2,0],
    8 => [2,1],
    9 => [2,2]
  }

  WINNING_COMBOS = [
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [1,4,7],
    [2,5,8],
    [3,6,9],
    [1,5,9],
    [3,5,7]
  ]

  def initialize
    @board = Array.new(3) {Array.new(3)}
  end

  def display
    puts render
  end

  def move(pos, mark)
    if empty?(pos)
      place_mark(pos, mark)
      true
    else
      false
    end
  end

  def get_pos(pos)
    row, column = POSITIONS[pos]
    @board[row][column]
  end

  def place_mark(pos, mark)
    row, column = POSITIONS[pos]
    @board[row][column] = mark
  end

  def empty?(pos)
    get_pos(pos).nil?
  end

  def render
    @board.map do |row|
      row.map {|x| x.nil? ? " " : x }.join(" | ")
    end.join("\n- - - - -\n")
  end

  def render_with_pos
    [[1,2,3],[4,5,6],[7,8,9]].map do |row|
      row.join(" | ")
    end.join("\n- - - - -\n")
  end

  def display_with_pos
    puts render_with_pos
  end

  def won?
    !!winner
  end

  def winning_move?(pos, mark)
    WINNING_COMBOS.each do |combo|
      if combo.include?(pos)
        other_pos = combo.dup - [pos]
        return true if other_pos.all? {|x| get_pos(x) == mark }
      end
    end

    return false
  end

  def winner
    WINNING_COMBOS.each do |combo|
      if combo.all? { |pos| get_pos(pos) == get_pos(combo[0]) }
        return get_pos(combo[0]) unless get_pos(combo[0]).nil?
      end
    end
    false
  end

  def draw?
    (1..9).each {|pos| return false if empty?(pos) }
    true
  end

  def over?
    won? || draw?
  end

end

class Game
  attr_accessor :board

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def play
    setup

    until @board.over?
      turn(@player1)
      break if @board.over?
      turn(@player2)
    end

    puts "#{@board.winner || "No one"} wins! Congratulations."
  end

  def setup
    @board = Board.new
    puts "Welcome to Tic Tac Toe"
    puts "Here are the possible moves:"
    @board.display_with_pos
  end

  def turn(player)
    player.get_move(@board)
    @board.display
  end

  def make_move(player)

  end

end

class HumanPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark.to_sym
  end

  def get_move(board)
    loop do
      puts "Please enter your move! (1-9)"
      pos = gets.chomp.to_i
      break if board.move(pos, mark)
      puts "Invalid move; this spot is taken."
    end
  end

end

class ComputerPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark.to_sym
  end

  def get_move(board)
    winning_move = nil

    (1..9).each do |pos|
      next unless board.empty?(pos)
      if board.winning_move?(pos, mark)
        board.move(pos, mark)
        return
      end
    end

    loop do
      pos = rand(9) + 1
      break if board.move(pos, mark)
    end
  end

end
