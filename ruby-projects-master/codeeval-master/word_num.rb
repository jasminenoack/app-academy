input1="nine;three;two;five;three;eight;four;five;three;seven;zero;three;two;one;nine;zero;nine"
input2="three;six;three;zero;one;four;eight;zero;one;zero;eight;two;nine;seven;eight;eight"
input3="five;zero;eight;seven;four;three;zero;four;four;two;seven;seven;four;one;one;seven"

def convert(line)
  line=line.split(";")
  numbers={"zero"  => '0' ,
           "one"   => '1' ,
           "two"   => '2' ,
           "three" => '3' ,
           "four"  => '4' ,
           "five"  => '5' ,
           "six"   => "6" ,
           "seven" => "7" ,
           "eight" => "8" ,
           "nine"  => "9"
           }
  number=""
  line.each {|word| number << numbers[word]}
  puts number
end

convert(input1)
convert(input2)
convert(input3)
