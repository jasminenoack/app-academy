# range (0..5)
# base case  [] if end greater than start
# base case [] if start + 1 = end
# next (0..2) [1]

def range_nums(start, finish)
  return [] if start + 1 >= finish

  new_array = [start + 1]
  new_array.concat (range_nums(new_array[-1], finish))

  new_array
end

# Write both a recursive and iterative version of sum of an array.

def sum_iterative(array)
  start = 0

  array.each do |i|
      start += i
  end

  start
end

def sum_recursive(array)
  return 0 if array.empty?
  start = array[0]
  start += sum_recursive(array.drop(1))
end

# # this is math, not Ruby methods.
#
# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)
#
# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b

# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]


def recursion1(b,n)
  return 1 if n == 0

  b *= recursion1(b, n-1)
end

def recursion2(b,n)
  return 1 if n == 0
  return b if n == 1

  if n.odd?
    step = recursion2(b, (n - 1) / 2)
    b = b * (step * step)

  else
    step = recursion2(b, n / 2)
    b = step * step
  end
  b
end


def my_dup(array)
  new_array = []
  array.each do |item|
    if item.is_a?(Array)
      new_array << my_dup(item)
    elsif item.is_a?(String)
      new_array << item += ""
    else
      new_array << item
    end
  end

  new_array
end

def fibs(n)
  return [] if n == 0
  return [0] if n == 1
  return [0,1] if n == 2

  previous_fib = fibs(n-1)
  previous_fib << previous_fib[-1] + previous_fib[-2]
end

def binary_search(array, target)

  array.sort!
  return nil if array.empty? ||
    (array.count == 1 && array[0] != target)

  middle_idx = array.length/2
  middle_num = array[middle_idx]
  case target <=> middle_num
  when -1
    middle_idx+= binary_search(array[0...middle_idx], target) + 1
  when 1
    middle_idx+= binary_search(array[middle_idx+1..-1], target) + 1
  when 0
    middle_idx
  end

end
