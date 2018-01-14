# a map can be implemented using a 2D array. Lets implement a map using only arrays. A map stores information in key-value pairs, where the keys are always unique. When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...]
class Map

  attr_reader :map

  def initialize
    @map = []
  end

  def assign(key, value)
    @map.each do |key_val|
      raise "key already exists" if key_val[0] == key
    end
    @map.push([key, value])
  end

  # returns value of key-value pair
  def lookup(key)
    @map.each { |key_val| return key_val[1] if key_val[0] == key }
    nil
  end

  def remove(key)
    remove_idx = nil
    @map.each_with_index do |key_val, idx|
      if key_val[0] == key
        remove_idx = idx
        break
      end
    end
    raise "key does not exist" if remove_idx.nil?
    @map.delete_at(remove_idx)
    @map
  end

  def show
    deep_dup(@map)
  end

  private

  # one-liner
  def deep_dup(arr)
    arr.map { |key_val| key_val.is_a?(Array) ? deep_dup(key_val) : key_val }
  end
end

map = Map.new
map.assign(1, "a")
map.assign(2, "b")
map.assign(3, "c")
map.assign(4, "c")
# p map.assign(3, "c")
p map.lookup(3)
p map.lookup(2)
p map.remove(2)
p map.remove(3)
map.show


# A stack is an ADT that follows LIFO (i.e. elevator entry/exit). A stack is used in Depth First Search.
class Stack
  def initialize
    # create ivar to store stack here!
    @store = []
  end

  def add(el)
    # adds an element to the stack
    @store.push(el)
  end

  def remove
    # removes one element from the stack
    @store.pop(el)
  end

  def show
    # return a copy of the stack
    @store.dup
  end
end


# queue is an ADT that follows FIFO (i.e. cafeteria line) A queue is used in Breadth First Search.
class Queue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def show
    @store.dup
  end
end
