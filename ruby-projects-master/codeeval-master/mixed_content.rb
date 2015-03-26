input= "8,33,21,0,16,50,37,0,melon,7,apricot,peach,pineapple,17,21
24,13,14,43,41"


input.each_line do |line|
  line.chomp!
  line=line.split(",")
  numbers=[]
  nums=("0".."9").to_a
  line.each_with_index do |arg, index|
      numbers<<arg if nums.include?(arg[0])
  end
  numbers.each {|num| line.delete(num)}
  if line.empty?
    puts numbers.join(",")
  elsif numbers.empty?
    puts line.join(",")
  else
    puts "#{line.join(",")}|#{numbers.join(",")}"
  end
end