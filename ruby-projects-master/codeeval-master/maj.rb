def major_element(numbers)
  half_count = numbers.size / 2
  numbers.uniq.each do |number|
    count = numbers.find_all { |n| n == number }.size
    return number if count > half_count
  end
  nil
end

f=File.open("./lines.txt").each_line do |line|
  numbers = line.chomp.split(',')
  puts major_element(numbers) || 'NONE'
end
