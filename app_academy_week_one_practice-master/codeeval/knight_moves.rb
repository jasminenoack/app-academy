class Knight < Object
  MOVES = [
    [1, 2],
    [2, 1],
    [-1, 2],
    [2, -1],
    [-2, 1],
    [1, -2],
    [-1, -2],
    [-2, -1]
  ]

  def find_coordinate(place)
    letters = ('a'..'h').to_a
    place_array = place.split('')
    column, row = place_array

    row = row.to_i - 1
    column = letters.index(column)
    [row, column]
  end

  def valid_moves(coordinates)
    moves = []

    MOVES.each do |move|
      new_row = move[0] + coordinates[0]
      new_column = move[1] + coordinates[1]
      moves << [new_row, new_column]
    end

    moves.select { |move| move.all? { |num| num.between?(0, 7) } }
  end

  def return_placement(coordinates)
    letters = ('a'..'h').to_a
    row = coordinates[0]
    column = coordinates[1]

    row = (row + 1).to_s
    column = letters[column]

    column + row
  end

  def find_moves(place)
    coordinates = find_coordinate(place)
    moves = valid_moves(coordinates)
    moves.map { |move| return_placement(move) }.sort.join(' ')
  end
end

k = Knight.new

File.open(ARGV.shift).each_line do |line|
  puts k.find_moves(line)
end
