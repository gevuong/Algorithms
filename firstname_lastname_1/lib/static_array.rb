# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  def initialize(length)
    @store = Array.new(length)
  end

  # O(1) get method by indexing
  def [](index)
    @store[index]
  end

  # O(1) set method by indexing and placing value
  def []=(index, value)
    @store[index] = value
  end

  protected
  attr_accessor :store
end
