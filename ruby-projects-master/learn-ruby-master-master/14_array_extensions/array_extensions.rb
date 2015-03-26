class Array

  def sum
    return 0 if self.empty?
    self.inject(:+)
  end

  def square
    self.map{|x| x**2}
  end

  def square!
    self.map!{|x| x**2}
  end

end
