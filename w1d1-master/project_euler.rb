sum = 0
(0...1000).each do |n|
  sum += n if (n % 3 == 0) || (n % 5 == 0)
end
puts sum

fibonaccis = [1, 2]
while fibonaccis[-1] + fibonaccis[-2] < 4_000_000
  new_fib = fibonaccis[-1] + fibonaccis[-2]
  fibonaccis << new_fib
end

puts fibonaccis.select { |num| num.even? }.inject(:+)

def is_prime?(n)
  (2..n-1).each do |i|
    return false if n % i == 0
  end
  true
end

def largest_prime(n)
  index = 2
  largest_factor = 0
  while n != 1
    if is_prime?(index) && n % index == 0
      n = n / index
      largest_factor = index
    end
    index += 1
  end
  return largest_factor
end

puts largest_prime(600851475143)

def largest_palindrome
  indexs_1 = (500..999).to_a.reverse
  indexs_2 = (500..999).to_a.reverse
  products = []

  indexs_1.each do |i|
    indexs_2.each do |j|
      products << i * j
    end
  end

  products.sort.reverse.each do |num|
    return num if num_is_palindrome?(num)
  end

end

def num_is_palindrome?(num)
  num.to_s.reverse == num.to_s
end

puts largest_palindrome

def smallest_multiple
  index = 20
  until divisible_by_all?(index)
    index += 20
  end
  return index
end

def divisible_by_all?(number)
  (2..20).each do |num|
    return false unless number % num == 0
  end
  true
end

puts smallest_multiple
