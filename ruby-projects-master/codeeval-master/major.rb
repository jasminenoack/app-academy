line_1 = "92,19,19,76,19,21,19,85,19,19,19,94,19,19,22,67,83,19,19,54,59,1,19,19"
line_2 = "92,11,30,92,1,11,92,38,92,92,43,92,92,51,92,36,97,92,92,92,43,22,84,92,92"
line_3 = "4,79,89,98,48,42,39,79,55,70,21,39,98,16,96,2,10,24,14,47,0,50,95,20,95,48,50,12,42"

def find_major(line)
  line=line.split(",")
  goal=line.length/2
  while line.length>0
    return line[0] if line.count(line[0])>goal
    line.delete(line[0])
  end
  "NONE"
end

f=File.open("./lines.txt").each_line do |line|
    puts "#{find_major(line.chomp)}"
end
