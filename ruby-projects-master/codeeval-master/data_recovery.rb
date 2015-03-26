input="the the be equivalent translated it making time than However, ran, to machine machine slower process code program code every had running into the much;16 2 6 23 7 13 15 12 20 1 14 5 9 24 19 17 25 3 10 11 4 21 8 22"
=begin

first languages designed were in the written to 1950s a programming communicate instructions The computer to;2 4 5 12 14 15 13 6 16 10 3 7 8 1 11

1945 language and for early German 1943 computer to designed high-level Konrad Plankalkul, Zuse be programming a An the was between developed for Z3 by;25 5 24 9 2 17 23 11 6 8 3 20 13 21 7 4 10 1 16 12 22 14 15 18
Manchester separate thread University of for developed Autocode contemporary Atlas Atlas A but was of development, 1 the machine;16 4 5 14 6 12 11 9 2 17 8 1 3 10 15 7 18 13
Alick developed the Autocode University Manchester, of Glennie At in early the 1950s;6 8 11 9 3 5 4 7 1 10 12 2
the of the Manchester, Autocode At in early Alick 1950s Glennie University developed;2 4 11 5 9 1 10 12 6 13 7 3
it language, compiler code automatically language convert into machine the A programming a to used;4 3 7 15 9 12 10 13 14 11 1 2 6 8
the be running ran, machine time slower translated process code code the it had into machine every much program However, to equivalent than the making;22 6 21 14 24 12 19 7 17 25 10 2 13 4 8 9 11 18 3 1 5 23 20 16
written Mark Autocode programs ran in 1952 1 from The Manchester;7 3 9 6 5 8 11 4 10 1
to the compiler A automatically convert language it machine used code into a language, programming;8 11 7 1 9 10 12 4 14 5 15 13 6 3
'Mark second was for the 1954 autocode called developed the was by Brooker in Autocode' 1 Mark The and 1;18 2 15 6 17 13 3 16 5 7 4 10 11 12 20 9 8 1 14
in written instructions were 1950s the communicate languages a to The to programming designed first computer;14 13 8 12 16 15 7 4 10 6 1 9 3 5 2
developed was first the mid IBM language became at The programming widely general purpose the Fortran high-level language and in used '50s,;5 4 15 9 10 7 22 13 6 1 21 16 19 20 14 3 18 2 12 8 17
machine time equivalent to much be the However, into than ran, slower the the process making code had code program translated it machine every running;24 12 23 5 18 6 16 1 8 20 14 19 2 22 17 15 10 4 25 3 7 13 9 11
UNIVAC was for the from period It developed during I until at Rand Remington the 1955 1959;6 2 4 5 14 13 1 3 11 7 16 8 10 9 12 15
slower the program machine time equivalent translated However, every running machine had code much code the into it process be than ran, the making to;19 2 3 24 12 23 7 1 11 21 9 4 10 18 25 22 8 13 17 6 20 14 16 15
first for computer to considered the first be and at Manchester compiler The is code was the and language programming developed compiled of 1952 the University high-level in 1 Mark;26 10 14 23 22 16 2 24 4 15 19 5 1 21 3 6 25 20 30 29 7 27 18 9 11 17 28 8 13
Autocode straight diagnostics circumstances, were time for for a and was noted which for was 2 adapted object optimisation as development the from advanced it its EDSAC Known Mercury code Autocode, local and source-language;13 9 28 17 30 34 21 32 8 26 19 20 29 15 7 4 14 23 25 2 10 33 11 31 6 22 3 1 12 24 5 16 18
it not and until 1998 However, implemented was 2000;2 4 8 6 7 1 5 3
and not until 2000 it implemented 1998 was However,;8 4 6 9 2 5 7 3
"
=end

def missing_num(nums, num)
  high=nums.sort.last
  (0..num).each do |num|
    return num unless nums.include?(num)
  end

end

input.each_line do |line|
  line=line.chomp.split(";")
  words=line[0].split
  numbers=line[1].split.map{|num| num.to_i-1}
  output={}
  output[missing_num(numbers, words.length)] = words.pop
  words.each_with_index do |word, index|
    output[numbers[index]]=word
  end
  output=output.sort_by{|index, word| index}
  string=[]
  output.each do |word|
    string<<word[1]
  end
  puts string.join(" ")
end



# However, it was not implemented until 1998 and 2000
# The first programming language
# The Manchester Mark 1 ran programs written in Autocode from 1952
