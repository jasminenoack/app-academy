class SteppingPiece < Piece



  def moves
    moves = []

    self.class::DELTA.each do |delta|
      moves << [position[0] + delta[0], position[1] + delta[1]]
    end

    moves.select{ |move| on_board?(move) && (board.empty?(move) || enemy?(move)) }
  end

end
