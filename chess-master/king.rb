# encoding: utf-8
class King < SteppingPiece
  DELTA = [
    [-1, -1],
    [1, 1],
    [1, -1],
    [-1, 1],
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ]

  def display
    color == :black ? " ♚ " : " ♔ "
  end
end
