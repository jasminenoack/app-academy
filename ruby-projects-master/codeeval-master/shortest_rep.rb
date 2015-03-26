input="abcabcabcabc
bcbcbcbcbcbcbcbcbcbcbcbcbcbc
dddddddddddddddddddd
adcdefg"






def find_rep(word)
  (0...word.length).each do |i|
    return (i+1) if (word.count(word[0..i]))==word.length
  end
end


input.each_line do |line|
  line.chomp!
  puts find_rep(line)
end