input="00 0 0 00 00 0
00 0
00 0 0 000 00 0000000 0 000
0 000000000 00 00"


def to_binary(line)
  line=line.split.each_slice(2).to_a
  binary=[]
  line.each do |zeroes|
    zeroes[1].length.times{binary<<1} if zeroes[0]=="00"
    zeroes[1].length.times{binary<<0} if zeroes[0]=="0"
  end
  return binary
end

def to_integer(binary)
  total=0
  binary.reverse.each_with_index do |num, index|
    total+= (2**index)*num
  end
  return total
end

input.each_line do |line|
  binary=to_binary(line.chomp)
  puts to_integer(binary)
end
