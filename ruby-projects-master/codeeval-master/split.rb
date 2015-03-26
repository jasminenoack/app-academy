input="3413289830 a-bcdefghij
776 a+bc
12345 a+bcde
1232 ab+cd
90602 a+bcde"


input.each_line do |line|

  line.chomp!
  line = line.split
  if line[1].include?("+")
    line[1] = line[1].split("+")
    first = line[1][0].length
    puts line[0][0...first].to_i+line[0][first...line[0].length].to_i
  else
    line[1] = line[1].split("-")
    first = line[1][0].length
    puts line[0][0...first].to_i-line[0][first...line[0].length].to_i
  end

end