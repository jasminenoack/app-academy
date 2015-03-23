def sum_digits(num)
  return num if num < 10

  place = num % 10
  total = sum_digits(num / 10)

  total + place
end

File.open(ARGV.shift).each_line do |line|
  puts sum_digits(line.to_i)
end