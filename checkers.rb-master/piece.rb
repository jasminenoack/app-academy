# encoding utf-8

require 'byebug'
require 'colorize'
class Piece
  VERT = [-1, 1]
  attr_accessor :color, :pos, :board, :king

  def display
    if king
      @color == :red ? " ◒ ".colorize(:red) : " ◒ "
    else
      @color == :red ? " ◉ ".colorize(:red) : " ◉ "
    end
  end

  #initialize as not a king, with a color, and pos, reference to board
  def initialize(color, pos, board, king = false)
    @color, @pos, @board = color, pos, board
    board.place_piece(self, pos)
    @king = king
  end

  #check if enemey call to board to check if occupied
  def enemy?(pos)
    return false unless board.on_board?(pos)
    board[pos].color != color
  end

  def find_slide_end(delta)
    [pos[0] + delta[0], pos[1] + delta[1]]
  end

  def find_jump_end(delta)
    [pos[0] + (2 * delta[0]), pos[1] + (2 * delta[1])]
  end

  def find_mid_num(nums)
    nums.sort!
    (nums[0]..nums[1]).to_a[1]
  end

  #determine vertical movement
  def horz_dir
    return [1, -1] if king
    color == :red ? [-1] : [1]
  end

  # check if promotion is necessary
  def maybe_promote
    return unless promote?
    promote!
  end

  # complete a slide without a validity check
  def move!(end_pos)
    board.remove_piece(pos)

    if (pos[0] - end_pos[0]).abs == 2
      board.remove_piece(jumped_place(end_pos))
    end

    self.pos = end_pos
    board.place_piece(self, end_pos)

    maybe_promote
  end

  def jumped_place(end_pos)
    [find_mid_num([pos[0], end_pos[0]]), find_mid_num([pos[1], end_pos[1]])]
  end


  # determine possible move directions
  def move_diffs
    horz_dir.each_with_object([]) do |horz, moves|
      VERT.each do |vert|
        moves << [horz, vert]
      end
    end
  end

  #complete a jump, check valid jump and then perform_jump!
  def perform_jump(end_pos)
    return false unless valid_jump?(end_pos)

    move!(end_pos)
    true
  end

  # perform slide, call valid slide, then perform_slide!
  def perform_slide(end_pos)
    return false unless valid_slide?(end_pos)

    move!(end_pos)
    true
  end

  def promote!
    self.king = true
  end

  def promote?
    pos[0] == (color == :red ? 0 : 7 )
  end

  #check valid jump
  def valid_jump?(end_pos)
    valid_jumps.include?(end_pos)
  end

  def valid_jumps
    moves = []

    move_diffs.each do |delta|
      jumped = find_slide_end(delta)

      next unless board.on_board?(jumped)
      next unless board.occupied?(jumped) && enemy?(jumped)
      
      end_pos = find_jump_end(delta)
      if (board.on_board?(end_pos) && !board.occupied?(end_pos))
        moves <<  end_pos
      end
    end

    moves
  end

  #check valid_slide
  def valid_slide?(end_pos)
    #can't slide if any jump is available.
    !board.valid_jump?(self.color) && valid_slides.include?(end_pos)
  end

  def valid_slides
    moves = []

    move_diffs.each do |delta|
      end_pos = find_slide_end(delta)
      if (board.on_board?(end_pos) && !board.occupied?(end_pos))
        moves <<  end_pos
      end
    end

    moves
  end



  def inspect
    self.class
  end

end
