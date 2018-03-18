# Two-Pointer Approach


def reverse(str)

end


# Two-Pointer Approach
# Time: O(n), where n is the length of arr
# Space: O(1)

# Given a sorted array, remove duplicates in-place such that each element appear only once and return the new length. Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
def remove_duplicates(arr)
  slow_runner = 0 # keeps track of unique index

  (0..arr.length - 1).each do |fast_runner|
    current_val = arr[fast_runner]
    next_val = arr[fast_runner + 1]
    if current_val != next_val # last_val != nil returns true
      arr[slow_runner] = current_val
      slow_runner += 1
    end
  end
  arr[0...slow_runner]
end

p remove_duplicates([1, 1, 2]) # => [1, 2]
