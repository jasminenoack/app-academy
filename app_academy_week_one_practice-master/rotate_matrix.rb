
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





p rotate_90 rotate_90 [[1,2,3],[4,5,6],[7,8,9]]