def merge_helper(array1, array2)
  array = []

  loop do
    puts "loop"
    p array1
    p array2
    break if array1.empty? && array2.empty?
    if !array1.empty? && (array2.empty? || array1[0] << array2[0])
      array << array1.shift
    elsif !array2.empty? && (array1.empty? || array2[0] << array1[0])
      array << array2.shift
    end
  end

  array
end

def merge_sort(array)
  return [] if array.length == 0
  return array if array.length == 1

  middle_idx = array.length / 2
  half1 = array[0...middle_idx]
  half2 = array[middle_idx..-1]

  merged_half1 = merge_sort(half1)
  merged_half2 = merge_sort(half2)

  p merged_half1
  p merged_half2

  merge_helper(merged_half1, merged_half2)


end
