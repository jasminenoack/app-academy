class BeginnerComputer < RandomComputer
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
    best_options = []

    pieces.each do |piece|
      option = better_construct_jump(piece)
      best_options << option unless option.nil?
    end

    best_options.sort_by{ |x, y| y.length }

    return best_options[-1] unless best_options.empty?

    options = []

    pieces.each do |piece|
      option = better_construct_jump(piece)
      options << option unless option.nil?
    end

    options.sort_by{ |x, y| y.length }

    return options[-1] unless options.empty?

    super
  end


  def best_construct_jump(piece)
    pos = piece.pos
    dup_board = @board.dup
    piece = dup_board[pos]

    jumps = []
    until piece.valid_jumps.empty?
      jumps << piece.valid_jumps.sample
      piece.move!(jumps[-1])
    end

    return nil if other_jump?(dup_board) || !dup_board.valid_jump?(@color)
    return nil unless dup_board.valid_move?(@color)

    [pos, jumps]
  end

  def better_construct_jump(piece)
    pos = piece.pos
    dup_board = @board.dup
    piece = dup_board[pos]

    jumps = []
    until piece.valid_jumps.empty?
      jumps << piece.valid_jumps.sample
      piece.move!(jumps[-1])
    end

    return nil if other_jump?(dup_board)
    return nil unless dup_board.valid_move?(@color)

    [pos, jumps]
  end

  def construct_slide(pieces)
    best_options = []

    pieces.each do |piece|
      option = best_construct_slide(piece)
      best_options << option unless option.nil?
    end

    return best_options.sample unless best_options.empty?

    options = []

    pieces.each do |piece|
      option = better_construct_slide(piece)
      options << option unless option.nil?
    end

    return options.sample unless options.empty?

    super
  end

  def better_construct_slide(piece)
    pos = piece.pos
    dup_board = @board.dup
    piece = dup_board[pos]

    slide = piece.valid_slides.sample
    piece.move!(slide)

    return nil if other_jump?(dup_board)
    return nil unless dup_board.valid_move?(@color)

    [pos, [slide]]
  end

  def best_construct_slide(piece)
    pos = piece.pos
    dup_board = @board.dup
    piece = dup_board[pos]

    slide = piece.valid_slides.sample
    piece.move!(slide)

    return nil if other_jump?(dup_board) || !dup_board.valid_jump?(@color)
    return nil unless dup_board.valid_move?(@color)

    [pos, [slide]]
  end

  def other_jump?(board)
    board.valid_jump?(other_player_color)
  end

  def other_player_color
    @color == :red ? :black : :red
  end

end
