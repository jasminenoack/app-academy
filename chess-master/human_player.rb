class HumanPlayer

  def play_turn
    puts "Where would you like to move from? Please use format '0,2' "
    start_pos = gets.chomp

    puts "Where would you like to move to? Please use format '0,2' "
    end_pos = gets.chomp
    [parse(start_pos), parse(end_pos)]
  rescue
    puts "Invalid input"
    retry
  end

  def parse(input)
    input.split(',').map{ |num| Integer(num) }
  end

end
