input="330.39991833
0.001
14.64530319
0.25
254.16991217"

input.each_line do |line|
  angle=line.chomp.to_f
  degrees=angle.to_i
  left_over=angle-degrees
  angle_minutes=left_over/(1.0/60)
  minutes=angle_minutes.to_i
  left_over=angle_minutes-minutes
  seconds=left_over/(1.0/60)
  seconds=seconds.to_i
  printf("%01d.%02d'%02d\"", degrees, minutes, seconds)
  puts
end
