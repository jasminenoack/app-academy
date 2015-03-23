
def maze_solver
  maze=[]
  File.open('./maze.txt').each_line do |line|
    maze << line.chomp.split("")
  end

  start = find_value_multi(maze, 'S')
  finish = find_value_multi(maze, 'E')
  current = start
  # until current == finish
  #   row = current[0]
  #   column = current[1]
  #   if maze[row-1][column] == ' '
  #     maze[row-1][column] = 'X'
  #     current = [row-1, column]
  #   elsif maze[row][column+1] == ' ' ||  maze[row][column+1] == 'E'
  #     maze[row][column+1] = 'X' unless maze[row][column+1] == 'E'
  #     current = [row, column+1]
  #   else
  #     maze[row+1][column] = 'X'
  #     current = [row+1, column]
  #   end
  #   display_multi(maze)
  # end

  display_multi(maze)

  nil
end

def check_surround(maze, current, counter)
  $complete ||= []
  $shortest_path ||= 100
  new_maze = my_dup(maze)
  current_counter = counter
  row = current[0]
  column = current[1]
  if check_win?(new_maze, current)
    if counter < $shortest_path
      display_multi(new_maze)
      $shortest_path = counter
      $complete = new_maze
    end
  end

  if writable?(new_maze, row-1, column, counter)
    new_maze[row-1][column] = counter
    check_surround(new_maze, [row-1,column], current_counter+1)
  end
  if writable?(new_maze, row, column+1, counter)
    new_maze[row][column+1] = counter
    check_surround(new_maze, [row,column+1], current_counter+1)
  end
  if writable?(new_maze, row+1, column, counter)
    new_maze[row+1][column] = counter
    check_surround(new_maze, [row+1,column], current_counter+1)
  end
  if writable?(new_maze, row, column-1, counter)
    new_maze[row][column-1] = counter
    check_surround(new_maze, [row,column-1], current_counter+1)
  end
end

def writable?(maze, row, column, counter)
  return false if counter > $shortest_path
  return true if maze[row][column] == " "
  if maze[row][column].class == Fixnum
    return true if maze[row][column] > counter
  end
  false
end


def check_win?(maze, current)
  row = current[0]
  column = current[1]
  return true if maze[row-1][column] == 'E'
  return true if maze[row+1][column] == 'E'
  return true if maze[row][column-1] == 'E'
  return true if maze[row][column+1] == 'E'
  false
end

def my_dup(maze)
  return_array = []
  maze.each do |row|
    return_row = []
    row.each do |place|
      return_row << place
    end
    return_array << return_row
  end
  return_array
end


def solve_2
  maze=[]
  File.open('./maze.txt').each_line do |line|
    maze << line.chomp.split("")
  end
  start = find_value_multi(maze, 'S')
  check_surround(maze, start, 1)
  solution = to_X($complete)
  display_multi(solution)
  nil
end

def to_X(maze)
  p maze
  maze.each_with_index do |places, row|
    places.each_with_index do |place, column|
      maze[row][column] = 'X' if place.class == Fixnum
    end
  end
  maze
end
