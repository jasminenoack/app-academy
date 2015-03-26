def add (a, b)
  a+b
end

def subtract (a, b)
  a-b
end

def sum(arr)
  return 0 if arr.empty?
  arr.inject(:+)
end

def multiply (*a)
  a.inject(:*)
end

def power (num, power)
  num**power
end

def factorial(num)
  return 1 if num==0
  num*factorial(num-1)
end