# Stacks and queues are two simple linear data structures.

# Stacks and queues may be implemented in terms of simpler data structures, such as linked lists, but in Ruby you can actually use an Array as the underlying data store, as long as you don't expose it publicly (i.e., don't define an attr_reader for it).

# FIFO (cafeteria line)
class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  # returns the "top" or "next" item without actually removing it
  def peek
    @store[0]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end


# LIFO
class MyStack
  def initialize(store = [])
    @store = store
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.last
  end

  def pop
    @store.pop
  end

  def push(val)
    @store.push(val)
  end

  def size
    @store.size
  end
end


# implement a queue using stacks
class StackQueue
  def initialize
    @in, @out = MyStack.new, MyStack.new
  end

  def enqueue(el)
    @in.push(el)
  end

  def dequeue
    # If we haven't already reversed the stack, this runs in O(n). However, we only have to do this once for every n dequeue operations, so it amortizes to O(1)
    if @out.empty?
      until !@in.empty?
        @out.push(@in.pop) # reverse order of elements in @in
      end
    end
    @out.pop

  end

  def size
    @in.size + @out.size
  end

  def empty?
    @in.empty? && @out.empty?
  end
end



# LIFO, O(1) time to retrieve min and max in stack
class MinMaxStack
  def initialize
    @store = []
  end

  def pop
    @store.pop[:value] # pops hash and returns value
  end

  # push hash that stores min, max, and val in array. Every time a value is pushed, the min and max gets updated. This means that the last element in @store contains the updated min and max.
  def push(value)
    # By using a little extra memory, we can get the max simply by peeking, which is O(1).
    if @store.empty?
      @store.push({
        value: value,
        min: value,
        max: value
        })
    else
      @store.push({
        value: value,
        min: [@store.last[:min], value].min,
        max: [@store.last[:max], value].max
      })
    end
  end

  # returns the "top" or "next" item without actually removing it
  def peek
    @store[-1]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  # O(1) is achieved through hashing
  def max
    # @store.max requires iteration through every item in array, which is O(n)
    @store.empty? ? nil : @store.peek[:max]
  end

  # O(1) is achieved through hashing
  def min
    @store.empty? ? nil : @store.peek[:min]
  end
end


# all methods need to run in O(1) time. We then use this to solve for #max_windowed_range
class MinMaxStackQueue
  def initialize
    @in, @out = MinMaxStack.new, MinMaxStack.new
  end

  # push
  def enqueue(el)
    @in.push(el)
  end

  # shift in O(1)
  def dequeue
    if @out.empty?
      until @in.empty?
        @out.push(@in.pop)
      end
    end

    @out.pop
  end

  # O(1), at most two operations
  def min
    min = []
    min.push(@in.min) unless @in.empty?
    min.push(@out.min) unless @out.empty?
    min.min
  end

  # O(1), at most two operations
  def max
    max = []
    max.push(@in.max) unless @in.empty?
    max.push(@out.max) unless @out.empty?
    max.max
  end
end


# O(n) time
def max_windowed_range(arr, size)

end
