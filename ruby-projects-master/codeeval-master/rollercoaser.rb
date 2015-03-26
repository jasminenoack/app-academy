input="To be, or not to be: that is the question.
Whether 'tis nobler in the mind to suffer.
The slings and arrows of outrageous fortune.
Or to take arms against a sea of troubles.
And by opposing end them, to die: to sleep."

input.each_line do |line|
  characters=0
  str=""
  line.each_char do |char|
    if char=~/[a-zA-Z]/
      characters.even? ? str<<char.upcase : str<<char.downcase
      characters+=1
    else
      str<<char
    end
  end
  puts str
end
