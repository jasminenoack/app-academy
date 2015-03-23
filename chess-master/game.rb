require_relative 'loading.rb'

class Game


  def initialize(player1, player2)
    @white = player1
    @black = player2
    @board = Board.new
  end



  def play

    until over?
      @board.render_board

      puts "It is white's turn."
      turn(:white)
      break if over?

      puts "It is black's turn."
      @board.render_board
      turn(:black)

    end

    puts "#{winner} is the winner!"
  end

  def turn(color)

    puts "Please move out of check." if @board.in_check?(color)
    color == :white ? player = @white : player = @black
    move = player.play_turn
    @board.move_piece(move[0], move[1], color)
    puts "#{move[0]} => #{move[1]}"
  rescue
    puts "That is an invalid move"
    retry
  end

  def winner
    @board.checkmate?(:white) ? "Player 2" : "Player 1"
  end

  def over?
    @board.checkmate?(:white) || @board.checkmate?(:black)
  end

end

if __FILE__ == $PROGRAM_NAME

  Game.new(HumanPlayer.new, HumanPlayer.new).play

end
