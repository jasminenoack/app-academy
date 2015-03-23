require 'byebug'

class SlidingPiece < Piece
  DELTA_DIAGONOL = [
    [-1, -1],
    [1, 1],
    [1, -1],
    [-1, 1]
  ]

  DELTA_HORZ_VERT = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ]

  def moves
    moves = []

    self.class::DELTA.each do |delta|
      moves += each_delta(delta)
    end

    #validation
    moves
  end

  def each_delta(delta)
    moves = []

    current_position = [position[0] + delta[0], position[1] + delta[1]]

    while on_board?(current_position) && board.empty?(current_position)
      moves << current_position
      current_position = [current_position[0] + delta[0], current_position[1] + delta[1]]
    end

    if on_board?(current_position) && enemy?(current_position)
      moves << current_position
    end

    moves
  end

end
