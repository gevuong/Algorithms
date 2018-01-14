require_relative "static_array"

# capacity represents max number of cells in dynamic array We'll be using capacity instead because we want to essentially measure how much we can fill array before running into initialized length of static array.
class DynamicArray
  attr_reader :length # see :length as :count

  def initialize
    # begins with a capacity of 8
    @store = StaticArray.new(8)
    @capacity = 8
    @length = 0 # initially zero because array is initially empty
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
    check_index # raise error when popping an empty array
    pop_val = @store[length - 1]
    @length -= 1
    pop_val
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible resize.
  def push(val)
    resize! if @length == @capacity
    @store[length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    check_index # raises error when shifting empty array
    new_store = StaticArray.new(length - 1)
    (1...length).each { |idx| new_store[idx] = @store[idx] }
    @store = new_store
    @length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    new_store = StaticArray.new(length + 1)
    new_store[0] = val
    (0...length).each { |idx| new_store[idx + 1] = @store[idx] }
    @store = new_store
    @length += 1
  end

  protected

  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index = 0)
    raise "index out of bounds" if index >= length
  end

  # O(n): has to copy over all the elements to the new store. Doubles capacity when filled.
  def resize!
    new_store = StaticArray.new(@capacity * 2)
    (0...length).each { |idx| new_store[idx] = @store[idx] }
    @store = new_store
    @capacity *= 2
  end
end
