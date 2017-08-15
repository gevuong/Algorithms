# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new
    @maxqueue = RingBuffer.new
  end

# On enqueue, we push new element into maxqueue and store, and ject all elements that are less than new element, until we hit one that is greater or equal. These ejected elements will never be the max because they will be dequeued from main store BEFORE new element.
# Each element is only pushed or ejected onto maxqueue once, so time complexity amortizes. We never have to consider n elements over and over again because an element is either ejected or causes early stopping.

# building max queue in constant time
# act of enqueuing in maxqueue is constant.
# if we're storing array elements in enqueue, it is linear.
#if you're doing maxqueue

  def enqueue(val)
    @store.push(val)
    update_maxqueue(val)
  end

# shift off from max queue if it matches element being dequeued; if it matches
  def dequeue
    @store.pop
    val = @store.shift
    @maxqueue.shift if val == maxqueue[0]
    val
  end

  def max
    # @store.max
    @maxqueue[0] if @maxqueue.length > 0
  end

  def update_maxqueue(el)
    while @maxqueue[0] && @maxqueue[@maxqueue.length - 1] < el
      @maxqueue.pop
    end
    @maxqueue.push(el)
  end

  def length
    @store.length
  end

# private methods can be called by instance of a class and sub class.


end
