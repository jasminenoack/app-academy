line="abcdefghik"
line = "Xa,}A#5N}{xOBwYBHIlH,#W"
line = "(ABW>'yy^'M{X-K}q,"
line = "6240488"
line = "0 is behind 'a', 1 is behind ' b ' etc., 9 is behind 'j'"

def hidden_digits(line)
  hiding={"a" => "0", "b" => "1", "c" => "2", "d" => "3", "e" => "4", "f" => "5", "g" => "6", "h" => "7", "i" => "8", "j" => "9"}
  nums=""
  line.each_char do |char|
    if hiding.keys.include?(char)
      nums<<hiding[char]
    elsif hiding.values.include?(char)
      nums<<char
    end
  end
  return "NONE" if nums.length==0
  nums
end


puts hidden_digits(line.chomp)