class HumanPlayer
  def initialize(game, color, board)
    @game, @color, @board = game, color, board
  end

  def take_turn
    system 'clear'
    puts "It is #{@color}'s turn to move."
    puts @board.display
    puts "Enter a single move as 0,0 and multiple moves as 0,0 0,1 0,2"
    puts "You have a required jump" if @board.valid_jump?(@color)
    poss = input("Where would you like to move from?")
    pos = poss.shift
    moves = input("Where would you like to move?")
    raise CheckersError unless @board[pos].color == @color
    [pos, moves]
  rescue CheckersError, ArgumentError
    puts "There was an error in your input."
    puts "Press enter to retry."
    gets
   retry
  end


  def input(prompt)
    puts prompt
    pos = gets.chomp
    pos.split.map { |move| move.split(",").map { |num| Integer(num) } }
  end

end

class RandomComputer
  def initialize(game, color, board)
    @game, @color, @board = game, color, board
  end

  def take_turn
    system 'clear'
    puts "It is #{@color}'s turn to move."
    puts @board.display
    puts "You have a required jump" if @board.valid_jump?(@color)

    input = find_move
    puts "The computer has chosen to move from #{input[0]} to #{input[1]}"
    puts "Press enter to continue."
    gets

    input
  end

  def find_move
    pieces = @board.player_pieces(@color)
    jumpers = pieces.select { |piece| piece.valid_jumps.any? }
    sliders = pieces.select { |piece| piece.valid_slides.any? }
    unless jumpers.empty?
      input = construct_jump(jumpers)
    else
      input = construct_slide(sliders)
    end
    input
  end

  def construct_jump(pieces)
    piece = pieces.sample
    pos = piece.pos
    dup_board = @board.dup
    piece = dup_board[pos]

    jumps = []
    until piece.valid_jumps.empty?
      jumps << piece.valid_jumps.sample
      piece.move!(jumps[-1])
    end

    [pos, jumps]
  end

  def construct_slide(pieces)
    piece = pieces.sample
    [piece.pos, [piece.valid_slides.sample]]
  end

end
