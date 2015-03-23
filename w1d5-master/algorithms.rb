require 'byebug'

class PolyTreeNode
  attr_accessor :value
  attr_reader :parent, :children

  def initialize(value)
    @value = value
    @children = []
  end

  def parent= (parent)
    previous_parent = @parent
    if previous_parent
      @parent.children.delete(self)
    end

    @parent = parent

    if @parent
      @parent.children << self
    end

    self
  end

  def remove_child(child)
    if @children.include?(child)

      child.parent = nil
    else
      raise "No Child"
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def to_s
    value
  end

  def dfs(target_value)

    return self if value == target_value
    # return nil if children.empty?

    children.each do |child|
      result = child.dfs(target_value)
      if result
        return result
      end
    end

    nil
  end

  def bfs(target_value)
    queue = [self]


    until queue.empty?
      current_node = queue.shift
      if current_node.value == target_value
        return current_node
      else
        queue += current_node.children
      end
    end
    nil
  end

  def trace_path_back(target_value)
        current_node = bfs(target_value)
        path_arr = [current_node]

        until path_arr[-1].parent.nil?
          path_arr << (path_arr[- 1]).parent
        end
        path_arr.map {|node| node.value}
  end

end
