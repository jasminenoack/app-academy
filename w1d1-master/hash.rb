class MyHashSet
  attr_accessor :store

  def initialize
    @store = {}
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    @store.has_key?(el)
  end

  def delete(el)
    return false unless @store.include?(el)
    @store.delete(el)
    true
  end

  def to_a
    @store.keys
  end

  def union(set2)
    new_set = MyHashSet.new
    self.to_a.each { |el| new_set.insert(el)}
    set2.to_a.each { |el| new_set.insert(el)}
    new_set
  end

  def intersect(set2)
    new_set = MyHashSet.new
    values = self.to_a & set2.to_a
    values.each { |el| new_set.insert(el)}
    new_set
  end

  def minus(set2)
    new_set = MyHashSet.new
    values = self.to_a - set2.to_a
    values.each { |el| new_set.insert(el)}
    new_set
  end
end
