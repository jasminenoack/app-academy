input="#########_##
########C_##
#######_####
######_#C###
#######_C###
#######_####
######C#_###
######C_####
#######_####
#######_####"


track = []
index=0
$place=0

input.each_line do |line|
  line.chomp!
  g = line.index("_")
  c = line.index("C")
  if index==0
    line.sub!("_","|")
  elsif c==$place+1
    line.sub!("C",'\\')
  elsif c==$place-1
    line.sub!("C",'/')
  elsif c==$place
    line.sub!("C",'|')
  elsif g==$place
    line.sub!("_",'|')
  elsif g==$place+1
    ine.sub!("_",'\\')
  elsif g==$place-1
    line.sub!("_",'/')
  end
  track << line
  index += 1
  $place=line.index("|") if line.include?("|")
  $place=line.index("/") if line.include?("/")
  $place=line.index("\\") if line.include?("\\")
  puts line
end

