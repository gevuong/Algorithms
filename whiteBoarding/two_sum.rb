# Given an array of unique integers and a target sum, determine whether any two integers in the array sum to that amount.

# O(n) time and space, works only if all integers are unique
def two_sum?(arr, target_sum)
  # sort array then use binary search
  hash = {}

  arr.each do |el|
    return true if hash[target_sum - el]
    hash[el] = true
  end

  false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) == true
p two_sum?(arr, 10) == false

# return indices of two integers that equal to target_sum
def two_sum_indices(arr, target_sum)
  indices = []
  hash = {}
  arr.each_with_index do |el, idx|
    if hash[target_sum - el]
      index = arr.index(target_sum - el)
      indices.push(index)
      indices.push(idx)
    end
    hash[el] = true
  end

  indices
end

arr = [0, 1, 5, 7]
p two_sum_indices(arr, 6) == [1, 2]
p two_sum_indices(arr, 10) == []


# Given an array of unique integers and a target sum, determine whether any four integers in the array sum to that amount.
def four_sum(arr, target_sum)

end


# Given an array, and a window size w, find the maximum range (max - min) within a set of w elements.
#
# Let's say we are given the array [1, 2, 3, 5] and a window size of 3. Here, there are only two cases to consider:
#
# 1. [1 2 3] 5
# 2. 1 [2 3 5]
# In the first case, the difference between the max and min elements of the window is two (3 - 1 == 2). In the second case, that difference is three (5 - 2 == 3). We want to write a function that will return the larger of these two differences.

# method is quite expensive because checking min and max costs 2 * window for each window. Also, taking the range of elements is similar to .slice(), which is rather costly. We can do better. What if we can enqueue and dequeue for each iteration, and calculate min and max in constant time.
# O(n * m) naive solution
def max_windowed_range(arr, size)
  return nil if arr.length < size
  return arr.max - arr.min if arr.length == size

  window = arr[0...size]
  max_range = window.max - window.min

  (1..arr.length - size).each do |idx|
    window = arr[idx...idx + size]
    current_max_range = window.max - window.min
    max_range = [max_range, current_max_range].max
  end
  max_range

end
puts('-----------max_windowed_range')
p max_windowed_range([1,2,3,5], 3) == 3
p max_windowed_range([1,2,3,5,7], 3) == 4
p max_windowed_range([1,2,3,5,7], 2) == 2
p max_windowed_range([1,2,5], 3) == 4
p max_windowed_range([1,5], 3) == nil
p max_windowed_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p max_windowed_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p max_windowed_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p max_windowed_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8



def bsearch(arr, target)
  return nil if arr.empty?

  mid = arr.length / 2
  if arr[mid] == target
    return mid
  elsif target < arr[mid]
    bsearch(arr[0...mid], target)
  elsif target > arr[mid]
     indices = bsearch(arr[mid + 1..-1], target)
     indices.nil? ? nil : indices + mid + 1
  end
end

puts("------bsearch")
p bsearch([1, 2, 3], 1) == 0 # => 0
p bsearch([2, 3, 4, 5], 3) == 1 # => 1
p bsearch([2, 4, 6, 8, 10], 6) == 2 # => 2
p bsearch([1, 3, 4, 5, 9], 5) == 3 # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) == 5 # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) == nil # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) == nil # => nil

def subsets(arr)

end



def permutations

end
