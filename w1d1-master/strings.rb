def num_to_s(num, base)
  strings = {
    0 => '0',
    1 => '1',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9',
    10 => 'A',
    11 => 'B',
    12 => 'C',
    13 => 'D',
    14 => 'E',
    15 => 'F' }

  divisor = 1
  string = ""

  until (num / divisor) < base
    string << strings[num / divisor % base]
    divisor *= base
  end
  string << strings[num / divisor]

  string.reverse
end



def caesar(string, shift)
  alphabet = ('a'..'z').to_a
  return_string = ''
  string.downcase!

  string.each_char do |char|
    if alphabet.include?(char)
      new_index = (alphabet.index(char) + shift) % alphabet.length
      return_string << alphabet[new_index]
    else
      return_string << char
    end
  end

  return_string
end
