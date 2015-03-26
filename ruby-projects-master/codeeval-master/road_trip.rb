input="Rkbs,5453; Wdqiz,1245; Rwds,3890; Ujma,5589; Tbzmo,1303;
Vgdfz,70; Mgknxpi,3958; Nsptghk,2626; Wuzp,2559; Jcdwi,3761;
Yvnzjwk,5363; Pkabj,5999; Xznvb,3584; Jfksvx,1240; Inwm,5720;
Ramytdb,2683; Voclqmb,5236"


input.each_line do |line|
  line.chomp!
  distances = line.scan(/\d+/).map{|num| num.to_i}.sort
  travel_distances = []
  traveled = 0
  distances.each do |distance|
    travel_distances << distance - traveled
    traveled = distance
  end
  puts travel_distances.join(",")
end