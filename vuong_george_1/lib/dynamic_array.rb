require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    # initialized to 8 because each cell contains 8 bytes
    @store = StaticArray.new(8)
    @capacity = 8 # used to track when to resize, different from length
    @length = 0

    # alternative
    # self.store, self.capacity, self.length = StaticArray.new(8), 8, 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[index] = value
  end

  # O(1)
  def pop
    check_index
    pop_val = @store[length - 1]
    @length -= 1
    @capacity -= 1
    pop_val
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @length == @capacity
      resize!
    end
    self[length] = val
    @length += 1

    self
  end

  # O(n): has to shift over all the elements.
  # removes element at beginning of array
  def shift
    check_index
    store_new = StaticArray.new(length - 1)
    (1...length).each do |idx|
      store_new[idx] = self[idx]
    end
    @store = store_new
    @length -= 1
  end

  # O(n): has to shift over all the elements.
  # unshift adds value to beginning of array
  def unshift(val)
    store_new = StaticArray.new(length + 1)
    store_new[0] = val # holding on to the first val
    (0...length).each do |idx|
      store_new[idx + 1] = self[idx]
    end
    @store = store_new
    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index = 0)
    if index < length
      @store[index]
    else
      raise "index out of bounds"
    end  #unless index >= 0 && index < length
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(@capacity * 2) # doubles length of arr when capacity is reached
    (0...length).each { |i| new_store[i] = self[i] }
    @store = new_store
    @capacity = @capacity * 2 # thereforen need to double capacity
  end
end
