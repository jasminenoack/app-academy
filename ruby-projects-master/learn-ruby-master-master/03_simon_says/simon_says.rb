def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, repeat = 2)
  ([word]*repeat).join(" ")
end

def start_of_word(word, num)
  word[0...num]
end

def first_word (str)
  str.split.first
end

def small_word(word)
  ['a', 'an', 'the', #articles
    'and', 'but', 'or', 'nor', #conjunctions
    'at', 'by', 'for', 'from', 'in', 'into', 'of',
    'off', 'on', 'onto', 'out', 'over', 'up', 'with', #prepositions
    'to', 'as'
    ].include? word
end

def titleize(str)
  str=str.split.each_with_index do |word, index|
    if index==0
      word.capitalize!
    elsif small_word(word)
    else
      word.capitalize!
    end
  end
  str.join(" ")
end
