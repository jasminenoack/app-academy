input=["two;nine;three;one;nine;three;one;seven;one;nine;three;six;zero;four;nine;two;five;zero;six;five",
"four;six;eight;four;zero;seven;zero;seven;six;zero;nine;five;one;two;two;two;four;five;two;one",
"seven;five;five;six;four;zero;two;one;one;zero;three;three;two;eight;four;six;eight;five;two",
"one;four;seven;eight;two;eight;four;zero;one;eight;one;six;six;eight;one;one;three;nine;three",
"five;nine;two;five;three;two;one;eight;one;six;two;three;two;eight;zero;nine;nine;two",
"one;nine;zero;seven;nine;two;three;three;two;zero;nine;four;seven;one;zero;zero;seven;six",
"four;three;seven;five;three;nine;seven;one;six;seven;seven;three;two;zero;five;six;one;three;two",
"eight;eight;four;seven;seven;six;one;two;six;two;zero;six;nine;nine;three;one",
"three;two;one;one;nine;three;five;seven;eight;eight;one;seven;five;six;six;one;two;eight",
"six;seven;three;six;one;one;six;one;four;seven;one;five;four;seven;four;eight;five;four;zero;six",
"seven;five;nine;zero;one;zero;three;one;one;five;three;eight;one;zero;four;five;two",
"four;one;two;one;eight;three;seven;nine;four;three;eight;eight;five;eight;one;one;zero",
"six;three;one;seven;four;nine;seven;five;eight;eight;five;four;eight;one;one;six;eight;six;two;eight",
"five;eight;five;seven;nine;nine;four;zero;one;three;one;four;zero;three;one;one",
"four;eight;six;eight;six;six;two;seven;three;three;nine;six;three;zero;eight;eight;three;three",
"nine;one;four;one;seven;five;three;six;nine;six;five;nine;zero;six;two;three;nine;two;five;five",
"eight;eight;eight;six;eight;three;eight;eight;four;eight;nine;three;seven;zero;two;six;zero;five;one;six",
"six;three;zero;nine;four;six;six;four;seven;one;one;four;nine;six;four",
"one;three;zero;eight;zero;one;nine;one;six;eight;zero;five;three;five;six;two;one",
"one;one;two;nine;eight;five;seven;two;three;three;three;one;seven;nine;one"]

def word_to_num(input)
  words={
  "zero"=>"0",  "one"=>"1",  "two"=>"2",  "three"=>"3",  "four"=>"4",  "five"=>"5",  "six"=>"6",  "seven"=>"7",  "eight"=>"8",  "nine"=>"9"}
  input=input.split(";")
  input.map { |word| words[word] }.join
end

input.each {|line| puts word_to_num(line.chomp)}