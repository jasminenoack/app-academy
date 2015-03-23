require 'byebug'

class Array

  # try to write any? all? each? length?

  def my_include?(item)
    any? { |el| el == item}
  end

  def my_uniq
    uniq_array = []
    each do |el|
      uniq_array << el unless uniq_array.include?(el)
    end
    uniq_array
  end

  def two_sum
    zero_pairs = []
      (0...length-1).each do |i|
        (i+1...length).each do |j|
          zero_pairs << [i,j] if self[i] + self[j] == 0
        end
      end
    zero_pairs
  end

end

if __FILE__ == $PROGRAM_NAME
  puts ""
  # my_include? tests
  p "[1,2,3].my_include?(2) == true:                     #{[1,2,3].my_include?(2) == true}"
  p "[1,2,3].my_include?(4) == false:                    #{[1,2,3].my_include?(4) == false}"
  p "[1,2,3].my_include?('hello') == false:              #{[1,2,3].my_include?("hello") == false}"
  p "['hello', 'world'].my_include?('hello') == true:    #{["hello", "world"].my_include?("hello") == true}"
  puts ""
  # my_uniq tests
  p "[].my_uniq == []:                                   #{[].my_uniq == []}"
  p "[1,1,2].my_uniq == [1,2]:                           #{[1,1,2].my_uniq == [1,2]}"
  p "[1,2].my_uniq == [1,2]:                             #{[1,2].my_uniq == [1,2]}"
  p "[4,1,4,3,4,4,5,1,'end'].my_uniq == [4,1,3,5,'end']: #{[4,1,4,3,4,4,5,1,'end'].my_uniq == [4,1,3,5,'end']}"
  puts ""
  # two_sum tests
  p "[1,2,3,4].two_sum == []:                            #{[1,2,3,4].two_sum == []}"
  p "[-1,0,2,-2,1].two_sum == [[0,4],[2,3]]:             #{[-1,0,2,-2,1].two_sum == [[0,4],[2,3]]}"
  puts ""

end
