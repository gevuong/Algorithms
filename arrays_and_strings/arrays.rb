# Given an array of integers (positive and negative) find the largest contiguous subsum (sum of a subarray).
#
# You can solve this trivially in O(n**2) time by considering all subarrays. Try to solve it in O(n) time with O(1) memory.

# Suppose your array is [5, 3, -7, 6], then:
#
# * The largest subsum is 8 with subarray [5, 3].
# * The largest subsum ending at the last element is 7 with subarray [5, 3, -7, 6].
#
# Say that you push 4 to the array to get [5, 3, -7, 6, 4].
#
# * The largest subsum ending at the last element is 11 with subarray [5, 3, -7, 6, 4].
# * The largest subsum overall is the max of the old largest subsum AND the new largest subsum.
# In other words, the new largest sum is 11 because [8, 11].max = 11.
def largest_contiguous_subsum(arr)
  # initialize sum because we cannot start at sum = 0
  max_sum = arr[0] + arr[1]

  # iterate length of array
  (2...arr.length).each do |idx|
    current_sum += arr[idx]
    current_sum = max_sum + arr[idx]
    if current_sum + arr[idx + 1] < max_sum
      # reset current_sum
      current_sum = 0
    elsif current_sum + arr[idx + 1] > max_sum
      next
    end
    sum = [current_sum, sum].max
  end
end
