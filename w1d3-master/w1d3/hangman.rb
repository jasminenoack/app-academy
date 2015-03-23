ALPHABET = ("a".."z").to_a

class Hangman
  def self.setup
    puts "Would you like to be the guesser? (y/n)"

    if gets.chomp.downcase =="y"
      self.new(HumanPlayer.new, ComputerPlayer.new)
    else
      self.new(ComputerPlayer.new, HumanPlayer.new)
    end.play

  end

  def initialize(guesser, checker)
    @guesser= guesser
    @checker= checker
  end

  def play
    @checker.pick_word

    loop do
      display_play_ui

      process_guess

      break if @checker.won?
    end

    winner
  end

  private

    def winner
      puts ""
      puts "Secret Word: #{@checker.word_progress_string}"
      puts "The Guesser Wins!"
    end

    def display_play_ui
      puts "Secret Word: #{@checker.word_progress_string}"
      puts ""
      puts "Already guessed: #{@guesser.guessed_letters.sort.join(", ")}"
    end

    def process_guess
      guess = @guesser.guess_letter(@checker.word_progress_string)
      @checker.handle_guess(guess)
    end

end

class HumanPlayer
  attr_reader :word_progress, :guessed_letters

  def initialize
    @guessed_letters = []
  end

  def pick_word
    puts "How long is your word? "
    length = gets.to_i
    @word_progress = Array.new(length)
  end

  def guess_letter(hint)
    guess = ""

    loop do
      guess = get_input

      break if valid?(guess)
    end

    guessed_letters << guess

    guess
  end

  def handle_guess(guess)
    update_progress(guess) if correct_guess?(guess)
  end

  def won?
    @word_progress.all?
  end

  def word_progress_string(array = @word_progress)
    array.map{|chr| chr.nil? ? "." : chr}.join
  end

  private

    def get_input
      puts "What letter would you like to guess? "
      gets.chomp.downcase
    end

    def correct_guess?(guess)
      puts "The computer guesses: #{guess}"
      puts ""
      puts "Is this letter in your word? (y/n)"

      gets.chomp.downcase == "y"
    end

    def update_progress(guess)
      update_progress_ui
      test_array = find_test_array(guess)

      confirm_update?(test_array) ?
        @word_progress = test_array : update_progress(guess)
    end

    def find_test_array(guess)
      indices = correct_locations(guess)
      test_array = @word_progress.dup

      indices.each do |index|
         test_array[index] = guess
      end

      test_array
    end

    def update_progress_ui
      puts "#{word_progress_string}"
      puts "#{(0...@word_progress.length).to_a.join}\n"
      puts ""
    end


    def confirm_update?(test_string)
      puts "Is #{word_progress_string(test_string)} correct? (y/n)"
      puts ""
      gets.chomp.downcase == "y"
    end

    def correct_locations(guess)
      indices = []

      loop do
        puts "Please enter an index that includes #{guess}"

        indices << Integer(gets.chomp)

        puts "Is that the last instance of the letter? (y/n)"
        break if gets.chomp.downcase == "y"
      end

      indices
    end

    def valid?(guess)
      if ALPHABET.include?(guess) && !guessed_letters.include?(guess)
         true
      else
        puts "You did not read the instructions, Doofus!"
        puts ""
        false
      end
    end

end

class ComputerPlayer
  attr_reader :word_progress, :guessed_letters

  def initialize
    @guessed_letters=[]
    @dictionary = File.readlines("dictionary.txt").map(&:chomp)
    @possible_words = @dictionary
  end

  def guess_letter(hint)
    guess = ""

    update_possibles(hint)

    guess = best_letter_guess

    guessed_letters << guess

    guess
  end

  def pick_word
    @secret_word = random_word.downcase
    @word_progress = Array.new(@secret_word.length)
  end

  def handle_guess(guess)
    update_progress(guess) if correct_guess?(guess)
  end

  def won?
    @word_progress.all?
  end

  def word_progress_string
    @word_progress.map{|chr| chr.nil? ? "." : chr}.join
  end

  private

    def update_possibles(hint)
      last_guess = guessed_letters.last unless guessed_letters.empty?

      remove_by_hint(hint)

      remove_by_placement(hint) unless guessed_letters.empty?

      unless guessed_letters.empty? || hint.include?(last_guess)
        remove_by_guessed(last_guess)
      end
    end

    def remove_by_hint(hint)
      @possible_words.select!{|word| word =~ /\A#{hint}\z/ }
    end

    def remove_by_placement(hint)
      hint.each_char do |letter|
        if letter == "."
          @possible_words.select!{|word| word !=~ /[#{guessed_letters.join}]/}
        end
      end
    end

    def best_letter_guess

      possible_letters = ALPHABET - guessed_letters

      letter_counts(possible_letters).sort_by{ |letter, count| count}.last[0]
    end

    def remove_by_guessed(letter)
      @possible_words.select!{|word| !word.include?(letter)}
    end

    def letter_counts(possible_letters)
      counts = Hash.new

      possible_letters.each do |letter|
        counts[letter] = @possible_words.select{|word| word.include?(letter)}.count
      end

      counts
    end

    def random_word
      @dictionary.sample
    end

    def correct_guess?(guess)
      @secret_word.include?(guess)
    end

    def update_progress(guess)
      @secret_word.split("").each_with_index do |letter, index|
        @word_progress[index] = letter if letter == guess
      end
    end
end
