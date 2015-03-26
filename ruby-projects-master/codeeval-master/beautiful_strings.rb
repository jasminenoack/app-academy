value1 = 152
string1 = "ABbCcc"

value2 = 754
string2 = "Good luck in the Facebook Hacker Cup this year!"

value3 = 491
string3 = "Ignore punctuation, please :)"

value4 = 729
string4 = "Sometimes test cases are hard to make up."

value5 = 646
string5 = "So I just go consult Professor Dalves"


def count_letters(input)
  string=input
  letters={}
  string.downcase!.each_char do |char|
    if char =~ /[a-z]/
      letters[char]=string.count(char)
    end
  end
  letters.sort_by{|key, value| value}.reverse
end

def sum_letters (input)
  sum=0
  value=26
  input.each do |set|
    sum=sum + set[1] * value
    value-=1
  end
  sum
end

counts1= count_letters(string1)
puts "length = #{string1.length}"
puts "string 1, counts: #{counts1}"
sum1 = sum_letters(counts1)
puts "sum should equal #{value1}: #{sum1}"
gets 

counts2= count_letters(string2)
puts "length = #{string2.length}"
puts "string 2, counts: #{counts2}"
sum2 = sum_letters(counts2)
puts "sum should equal #{value2}: #{sum2}"
gets

counts3= count_letters(string3)
puts "length = #{string3.length}"
puts "string 3, counts: #{counts3}"
sum3 = sum_letters(counts3)
puts "sum should equal #{value3}: #{sum3}"
gets

counts4= count_letters(string4)
puts "string 4, counts: #{counts4}"
puts "length = #{string4.length}"
sum4 = sum_letters(counts4)
puts "sum should equal #{value4}: #{sum4}"
gets

counts5= count_letters(string5)
puts "string 5, counts: #{counts5}"
puts "length = #{string5.length}"
sum5 = sum_letters(counts5)
puts "sum should equal #{value5}: #{sum5}"
gets