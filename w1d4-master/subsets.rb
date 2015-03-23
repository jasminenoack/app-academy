# Write a method, subsets, that will return all subsets of an array.
# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
#
# # you can implement this as an Array method if you prefer.
# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:
#
# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.


class Array

  def subsets
    return [[]] if self.length == 0
    return [self, []] if self.length == 1

    base_arrays = (self.drop(1)).subsets
    (0...base_arrays.length).each do |i|

      base_arrays << base_arrays[i] + [self[0]]
      p base_arrays
    end

    base_arrays.sort
   end

end
