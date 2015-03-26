input="14:01:57 12:47:11
13:09:42 22:16:15
08:08:06 08:38:28
23:35:07 02:49:59
14:31:45 14:46:56"

require 'time'

input.each_line do |line|
  line.chomp!
  line=line.split.map{|time| Time.parse(time)}
  line.sort!
  seconds=line[0]-line[1]
  seconds=seconds.abs if seconds<0
  printf( "%02d:%02d:%02d", seconds/3600, (seconds%3600)/60, ((seconds%3600)%60)  )
  puts
end