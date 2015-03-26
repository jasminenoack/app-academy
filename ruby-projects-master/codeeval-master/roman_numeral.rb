def num_of(num, numeral_value)
  return 0 if num<numeral_value
  num/numeral_value
end

def numeral_hash
  numerals = {1000 => "M", 900 => "CM", 
               500 => "D", 400 => "CD", 
               100 => "C",  90 => "XC", 
                50 => "L",  40 => "XL", 
                10 => "X",   9 => "IX", 
                 5 => "V",   4 => "IV",
                 1 => "I"}
end


def convert(num)
  numerals=numeral_hash
  return numerals[num] if numerals.keys.include?(num)
  numeral=""
  numerals.each do |value, roman|
    num_numeral = num_of(num, value)
    num=num-num_numeral*value
    numeral<< (roman * num_numeral)
  end
  numeral
end
