class Hanoi

  def initialize
    @towers = [[0,1,2,3],[],[]]
  end


  def move(pile1, pile2)
    return "Illegal move" if @towers[pile1].empty?
    return "Illegal move" unless valid_pile?(pile1) && valid_pile?(pile2)
    disk = @towers[pile1][0]
    top = @towers[pile2][0]

    if @towers[pile2].empty? || top > disk
      @towers[pile2].unshift(@towers[pile1].shift)
    else
      return "Illegal move"
    end

    display
  end

  def valid_pile?(pile)
    return true if pile.between?(0,2)
  end

  def display
    p @towers
  end


  def check_win?
    win = [0,1,2,3]
    if @towers[2] == win || @towers[1] == win
      puts "you win"
      return true
    end
  end

  def get_move
    print "Which would you like to take a disk from? "
    pile1 = gets.chomp.to_i
    print "Where would you like to move the disk? "
    pile2 = gets.chomp.to_i
    [pile1, pile2]
  end

  def game_play
    display
    until check_win?
      pile1, pile2 = get_move
      move_result = move(pile1, pile2)
      puts "Illegal move try again" if move_result == "Illegal move"
    end
  end


end
