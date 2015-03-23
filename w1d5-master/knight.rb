require './algorithms.rb'
require 'byebug'

class KnightPathFinder
  KNIGHT_MOVES = [
    [2,1],
    [1,2],
    [-1,-2],
    [-2,-1],
    [-1,2],
    [2,-1],
    [1,-2],
    [-2,1]
  ]

  def self.valid_moves(pos)
    moves = []

    KNIGHT_MOVES.each do |move_change|
      start_row = pos[0]
      start_column = pos[1]
      change_in_row = move_change[0]
      change_in_column = move_change[1]

      new_row = start_row + change_in_row
      new_column = start_column + change_in_column


        new_position = [new_row, new_column]
        moves << new_position
    end
    valid_moves = moves.select {|pos| pos.all?{|num| num.between?(0,7) }}

  end

  def initialize(position=[0,0])
    @board = Array.new(8) {Array.new(8)}
    @position = position
    @visited_positions = [position]
    @move_tree = build_move_tree(position)
  end

  def new_move_positions(pos)
    possible_moves = self.class.valid_moves(pos)
    possible_moves -= @visited_positions
    @visited_positions += possible_moves
     possible_moves
  end

  def build_move_tree(pos)
    @move_tree = PolyTreeNode.new(pos)
    queue = [@move_tree]

    until queue.empty?
      #
      current_position = queue.shift
      #find moves
      next_moves = new_move_positions(current_position.value)
      p next_moves
      #make children
      next_moves_nodes = []
      next_moves.each do |move_position|
        child = PolyTreeNode.new(move_position)
        current_position.add_child(child)
        queue.push(child)
      end
      #add to queue
    end

    @move_tree
  end

  def find_path(end_pos)
  @move_tree.trace_path_back(end_pos).reverse  
  end
end
