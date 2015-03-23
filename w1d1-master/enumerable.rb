def double_array(array)
  array.map { |n| n * 2 }
end

def concatenate(strings)
  strings.inject(:+)
end

class Array

  def median
    self.sort!
    center = self.length / 2
    return self[center] if self.length.odd?
    (self[center] + self[center-1]) / 2.0
  end

  def mean
    size = self.count

    self.inject(:+).fdiv(size)
  end

  def mode
    most_repeats = 0
    modes = []

    self.each do |element|
      amount = self.count(element)
      if amount > most_repeats
        most_repeats = amount
        modes = [element]
      elsif amount == most_repeats
        modes << element
      end
    end

    modes.sort.uniq.join(",")
  end

end
