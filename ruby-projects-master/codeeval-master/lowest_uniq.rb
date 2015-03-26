string_1="3 3 9 1 6 5 8 1 5 3"
string_2="9 2 9 9 1 8 8 8 2 1 1"

def string_to_hash(string)
  cards=string.split
  counts={}
  cards.each {|x| counts[x]=cards.count(x)}
  counts=counts.select{|key, value| value==1}
  return 0 if counts.empty?
  keys=[]
  counts.each{|x| keys<<x[0]}
  string.index((keys.sort.first))/2+1
end

print string_to_hash(string_1)
puts
print string_to_hash(string_2)
