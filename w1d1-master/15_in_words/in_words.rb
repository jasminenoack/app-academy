class Fixnum
  @@nums= {
    1=>"one",
    2=>"two",
    3=>"three",
    4=>"four",
    5=>"five",
    6=>"six",
    7=>"seven",
    8=>"eight",
    9=>"nine",
    10=>"ten",
    11=>"eleven",
    12=>"twelve",
    13=>"thirteen",
    14=>"fourteen",
    15=>"fifteen",
    16=>"sixteen",
    17=>"seventeen",
    18=>"eighteen",
  19=>"nineteen"}

  @@tens={
    2=>"twenty",
    3=>"thirty",
    4=>"forty",
    5=>"fifty",
    6=>"sixty",
    7=>"seventy",
    8=>"eighty",
  9=>"ninety"}


  def in_words
    result = ""

    case self
    when 0
      result << "zero"
    when 1..19
      result << @@nums[self]
    when 20..99
      result << @@tens[self / 10]
      result << find_words(self, 10)
    when 100..999
      result << places( self / 100 , "hundred" )
      result << find_words(self, 100)
    when 1_000..999_999
      result << places( self / 1000, "thousand")
      result << find_words( self, 1000)
    when 1_000_000..999_999_999
      result << places( self / 1_000_000, "million")
      result << find_words( self, 1_000_000)
    when 1_000_000_000..999_999_999_999
      result << places( self / 1_000_000_000, "billion")
      result << find_words( self, 1_000_000_000)
    when 1_000_000_000_000..999_999_999_999_999
      result << places( self / 1_000_000_000_000, "trillion")
      result << find_words( self, 1_000_000_000_000)
    end

    result
  end

  def find_words(num, divisor)
    result = ""

    result << " " unless (self % divisor).zero?
    result << (self % divisor).in_words unless (self % divisor).zero?

    result
  end

  def places(num_before_comma, place)
    result = ""

    result << num_before_comma.in_words
    result << " "
    result << place

    result
  end

end
