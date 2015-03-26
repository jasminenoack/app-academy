def reverse(array, range)
  array1 =[*array]
  idx=0
  while idx <= array1.length-range
    array1[idx...idx+range]=array1[idx...idx+range].reverse
    idx+=range
  end
  array1
end


def sep_variables(variables)
  variables=variables.split(";")
  variables[1]=variables[1].to_i
  variables[0]=variables[0].split(",").map{|x| x.to_i}
  variables
end



def checks
  answers=""
  idx=2
  while idx<7
    array=(1..20).to_a
    # vars=sep_variables(variables)
    answers << reverse(array, idx).join(",")
    idx+=1
  end
  answers
end


