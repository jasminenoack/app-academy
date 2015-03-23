class Piece

  attr_accessor :color, :position, :board

  def initialize(color, position, board)
    @color, @position, @board = color, position, board
    @board[position] = self
  end

  def move
    raise NotImplementedError
  end

  def enemy?(pos)
    board[pos].color != color
  end

  def moved?(start_pos, end_pos)
    start_pos != end_pos
  end

  def on_board?(pos)
    pos.all? { |num| num.between?(0,7)}
  end

  def dup_board
     pieces = board.pieces
     dupped_board = Board.new(false)

     pieces.each do |piece|
       piece.class.new(piece.color, piece.position, dupped_board)
     end

     dupped_board
  end

  def move_into_check?(end_pos)

    dupped_board = dup_board

    dupped_board.move_piece!(position, end_pos)

    dupped_board.in_check?(color)
  end

  def inspect
    self.class
  end

  def expose_king?
    #add later
  end

end
