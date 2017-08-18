require_relative "heap"

class Array
  def heap_sort!
    (2..length).each do |size|
      # want to reduce heap size per iteration
      BinaryMinHeap.heapify_up(self, size - 1, size)
    end

    (2..length).to_a.reverse.each do |size|
      self[size - 1], self[0] = self[0], self[size - 1]
      BinaryMinHeap.heapify_down(self, 0, size - 1)
    end
    self.reverse!

  end
end
