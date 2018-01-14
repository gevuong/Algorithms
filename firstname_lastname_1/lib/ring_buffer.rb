require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @capacity = 8
    @length = 0
    @start_idx = 0 # only updates when shift/unshift. This is the start_idx for dynamic array
  end

  # O(1) Getter
  def [](index)
    check_index(index)
    @store[(index + start_idx) % capacity]
  end

  # O(1) Setter
  def []=(index, val)
    check_index(index)
    @store[(index + start_idx) % capacity] = val
  end

  # O(1)
  def pop
    check_index # raise error if popping empty array
    @store[length - 1]
    @length -= 1
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity
    @store[length] = val
    @length += 1
  end

  # O(1)
  def shift
    check_index
    # start_idx increases by one every time #shift occurs
    @start_idx = (start_idx + 1) % capacity
    # @store[@start_idx...length]
    @length -= 1
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity
    # decrease start_idx every time element is added to beginning of array
    @start_idx = (start_idx - 1) % capacity
    # -1 % 8 = 7 Ruby designed it this way
    @store[@start_idx] = val
    # self[0] = val
    @length += 1
    # p val
    # p @store
  end

  protected

  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index = 0)
    raise "index out of bounds" if index >= length
  end

  # O(n): has to copy over all the elements to the new store. Doubles capacity when filled.
  def resize!
    new_store = StaticArray.new(@capacity * 2)
    (0...length).each { |idx| new_store[idx] = @store[idx] }
    @store = new_store
    @start_idx = 0 # reset start_idx
    @capacity *= 2
  end
end
