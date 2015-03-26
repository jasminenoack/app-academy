class RPNCalculator
  attr_accessor :display, :calculate

  def initialize
    @display=[]
  end

  def push(arg)
    @display.push(arg)
  end

  def minus
    num=pop
    @display<<pop-num
  end

  def pop
    if @display.empty?
      raise "calculator is empty"
    else
      @display.pop
    end
  end

  def plus
    @display<< pop + pop
  end

  def divide
    num=pop
    @display<<pop.fdiv(num)
  end

  def times
    @display<< pop * pop
  end

  def value
    @display.last
  end

  def tokens(string)
    calculate=string.split.map do |x|
      if "+*-/".include?(x)
        x.to_sym
      else
        x.to_i
      end
    end
  end

  def evaluate(string)
    tokens(string).each do |arg|
      case arg
      when :- then minus
      when :+ then plus
      when :/ then divide
      when :* then times
      else push(arg)
      end
    end
    value
  end
end
