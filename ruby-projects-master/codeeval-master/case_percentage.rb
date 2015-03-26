input="thisTHIS
AAbbCCDDEE
N
UkJ"

input.each_line do |line|
  line.chomp!
  total=line.length.to_f
  upper=line.scan(/[A-Z]/).count
  p_upper=upper/total*100
  p_lower=100-p_upper
  printf("lowercase: %.2f uppercase: %.2f", p_lower, p_upper)
  puts
end
