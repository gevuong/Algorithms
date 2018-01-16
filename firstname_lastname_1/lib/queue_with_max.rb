# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

# FIFO (i.e. cafeteria)
class QueueWithMax
  attr_accessor :store

  def initialize
    @store = []
  end

  def enqueue(val)
    @store.push(val)
  end

  # O(1) use ring_buffer to achieve optimal shifts
  def dequeue
    @store.shift
  end

  # returns maximum element still in the queue
  def max
    @store.max
  end

  def length
    @store.length
  end
end
