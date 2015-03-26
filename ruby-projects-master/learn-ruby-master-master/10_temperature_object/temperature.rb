class Temperature
  attr_accessor :f

  def initialize(hash)
    if hash[:f]
      @f=hash[:f]
    else
      @c=hash[:c]
    end
  end

  def self.from_celsius(num)
    self.new(:c=>num)
  end

  def self.from_fahrenheit(num)
    self.new(:f=>num)
  end

  def in_fahrenheit
    if @f
      @f
    else
      @c/5.0*9+32
    end
  end

  def in_celsius
    if @c
      @c
    else
      (@f-32)*5/9.0
    end
  end

end

class Celsius < Temperature
  def initialize(temp)
    @c=temp
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    @f=temp
  end
end