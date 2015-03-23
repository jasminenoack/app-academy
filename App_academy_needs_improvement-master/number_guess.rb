class GuessNumberGame
  def initialize
    @number = random_number
    @counter = 0
  end

  def random_number
    rand(100) + 1
  end

  def guess
    guess = gets.to_i
  end

  def increment_counter
    @counter += 1
  end

  def check
    @guess <=> @number
  end

  def won?
    @result.zero?
  end

  def outcome
    case @result
    when 1 then "Too High!"
    when -1 then "Too Low!"
    when 0 then "You guessed my number in #{@counter} tries!"
    end
  end

  def game_loop
    loop do
      @guess = guess
      increment_counter
      @result = check
      puts outcome
      break if won?
    end
  end

  def play
    print "Guess a number(1-100): "
    game_loop
  end


end




GuessNumberGame.new.play
