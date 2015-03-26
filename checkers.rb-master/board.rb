require_relative 'piece.rb'
require_relative 'errors.rb'
require 'colorize'

class Board
  attr_accessor :board

  # create array for the board
  def initialize(setup = true)
    @board = Array.new(8) {Array.new(8)}
    setup_board if setup
  end

  def [](pos)
    board[pos[0]][pos[1]]
  end

  def []=(pos, value)
    board[pos[0]][pos[1]] = value
  end

  #create display string
  def display
    display_string = "    0  1  2  3  4  5  6  7\n"

    board.each_with_index do |row, row_index|
      display_string << " #{row_index} "
      row.each_with_index do |el, column_index|
        el = (el.nil? ? "   " : el.display )
        if row_index.odd? == column_index.odd?
          el = el.colorize(:background => :cyan)
        else
          el = el.colorize(:background => :blue)
        end
        display_string << el
      end
      display_string << " #{row_index}\n"
    end

    display_string << "    0  1  2  3  4  5  6  7\n"
  end

  # dup the board
  def dup
    new_board = Board.new(false)
    pieces.each do |piece|
      piece.class.new(piece.color, piece.pos, new_board, piece.king)
    end
    new_board
  end

  def inspect
    self.class
  end

  #check occupied
  def occupied?(end_pos)
    !self[end_pos].nil?
  end

  def on_board?(pos)
    pos.all? { |num| num.between?(0,7) }
  end

  #check if it is a draw
  def no_player_can_move?
    !valid_move?(:black) && !valid_move?(:red)
  end

  #find all pieces
  def pieces
    board.flatten.compact
  end

  #find a player's pieces
  def player_pieces(color)
    pieces.select { |piece| piece.color == (color)}
  end

  #place checker
  def place_piece(piece, pos)
    self[pos] = piece
  end

  #check valid sequence, then perform moves
  def perform_moves(pos, *moves)
    raise CheckersError unless valid_move_seq?(pos, *moves)
    perform_moves!(pos, *moves)
  end

  # move
  def perform_moves!(pos, *moves)
    piece = self[pos]
      return true if (moves.one? && piece.perform_slide(moves[0]))

    moves.each do |move|
      raise CheckersError unless piece.perform_jump(move)
    end
    raise CheckersError unless piece.valid_jumps.empty?
    true
  end

  def remove_jumped(pos)
    self.remove_piece(pos)
  end

  #remove checker
  def remove_piece(pos)
    self[pos] = nil
  end

  #setup the board
  def setup_board
    [0,1,2,5,6,7].each do |row|
      8.times do |column|
        if row.odd? == column.odd?
          color = row < 3 ? :black : :red
          Piece.new(color, [row, column], self)
        end
      end
    end
  end

  # any piece can slide
  def valid_jump?(color)
    player_pieces(color).any?{ |piece| piece.valid_jumps.any? }
  end

  #valid move
  def valid_move?(color)
    valid_jump?(color) || valid_slide?(color)
  end

  def valid_move_seq?(pos, *moves)
    dup_board = self.dup

    dup_board.perform_moves!(pos, *moves)
    true
  rescue CheckersError => e
    false
  end

  # any piece can jump
  def valid_slide?(color)
    player_pieces(color).any?{ |piece| piece.valid_slides.any? }
  end

end
