class Array

  def my_each &prc
    new_array = self.dup

    self.length.times do |i|
      prc.call(self[i])
    end

    self
  end

  def my_map &prc
    new_array = []

    self.my_each do |i|
      new_array << prc.call(i)
    end

    new_array
  end

  def my_select &prc
    new_array = []

    self.my_each do |i|
      result = prc.call(i)
      new_array << i if result
    end

    new_array
  end

  def my_inject &prc
    start = nil

    self.my_each do |i|
      if start.nil?
        start = i
      else
        start = prc.call(start, i)
      end
    end

    start
  end


  def my_sort! &prc
    sort_direction = prc.call(1, 2)
    sorted = false

    until sorted
      sorted = true
      (self.length-1).times do |i|
        comparison = self[i] <=> self[i+1]


        case comparison
        when -sort_direction
          sorted = false
          self[i], self[i+1] = self[i+1] , self[i]
        end
      end
    end

    self
  end

  def my_sort &prc
    new_array = self.dup
    new_array.my_sort! &prc
  end

end

  def eval_block (*arg, &prc)
    return "NO BLOCK GIVEN!" unless prc
    prc.call(*arg)
  end



if __FILE__ == $PROGRAM_NAME

end
