class Book
  attr_accessor :title

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

  def title=(str)
    @title=titleize(str)
  end

end