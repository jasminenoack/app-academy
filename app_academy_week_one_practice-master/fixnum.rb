require 'byebug'

class Fixnum
  BASE_CONVERSION = {
    0  => "0",
    1  => "1",
    2  => "2",
    3  => "3",
    4  => "4",
    5  => "5",
    6  => "6",
    7  => "7",
    8  => "8",
    9  => "9",
    10 => "A",
    11 => "B",
    12 => "C",
    13 => "D",
    14 => "E",
    15 => "F"
  }

  def num_to_s(base)

    return BASE_CONVERSION[self] if self < base

    left_over = self / base
    numstring = (left_over).num_to_s(base)

    digit = self % base
    self_string = BASE_CONVERSION[digit]
    numstring += self_string

  end

end


if __FILE__ == $PROGRAM_NAME

  p 5.num_to_s(10) #=> "5"
  p 5.num_to_s(2)  #=> "101"
  p 5.num_to_s(16) #=> "5"

  p 234.num_to_s(10) #=> "234"
  p 234.num_to_s(2)  #=> "11101010"
  p 234.num_to_s(16) #=> "EA"

end
