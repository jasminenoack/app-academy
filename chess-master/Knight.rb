# encoding: utf-8
class Knight < SteppingPiece
  DELTA = [
    [-1, 2],
    [1, 2],
    [2, -1],
    [2, 1],
    [-1, -2],
    [1, -2],
    [-2, -1],
    [-2, 1]
  ]

  def display
    color == :black ? " ♞ " : " ♘ "
  end
end
