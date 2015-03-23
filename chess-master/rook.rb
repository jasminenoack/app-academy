# encoding: utf-8
class Rook < SlidingPiece

  DELTA = SlidingPiece::DELTA_HORZ_VERT

  def display
    color == :black ? " ♜ " : " ♖ "
  end

end
