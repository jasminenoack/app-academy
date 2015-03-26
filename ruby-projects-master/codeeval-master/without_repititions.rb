input="But as he spake he drew the good sword from its scabbard, and smote a heathen knight, Jusssstin of thee Iron Valley.
No matttter whom you choose, she deccccclared, I will abide by your decision.
Wwwhat is your will?
At his magic speech the ground oppened and he began the path of descent.
I should fly away and you would never see me again."

input.each_line do |line|
  line.chomp!
  last=""
  no_repeat=""
  line.each_char do |char|
    no_repeat << char if last != char
    last=char
  end
  puts no_repeat
end
