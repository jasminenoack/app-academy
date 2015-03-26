class Dictionary
  attr_accessor :entries

  def initialize
    @entries={}
  end

  def add(entry)
    if entry.class==Hash
      @entries[entry.keys[0]]=entry.values[0]
    else
      @entries[entry]=nil
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include?(word)
    @entries.keys.include?(word)
  end

  def find(word)
    words={}
    length=word.length
    @entries.keys.each do |entry|
      if entry[0...length] == word
        words[entry]= @entries[entry]
      else
        {}
      end
    end
    words
  end

  def printable
    output=""
    @entries.keys.sort.each do |word|
      output << %Q{[#{word}] "#{@entries[word]}"\n}
    end
    output.chomp
  end

end
