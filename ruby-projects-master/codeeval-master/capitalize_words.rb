string_1 = "Hello world"
string_2 = "javaScript language"
string_3 = "a letter"
string_4 = "1st thing"



def capitalize_words(string)
  string=string.split
  string=string.map {|x| x[0].upcase+x[1..-1]}
  string.join(" ")
end




puts string_1
print capitalize_words(string_1)
puts 
puts capitalize_words(string_1) == "Hello World"
puts
puts string_2
print capitalize_words(string_2) 
puts
puts capitalize_words(string_2) =="JavaScript Language"
puts
puts string_3
print capitalize_words(string_3) 
puts
puts capitalize_words(string_3) =="A Letter"
puts
puts string_4
print capitalize_words(string_4) 
puts
puts capitalize_words(string_4) =="1st Thing"