COLORS = [ "R", "G", "B", "Y", "O", "P" ]

class Code

  def self.random_code
    Array.new(4) { COLORS.sample }
  end

  def initialize( code = self.class.random_code)
    @code = code
  end

  def near_matches(guess)
    matches(guess) - self.exact_matches(guess)
  end

  def exact_matches(guess)
    counter = 0
    secret_code, guess_code = self.code, guess.code

    secret_code.each_with_index do |peg, index|
      counter +=1 if peg == guess_code[index]
    end

    counter
  end

  protected
  attr_reader :code

  def color_count
    Hash.new(0).tap do |counts|
      self.code.each do |color|
        counts[color] += 1
      end
    end
  end

  private

  def lesser_of(count1, count2)
    return count1 if count1 < count2
    count2
  end

  def matches(guess)
    matches = 0
    secret_colors = self.color_count
    guess_colors = guess.color_count

    secret_colors.each do |color, count|
      matches += lesser_of(count, guess_colors[color])
    end

    matches
  end

end

class Mastermind

  def initialize
    @secret_code = Code.new
  end

  def play
    setup
    play_loop
  end

  private

  def valid?(guess)
    guess.scan(/[BYOPGR]/).count==4
  end

  def setup
    puts "Let's play Mastermind!"
    puts "Peg options are: #{COLORS.join(", ")}"
    puts "Please enter your guess in the following format:"
    puts "BYRP"
  end

  def ask_for_guess
    Code.new(input_loop.split(""))
  end

  def input_loop
    loop do
      puts "What is your guess?"
      guess = gets.chomp
      return guess if valid?(guess)
      puts "Dude, you didn't follow the instructions."
      puts ""
    end
  end

  def play_loop
    correct_pegs = 0

    10.times do
      guess_code = ask_for_guess
      correct_pegs = @secret_code.exact_matches(guess_code)
      near_pegs = @secret_code.near_matches(guess_code)

      puts "Near Matches: #{near_pegs}"
      puts "Exact Matches: #{correct_pegs}"
      puts ""
      break if correct_pegs == 4
    end
    
    puts winner(correct_pegs)
  end

  def winner(correct)
    return "Game Over" unless correct==4
    "You Win! Yay!!!!!"
  end

end
