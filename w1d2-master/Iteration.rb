def factors(num)
  factors_of_num = []

  1.upto(num).each do |factor|
    factors_of_num << factor if num % factor == 0
  end

  factors_of_num
end

def bubble_sort(arr)
  sorted = false

  while sorted
    sorted = true

    (0...arr.length - 1).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      end
    end
  end

  arr
end

def substrings(str)
  subs = []

  (0...str.length).each do |i|
    (i...str.length).each do |j|
      subs << str[i..j]
    end
  end

  subs.uniq.sort
end

def subwords(str)
  substrings = substrings(str)
  f = File.open('dictionary.txt')
  dictionary = f.read.split("\n")
  f.close
  words = []

  substrings.each do |word|
    words << word if dictionary.include?(word)
  end

  words
end
