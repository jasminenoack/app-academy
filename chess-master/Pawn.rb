# encoding: utf-8

class Pawn < Piece
  FIRST = [[1, 0], [2, 0]]
  TURN = [[1, 0]]
  ATTACK = [[1, 1], [1, -1]]

  def display
    color == :black ? " ♟ " : " ♙ "
  end

  def moves
    standard_moves + attack_moves
  end

  def standard_moves
    moves = []

    deltas = (position[0] == 1 || position[0] == 6 ? FIRST.map(&:dup) : TURN.map(&:dup))
    deltas.each do |delta|
      delta[0] = -delta[0] if color == :white
      moves << [delta[0] + position[0], position[1]]
    end
# debugger
    moves.select { |move| on_board?(move) && board.empty?(move)}
  end

  def attack_moves
    moves = []
    deltas = ATTACK.map(&:dup)
    deltas.each do |delta|
      delta[0] = -delta[0] if color == :white
      moves << [delta[0] + position[0], position[1] + delta[1]]
    end
    moves.select { |move| on_board?(move) && !board.empty?(move) && enemy?(move)}

  end

end
