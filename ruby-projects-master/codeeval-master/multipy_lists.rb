input= ["9 0 6 | 15 14 9\n", "5 | 8\n", "13 4 15 1 15 5 | 1 4 15 14 8 2\n"]

def multiply_across_lists (lists)
  lists=lists.split(" | ")
  list_1=lists[0].split.map{|x| x.to_i}
  list_2=lists[1].split.map{|x| x.to_i}
  idx=0
  product=[]
  while idx<list_1.length
    product<<list_1[idx]*list_2[idx]
    idx+=1
  end
  product.join(" ")
end

input.each do |line|
  puts multiply_across_lists(line.chomp)
end

