class Hangman
  attr_reader :board, :checker, :guesser
  # factory methods to start games

  def self.setup
    begin
      puts "Will the guesser be a human? (y/n)"
      answer = gets.chomp.downcase
      raise "error" unless answer == "y" || answer == "n"
      guesser = answer == "y" ? HumanPlayer.new : SuperComputerPlayer.new
      puts

      puts "Will the checker be a human? (y/n)"
      answer = gets.chomp.downcase
      raise "error" unless answer == "y" || answer == "n"
      checker = answer == "y" ? HumanPlayer.new : SuperComputerPlayer.new
      puts

    rescue
      puts "One of your responses was invalid."
      retry
    end

    Hangman.new(checker, guesser).play
  end

  # initialize
  def initialize (checker, guesser)
    @checker = checker
    @guesser = guesser
  end

  def play
    hint = checker.pick_word
    puts "The secret word hint is #{checker.to_s}"

    until hint.all?
      guess = guesser.make_guess(hint)
      hint = checker.check_guess(guess)
      guesser.read_guess_result(hint, guess)
    end

  end

end

class HumanPlayer
  attr_accessor :hint, :unguessed_letters
  def initialize
    @unguessed_letters = ("a".."z").to_a
  end

  def to_s(array = hint)
    string = ""

    array.each do |char|
      letter = char || "."
      string << letter
    end

    string
  end

  # create word
  def pick_word
    begin
      puts "Pick a secret word. How many letters are in your word?"
      length = Integer(gets)
      puts
    rescue
      puts "Please enter a number."
      retry
    end
    @hint = Array.new(length)
  end

  # guess
  def make_guess(hint)
    begin
      puts "please guess a letter."
      puts "Letters that have not been guessed:"
      puts "#{unguessed_letters.join}"
      guess = gets.chomp.downcase
      raise "invalid input" unless @unguessed_letters.include?(guess)
      puts
    rescue
      puts "Either you have already guessed that letter or you did not enter a letter."
      retry
    end

    unguessed_letters.delete(guess)

    guess
  end

  #check guess
  def check_guess(guess)
    begin
      puts "Are there any #{guess}'s in your word? (y/n)"
      answer = gets.chomp.downcase
      raise "error" unless answer == "y" || answer == "n"
      result = answer == "y"
      puts
    rescue
      puts "Please answer y/n"
      retry
    end

    return hint unless result

    begin
      puts "How many times does #{guess} occur in your word?"
      count = Integer(gets)
      puts
    rescue
      puts "Please enter a number."
      retry
    end

    indices = []
    puts "Please enter each index on it's own line"
    until count == 0
      begin
        index = Integer(gets)
        indices << index
      rescue
        puts "There was an error with your last entry please enter it again."
        retry
      end
      count -= 1
      puts
    end

    test = hint.dup
    indices.each { |index| test[index] = guess }

    begin
      puts "Is this right? #{to_s(test)}"
      answer = gets.chomp.downcase
      raise "error" unless answer == "y" || answer == "n"
      result = answer == "y"
      puts
    rescue
      puts "Please answer y/n"
      retry
    end

    check_guess(guess) unless result
    hint = test
  end

  # process result
  def read_guess_result(hint, guess)
    puts "After your guess of #{guess} the current board is #{to_s(hint)}"
  end

end

class ComputerPlayer
  attr_accessor :hint, :unguessed_letters

  # initialize with dictionary
  def initialize(dictionary = ["cat", "hat", "bat", "fish", "dog", "library"])
    @dictionary = dictionary
    @unguessed_letters = ("a".."z").to_a
  end

  # create word
  def pick_word
    @secret_word = @dictionary.sample

    @hint = Array.new(@secret_word.length)
  end

  # guess
  def make_guess(hint)
    guess = unguessed_letters.sample

    unguessed_letters.delete(guess)

    guess
  end

  #check guess
  def check_guess(guess)
    return hint unless @secret_word.include?(guess)

    @hint.each_with_index do |char, index|
      if @secret_word[index] == guess
        @hint[index] = guess
      end
    end
    @hint
  end

  def to_s(array = hint)
    string = ""

    array.each do |char|
      letter = char || "."
      string << letter
    end

    string
  end

  # process result
  def read_guess_result(hint, guess)
    puts "After your guess of #{guess} the current board is #{to_s(hint)}"
  end

end

class SuperComputerPlayer < ComputerPlayer
  def initialize(dict_file)
  end

  attr_accessor :hint, :unguessed_letters

  # initialize with dictionary
  def initialize(dictionary_file = 'dictionary.txt')
    @dictionary = File.readlines(dictionary_file).map(&:chomp)
    @unguessed_letters = ("a".."z").to_a
  end

  # guess
  def make_guess(hint)
    @dictionary.select!{ |word| word.length == hint.length }

    guess = Hash.new { |h, k| h[k] = 0 }.tap do |frequency|
      (unguessed_letters).each do |letter|
         frequency[letter] = @dictionary.select{|word| word.include?(letter)}.count
       end
     end.sort_by{ |h, k| k }.last[0]

     unguessed_letters.delete(guess)

     guess
  end

  # process result
  def read_guess_result(hint, guess)
    puts "After your guess of #{guess} the current board is #{to_s(hint)}"

    hint.each_with_index do |char, index|
      if char == nil
        @dictionary.reject! { |word| word[index] == guess }
      elsif char == guess
        @dictionary.select! { |word| word[index] == guess }
      end
    end
  end


end
