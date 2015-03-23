require 'set'
class WordChain
  attr_accessor :start, :target

  def initialize
    @start = ARGV.shift
    @target = ARGV.shift
    @dictionary = File.readlines('dictionary.txt').map(&:chomp).select do |word|
      word.length == start.length
    end.to_set

    build_tree
  end

  def build_tree
    WordNode.new(start, nil, @dictionary)
  end


end


class WordNode
  attr_accessor :word, :parent, :children, :dictionary

  def initialize(word, parent, dictionary)
    @word = word
    @parent = parent
    @children = children
    @dictionary = dictionary - [word]

    p dictionary

    build_tree
  end

  def build_tree
    children = []

    (0...word.length).each do |index|
      regex_word = word.dup
      regex_word[index] = '.'
      children += @dictionary.select { |word| word =~ /#{regex_word}/ }
    end

    children_dictionary = dictionary - children

    children.each do |word|
      WordNode.new(word, self, dictionary)
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  w = WordChain.new
end
