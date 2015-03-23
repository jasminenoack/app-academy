#Problem 1: You have array of integers. Write a recursive solution to find
#the sum of the integers.

def sum_recur(array)
  new_array = array.dup

  return 0 if array.empty?
  new_array.pop + sum_recur(new_array)

end


#Problem 2: You have array of integers. Write a recursive solution to
#determine whether or not the array contains a specific value.

def includes?(array, target)
  new_array = array.dup

  return false if array.empty?
  target == new_array.shift || includes?(new_array, target)
end


#Problem 3: You have an unsorted array of integers. Write a recursive
#solution to count the number of occurrences of a specific value.

def num_occur(array, target)
  new_array = array.dup

  return 0 if array.empty?
  (new_array.shift == target ? 1 : 0) + num_occur(new_array, target)
end


#Problem 4: You have array of integers. Write a recursive solution to
#determine whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  new_array = array.dup

  previous = new_array.shift
  return false if new_array.empty?
  previous + new_array[0] == 12 || (add_to_twelve?(new_array))
end


#Problem 5: You have array of integers. Write a recursive solution to
#determine if the array is sorted.

def sorted?(array)
  new_array = array.dup

  return true if array.size < 2
  new_array.shift <= new_array.first && sorted?(new_array)
end


#Problem 6: Write the code to give the value of a number after it is
#reversed. Must use recursion. (Don't use any #reverse methods!)

def reverse(number)
  new_number = number

  return number if number < 10
  power = 1
  until number/power < 10
    power *= 10
  end

  new_number % 10 * power + reverse(new_number/10)

end

