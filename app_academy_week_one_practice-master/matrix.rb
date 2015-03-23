class Matrix < Array

  def my_transpose
    height = length
    width = self[0].length
    transposed_martix = Array.new(width) {Array.new(height)}

    (0...height).each do |row|
      (0...width).each do |column|
        transposed_martix[column][row] = self[row][column]
      end
    end

    transposed_martix
  end

end

if __FILE__ == $PROGRAM_NAME
  matrix = Matrix.new([[1,2,3],[1,2,3],[1,2,3]])
  p matrix
  p matrix.class
  p matrix.my_transpose==[[1,1,1],[2,2,2],[3,3,3]]

  matrix = Matrix.new([[0, 1, 2],[3, 4, 5],[6, 7, 8]])
  p matrix.my_transpose ==[[0, 3, 6],[1, 4, 7],[2, 5, 8]]

  matrix = Matrix.new([[0, 1, 2],[3, nil, 5],[6, 7, nil]])
  p matrix.my_transpose

  matrix = Matrix.new([[0, 1],[3, nil],[6, 7]])
  p matrix.my_transpose

end
