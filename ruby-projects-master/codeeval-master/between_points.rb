input_1 = "(25, 4) (1, -6)"
input_2 = "(47, 43) (-25, -11)"

def find_vars(input)
  input=input.delete("(")
  input=input.split.map{|x| x.to_i}
end

def distance (array)
  #x1,y1, x2, y2
  Math::sqrt((array[0]-array[2])**2+(array[1]-array[3])**2).to_i
end

puts distance(find_vars(input_1))

puts distance(find_vars(input_2))