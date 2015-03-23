require 'set'

class WordChainer

  def self.player_with_dict(dictionary_at_filename)
    dictionary =  File.readlines(dictionary_at_filename).map(&:chomp)
    dictionary = dictionary.to_set
    self.new(dictionary)
  end

  def initialize(array)
    @dictionary = array
  end

  # To speed up your search greatly, store your dictionary as a Set. The Set#include? method is much faster than Array#include?, since the Array version needs to iterate through all the elements of the array, whereas Set uses a cool trick we'll learn about when we get to the algorithms curriculum.

  def adjacent_words(word)
    one_letter_off = []
    (word.length - 1).times do |i|
      dup_word = word.dup
      dup_word[i] = "."
      one_letter_off += @dictionary.select {|word| word =~ (/\A#{dup_word}\z/) }
    end
    one_letter_off
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = {source => nil}

    until @current_words.empty?
      new_current_words = []
      @current_words.each do |word|
        adjacent_words(word).each do |adj_word|
          next if @all_seen_words.include?(adj_word)
          new_current_words << adj_word
          @all_seen_words[adj_word] = word
          break if adj_word == target
        end
        break if new_current_words.include?(target)
      end
      p new_current_words.sort
      @current_words = new_current_words
      break if new_current_words.include?(target)
    end
    p build_path(target)
  end

  def build_path(target)
    path = [target]
    next_word = target
    loop do
      @all_seen_words[next_word]
      next_word = @all_seen_words[next_word]
      break if next_word.nil?
      path << next_word
    end
    path.reverse
  end

end


if __FILE__ == $PROGRAM_NAME
  w = WordChainer.player_with_dict("dictionary.txt")

 w.run("sinner", "matter")
end
