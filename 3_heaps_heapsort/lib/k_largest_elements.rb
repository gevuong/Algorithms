require_relative 'heap'

def k_largest_elements(array, k)
  arr = []
  sorted_arr = array.heap_sort!
  arr = sorted_arr.drop(array.length - k)
  arr

  res = BinaryMinHeap.new
  k.times do
    result.push(array.pop) # k * log(k)
  end

  until array.empty?
    n - klogk
end
