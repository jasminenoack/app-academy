

class Hanoi
  def self.setup_3_disk
    board = Array.new([[3,2,1],[],[]])
    self.new(board, 3)
  end

  def initialize(array, disk_count)
    @board = array
    @disk_count = disk_count
  end

  def play
    puts "Welcome to towers of Hanoi!"
    puts "In this game the objective to move the disks out of first pile."
    puts "You win the game if you are able to reconstruct the pyramid in either of the second places"
    puts "You can move a disk into a place that is empty or a place that has a disk of greater value on top"
    puts "Enjoy"

    until won?

      begin
        display
        puts "Where would you like to pick up (0,1,2)?"
        start_place = Integer(gets.chomp)

        puts "Where would you like to move (0,1,2)?"
        end_place = Integer(gets.chomp)
        p validation(start_place,end_place)
      rescue
        puts "That move is not possible"
        retry
      end

      move_disk(start_place, end_place)
    end
    display
    puts "You Won!"
  end

  def to_s
    p @board
  end

  # display
  def render
    display_string = "\n"

    (@disk_count-1).downto(0) do |height|
      (0..2).each do |place|
        display_string << "\t#{@board[place][height]}"
      end
      display_string << "\n"
    end
    display_string
  end

  def display
    puts render
  end

  #moving disks
  def validation(start_place, end_place)
    if start_place == end_place
      raise "That is the same place"
    elsif [start_place, end_place].any?{|num| !num.between?(0, 2)}
      raise "Those are not valid locations"
    elsif @board[end_place].any? && @board[start_place].last > @board[end_place].last
      raise "invalid location"
    end
  end

  def move_disk(start_place, end_place)
    @board[end_place] << @board[start_place].pop
  end

  def won?
    @board[0].empty? && @board[1..2].any?{|place| place.empty?}
  end

end


if __FILE__ == $PROGRAM_NAME

  h=Hanoi.setup_3_disk
  h.play


end
