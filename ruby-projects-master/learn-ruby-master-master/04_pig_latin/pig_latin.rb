def translate (str)
  pig_latin=[]
  str.split.each do |word|
    pig_latin<<translate_word(word)
  end
  pig_latin.join(" ")
end

def move(word, num_char)
  word[num_char...word.length]+word[0...num_char]+"ay"
end

def vowel?(letter)
  "aeiou".include? letter
end

def translate_word(word)
  if vowel?(word[0])
    move(word,0)
  elsif (!vowel?(word[1]) && !vowel?(word[2])) || word[1..2]=="qu"
    move(word,3)
  elsif !vowel?(word[1]) || word[0..1]=="qu"
    move(word,2)
  else
    move(word,1)
  end
end

