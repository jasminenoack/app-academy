# encoding: utf-8
class Queen < SlidingPiece
  DELTA = SlidingPiece::DELTA_DIAGONOL + SlidingPiece::DELTA_HORZ_VERT

  def display
    color == :black ? " ♛ " : " ♕ "
  end

end
