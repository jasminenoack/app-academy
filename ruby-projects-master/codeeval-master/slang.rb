slang = [", yeah!", 
  ", this is crazy, I tell ya.", 
  ", can U believe this?", 
  ", eh?", 
  ", aw yea.", 
  ", yo.", 
  "? No way!", 
  ". Awesome!"]

input="Lorem ipsum dolor sit amet. Mea et habeo doming praesent. Te inani utroque recteque has, sea ne fugit verterem!
Usu ei scripta phaedrum, an sed salutatus definiebas? Qui ut recteque gloriatur reformidans. Qui solum aeque sapientem cu.
Eu nam nusquam quaestio principes."
punctuation=0
  slang_index=0

input.each_line do |line|
  
  line.chomp!
  line=line.split("")
  line.each_with_index do |char,index|
    if char=~/[!.?]/
      punctuation+=1
      if punctuation.even?
        print slang[slang_index%slang.length]
        slang_index+=1
      else
        print char
      end
    else
      print char
    end
  end
  puts
end
