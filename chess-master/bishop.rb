# encoding: utf-8
class Bishop < SlidingPiece
  DELTA = SlidingPiece::DELTA_DIAGONOL

  def display
    color == :black ? " ♝ " : " ♗ "
  end

end
