# adding methods to array: my_each, my_map, my_select, my_inject, my_sort
class Array
  def my_each(&prc)
    n = 0

    while n < length
      prc.call(self[n])
      n += 1
    end

    self
  end

  def my_map(&prc)
    new_array = []

    self.my_each do |el|
      new_array << prc.call(el)
    end

    new_array
  end

  def my_select(&prc)
    new_array = []

    my_each do |el|
      new_array << el if prc.call(el)
    end

    new_array
  end

  def my_inject(&prc)
    base = self[0]

    self.drop(1).my_each{ |x| base = prc.call(base, x)}

    base
  end
end


if __FILE__ == $PROGRAM_NAME
  # tests my_each
  x = [1,2,3]
  p "my each [1,2,3].my_each { |x| x*3 }: #{[1,2,3].my_each { |x| puts x * 3 }}"
  p "my each ['1','2','3'].my_each { |x| x << '3' }: #{['1','2','3'].my_each { |x| x << "3" }}"
  p "my each does not alter x: #{x}"
  p "my each returns x: #{x.my_each{}}"

  # tests my_map
  p "returns change x.my_map { |x| x*3 }: #{x.my_map { |x| x*3 }}"
  p "does not alter array: #{x}"

  #tests my_select
  p "returns true cases x.my_select { |x| x.even? }: #{x.my_select { |x| x.even? }}"
  p "does not alter original array: #{x}"

  #my_inject
  p "[1,2,3,4].my_inject { |x , y| x + y}: #{[1,2,3,4].my_inject { |x , y| x + y}}"
  p "[1,2,3,4].my_inject { |x , y| x - y}: #{[1,2,3,4].my_inject { |x , y| x - y}}"
  p "[1,2,3,4].my_inject { |x , y| x * y}: #{[1,2,3,4].my_inject { |x , y| x * y}}"
end
