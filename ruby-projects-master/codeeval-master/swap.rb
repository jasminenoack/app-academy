input1="1 2 3 4 5 6 7 8 9 : 0-8"
input2="1 2 3 4 5 6 7 8 9 10 : 0-1, 1-3"

def sep_vars(string)
  string=string.split(" : ")
  list=string.shift.split.map{|x| x.to_i}
  swaps=string.shift.split(", ")
  swaps = swaps.map {|nums| nums.split("-").map{|x| x.to_i}}
  [list, swaps]
end

def switch(vars)
  list=vars[0]
  switches=vars[1]
  switches.each {|x| list[x[0]], list[x[1]]=list[x[1]], list[x[0]] }
  list
end

puts switch(sep_vars(input2.chomp)).join(" ")
