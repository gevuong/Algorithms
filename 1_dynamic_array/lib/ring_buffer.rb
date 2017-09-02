require_relative "static_array"

# make shift and unshift happen in constant time
class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @capacity = 8
    @length = 0
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[(index + start_idx) % capacity]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[(index + start_idx) % capacity] = value
  end

  # O(1)
  def pop
    # check_index
    raise 'index out of bounds' if length == 0
    # val, self(length - 1) = store(length - 1), nil
    pop_val = store[length-1]
    @length -= 1
    pop_val
  end

  # O(1) ammortized
  def push(val)
    if @length == @capacity
      resize!
    end

    @length += 1
    self[length - 1] = val

  end

  # O(1)
  def shift
    # check_index
    # @start_idx = (1 + start_idx) % capacity
    # @length -= 1

    # want to grab zeroth index index of start_idx
    raise 'index out of bounds' if (length == 0)
    val, self[0] = self[0], nil
    self.start_idx = (start_idx + 1) % capacity
    self.length -= 1
    val
  end

  # O(1) ammortized
  def unshift(val)
    if @length == @capacity
      resize!
    end
    @start_idx = (start_idx - 1) % capacity
    @length += 1
    self[0] = val
    # bracket method adds 0 + start_idx
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index = 0)
    if index < length
      @store[index]
    else
      raise "index out of bounds"
    end
  end

  def resize!
    store_new = StaticArray.new(length * 2)
    (0...length).each do |idx|
      store_new[idx] = self[idx]
    end
    @store = store_new
    @capacity = @capacity * 2
    @start_idx = 0
  end
end
