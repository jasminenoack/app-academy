require_relative 'board.rb'
require_relative 'base_players.rb'
require_relative 'beginner_computer.rb'

class Game

  def initialize(player_class = HumanPlayer, player2_class = HumanPlayer)
    @board = Board.new
    @red = player_class.new(self, :red, @board)
    @black = player_class.new(self, :black, @board)
    @turn = @black
    @colors = { @black => :black, @red => :red }
  end

  def play
    introduction
    until over?
      pos,moves = @turn.take_turn
      make_move(pos, moves)
      change_turn
    end

    system 'clear'
    puts @board.display
    puts result

  end

  def result
    return "It's a draw!" if draw?
    return "#{@colors[@turn]} lost." if lost?
    "#{@colors[@turn]} won."
  end

  def make_move(pos, moves)
    @board.perform_moves(pos, *moves)
  end

  def over?
    draw? || won? || lost?
  end

  def lost?
    !@board.valid_move?(@colors[@turn])
  end

  def draw?
    @board.no_player_can_move?
  end

  def won?
    @board.player_pieces(:red).empty? || @board.player_pieces(:black).empty?
  end

  def change_turn
    @turn = (@turn == @black ? @red : @black)
  end

  def introduction
    system 'clear'
    puts "Welcome to Checkers, please read the rules carefully."
    puts ''
    puts '1. You can only move diagonally.'
    puts '2. You can either slide one square in any turn or any number of jumps.'
    puts '3. All standard pieces can only move forward in either of the two diagonals.'
    puts '4. Once you reach the end of the board you become a king and can move any diagonal direction.'
    puts '5. If there is a jump available you must perform a jump, if there are multiple available then you can take any jump.'
    puts '6. When you start a jump you must continue until you can no longer jump pieces.'
    puts ''
    puts '  Have Fun!!! '
    puts "enter 'play' to start"
    entry = gets.chomp.downcase
    puts "Well that's not a good start!" unless entry == 'play'
    gets unless entry == 'play'
  end

end












# def correct_color
# end
#
# def piece?
# end


if __FILE__ == $PROGRAM_NAME

#  system "clear"
  g = Game.new(BeginnerComputer,RandomComputer).play

end
