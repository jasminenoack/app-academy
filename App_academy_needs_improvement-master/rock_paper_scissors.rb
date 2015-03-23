class RPS

  def play(player_choice)
    set_player_choice(player_choice)
    valid_player_choice?

    set_computer_choice

    outcome
  end

  private

    WINS = {
    "Rock" => "Scissors",
    "Paper" => "Rock",
    "Scissors" => "Paper"
  }

  def set_computer_choice
    @computer_choice = WINS.keys.sample
  end

  def valid_player_choice?
    raise ArgumentError unless WINS.has_key?(@player_choice)
  end

  def set_player_choice(player_choice)
    @player_choice = player_choice.capitalize
  end

  def draw?
    @player_choice == @computer_choice
  end

  def winner?
    WINS[@player_choice]==@computer_choice
  end

  def outcome
    if draw?
      "#{@player_choice}, #{@computer_choice}: is a draw."
    elsif winner?
      "#{@player_choice}, #{@computer_choice}: the player wins!"
    else
      "#{@player_choice}, #{@computer_choice}: the player loses!"
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  puts RPS.new.play("Rock")
  puts RPS.new.play("Rock")
  puts RPS.new.play("Rock")
  puts RPS.new.play("Rock")
  puts RPS.new.play("Rock")
end


