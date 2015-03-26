input="SetCol 32 20
SetRow 15 7
SetRow 16 31
QueryCol 32
SetCol 2 14
QueryRow 10
SetCol 14 0
QueryRow 15
SetRow 10 1
QueryCol 2"


class Query_Board
  attr_accessor :board

  def initialize
    @board = Array.new(65536, 0).each_slice(256).to_a
  end

  def set_column(column, num)
    (0..255).each {|row| @board[row][column]=num}
  end

  def set_row(row, num)
    @board[row]=@board[row].map { num }
  end

  def query_col(column)
    sum=0
    (0..255).each {|row| sum=sum+@board[row][column]}
    puts sum
  end

  def query_row(row)
    puts @board[row].inject(:+)
  end

end



def use_board(meth, arg, num)
  case meth
  when "SetCol" then $board.set_column(arg, num)
  when "SetRow" then $board.set_row(arg, num)
  when "QueryCol" then $board.query_col(arg)
  when "QueryRow" then $board.query_row(arg)
  else
    puts "#{meth} #{arg} #{num}"
  end
end


$board=Query_Board.new
input.each_line do |line|
  line=line.chomp.split
  use_board(line[0], line[1].to_i, line[2].to_i)
end
