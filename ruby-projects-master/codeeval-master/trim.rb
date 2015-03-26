input="Tom exhibited.
Amy Lawrence was proud and glad, and she tried to make Tom see it in her face - but he wouldn't look.
Tom was tugging at a button-hole and looking sheepish.
Two thousand verses is a great many - very, very great many.
Tom's mouth watered for the apple, but he stuck to his work."

input.each_line do |line|
  line.chomp!
  if line.length<=55
    puts line
  else
    str=line[0,40].split
    last_space=line.rindex(" ")
    str=line[0...last_space]
    str<<"... <Read More>"
    puts str
  end
end
