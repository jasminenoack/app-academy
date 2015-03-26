input_1 = "osSE5Gu0Vi8WRq93UvkYZCjaOKeNJfTyH6tzDQbxFm4M1ndXIPh27wBA rLclpg| 3 35 27 62 51 27 46 57 26 10 46 63 57 45 15 43 53"
input_2 = "3Kucdq9bfCEgZGF2nwx8UpzQJyHiOm0hoaYP6ST1WM7Nks5XjrR4IltBeDLV vA| 2 26 33 55 34 50 33 61 44 28 46 32 28 30 3 50 34 61 40 7 1 31"

def sep_vars(string)
  string=string.split("|")
  chars=string[0]
  code=string[1].strip.split.map{|x| x.to_i}
  [chars, code]
end

def find(args)
  chars=args[0]
  code=args[1]
  output=""
  code.each {|x| output<<chars[x-1]}
  output
end


puts find(sep_vars(input_1))
puts find(sep_vars(input_2))