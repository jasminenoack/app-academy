def rps(arg)
  winning_moves = {
    "Rock" => "Scissors",
    "Paper" => "Rock",
    "Scissors" => "Paper"
  }

  player_choice = arg.capitalize
  computer_choice = winning_moves.keys.sample

  if player_choice == computer_choice
    outcome = "Draw"
  elsif winning_moves[player_choice]==computer_choice
    outcome = "Win"
  else
    outcome = "Lose"
  end

  "#{computer_choice}, #{outcome}"
end


def remix(drinks)
  alcohols = []
  mixers = []
  new_drinks = []

  drinks.each do |pair|
    alcohols << pair[0]
    mixers << pair[1]
  end

  alcohols.shuffle!
  mixers.shuffle!

  while alcohols.count > 0
    new_drinks << [alcohols.pop, mixers.pop]
  end

  drinks.each do |drink|
    new_drinks = remix(drinks) if new_drinks.include?(drink)
  end

  new_drinks
end
