# encoding: utf-8
require 'colorize'
class Board
  attr_accessor :board

  def initialize(place = true)
    @board = Array.new(8) {Array.new(8)}
    place_pieces if place
  end

  def empty?(pos)
    case self[pos]
    when nil
      true
    else
      false
    end
  end

  def move_piece(start_pos, end_pos, color)
    piece = self[start_pos]
    raise "Invalid move. That is not your piece." if color != piece.color

    raise "Invalid movedsfds."  if piece.move_into_check?(end_pos)

    if piece.moves.include?(end_pos)
      move_piece!(start_pos, end_pos)
    else
      raise "Invalid move."
    end
  end

  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]
    self[start_pos] = nil
    piece.position = end_pos
    self[end_pos] = piece
  end



  def place_pieces

    Rook.new(:black, [0, 0] , self)
    Rook.new(:black, [0, 7], self)
    Rook.new(:white, [7, 0], self)
    Rook.new(:white, [7, 7], self)

    Knight.new(:black, [0, 1], self)
    Knight.new(:black, [0, 6], self)
    Knight.new(:white, [7, 1], self)
    Knight.new(:white, [7, 6], self)

    Bishop.new(:black, [0, 2], self)
    Bishop.new(:black, [0, 5], self)
    Bishop.new(:white, [7, 2], self)
    Bishop.new(:white, [7, 5], self)

    Queen.new(:black, [0, 3], self)
    Queen.new(:white, [7, 3], self)

    King.new(:black, [0, 4], self)
    King.new(:white, [7, 4], self)

    8.times do |idx|
      Pawn.new(:black, [1, idx], self)
      Pawn.new(:white, [6, idx], self)
    end
  end



  def pieces
    board.flatten.compact
  end

  def player_pieces(color)
    pieces.select{ |piece| piece.color == color}
  end

  def piece(color, piece_class)
    player_pieces(color).select { |piece| piece.is_a?(piece_class) }
  end

  def in_check?(color)
    kings = piece(color, King)
    kings.empty? ? return : king = kings.shift
    location = king.position
    other_color = ( color == :black ? :white : :black)

    player_pieces(other_color).any? { |each_piece| each_piece.moves.include?(location) }
  end

  def checkmate?(color)
    return false unless in_check?(color)

    all_pieces = player_pieces(color)

    all_pieces.each do |each_piece|

      return false if each_piece.moves.one? { |move| !each_piece.move_into_check?(move) }
    end

    true
  end

  def display_board
    display_string = "  0  1  2  3  4  5  6  7\n"

    board.each_with_index do |row, row_index|
      display_string << row_index.to_s
      row.each_with_index do |space, column_index|

        string = ( space.nil? ? space = "   " : space.display.to_s)
        if (column_index.odd? && row_index.odd?) || (column_index.even? && row_index.even?)
          string = string.colorize(:background => :green)
        end
        display_string << string

      end
      display_string << "\n"
    end
    display_string
  end

  def render_board
    puts display_board
  end

  def [](pos)
    board[pos[0]][pos[1]]
  end

  def []=(pos, value)
    board[pos[0]][pos[1]] = value
  end

end
