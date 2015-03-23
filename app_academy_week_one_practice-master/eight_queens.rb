
class EightQueensNode
  attr_accessor :board, :transposed_board, :parent, :children, :placed, :depth

  def self.first_board(pos)
    board = Array.new(8) {Array.new(8)}
    EightQueensNode.new(board, pos, 0)
  end

  def initialize(board, pos, depth, parent = nil)
    @board = board
    @parent = parent
    @children = []
    @placed = pos
    set_queen(pos) unless pos.nil?
    parent.children << self unless parent.nil?
    transpose
    @depth = depth
    build_tree
  end

  def available?(pos)
    empty?(pos) && horizontal?(pos) && vertical?(pos) && diaganol?(pos)
  end

  def empty?(pos)
    self[pos].nil?
  end

  def horizontal?(pos)
    row = pos[0]
    board[row].none?
  end

  def vertical?(pos)
    column = pos[1]
    transposed_board[column].none?
  end

  def diaganol?(pos)
    return false unless one_diaganol?(1 , 1, pos)
    return false unless one_diaganol?(1, -1, pos)
    return false unless one_diaganol?(-1, -1, pos)
    return false unless one_diaganol?(-1, 1, pos)
    true
  end

  def one_diaganol?(row_increment, column_increment, pos)
    row = pos[0] - (row_increment)
    column = pos[1] + column_increment

    while row.between?(0, 7) && column.between?(0, 7)
      return false unless board[row][column].nil?

      row -= (row_increment)
      column += (column_increment)
    end

    true
  end

  def [](pos)
    row = pos[0]
    column = pos[1]

    board[row][column]
  end

  def []=(position, value)
    row = position[0]
    column = position[1]

    board[row][column] = value
  end

  def transpose
    @transposed_board = Array.new(8) {Array.new(8)}

    (0..7).each do |row|
      (0..7).each do |column|
        transposed_board[column][row] = self[[row,column]]
      end
    end
  end

  def set_queen(coordinates)
    self[coordinates]=:Q
    transpose
  end

  def build_tree
    return if depth > 8
    row = pick_row
    return if row.nil?

    (0..7).each do |column|
      if available?([row,column])
        EightQueensNode.new(dup, [row, column], depth+1, self)
      end
    end

  end

  def pick_row
    (0..7).each do |row|
      return row if board[row].none?
    end
    nil
  end

  def dup
    @board.dup.map(&:dup)
  end

  def find_node_by_depth(target)

    return self if depth == target
    return nil if children.empty?

    children.each do |child|
      result = child.find_node_by_depth(target)
      return result if result
    end

    nil
  end

  def find_all_at_depth(target)
    queue = [self]

    until queue.first.depth == 8
      node = queue.shift
      queue += node.children
    end

    queue
  end

  def remove_repeats
    all_solutions = find_all_at_depth(8)
    solutions = all_solutions.dup.each(&:dup)
    no_repeats = []

    until solutions.empty?
      puzzle = solutions.shift

      solutions.reject! do |node|
        # flip
        flip(puzzle.board) == node.board ||
          # rotate 90
        (rotated = rotate_90(puzzle.board)
        rotated == node.board ) ||
          # flip
          (flip(rotated) == node.board) ||
          # rotate 180
        (rotated = rotate_90(rotated)
        rotated == node.board )||
          # flip
          (flip(rotated) == node.board) ||
          # rotate 270
        (rotated = rotate_90(rotated)
        rotated == node.board ) ||
          # flip
          (flip(rotated) == node.board)
      end

      no_repeats << puzzle
    end

    no_repeats
  end

  def rotate_90(array)
    length = array.length
    new_array = Array.new(length) {Array.new(length) }
    max_index = length - 1

    (0..max_index).each do |row|
      (0..max_index).each do |column|
        new_column = max_index - row
        new_array[column][new_column] = array[row][column]
      end
    end

    new_array
  end

  def flip(array)
    array.map{|row| row.reverse}
  end

  def placements

    queen_placements = [self]

    until queen_placements.last.parent.placed.nil?
      queen_placements << queen_placements.last.parent
    end

    queen_placements.map{|node| node.placed}
  end

  def draw_board
    board_string = "\n _ _ _ _ _ _ _ _\n"

    board.each do |row|
      board_string << "|"
      row.each do |el|
        board_string << "_" if el.nil?
        board_string << el.to_s if el == :Q
        board_string << "|"
      end
      board_string << "\n"
    end

    board_string << "\n"
  end

end



if __FILE__ == $PROGRAM_NAME

  puts "looking for solutions"
  t = Time.now
  k = EightQueensNode.first_board(nil)

  # answers = k.find_all_at_depth(8)

  # answers.each_with_index do |node, index|
  #   puts index + 1
  #   puts node.draw_board
  # end

File.open('eight_queens', 'a') do |f|

  k.remove_repeats.each_with_index do |node, index|
    f.puts index + 1
    f.puts node.draw_board
  end

end




  # p t - Time.now

  # k = EightQueensNode.first_board([0,0])
  # k.set_queen([1,2])
  # p k.board

  # (2..7).each do |row|
  #   (0..7).each do |column|
  #     p "row and column"
  #     p [row, column]
  #     p "empty"
  #     p k.empty?([row, column])
  #     p "horizontal"
  #     p k.horizontal?([row, column])
  #     p "vertical"
  #     p k.vertical?([row, column])
  #     p "diaganol"
  #     p k.diaganol?([row, column])
  #     p "available"
  #     p k.available?([row, column])
  #   end
  # end


end
