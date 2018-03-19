# Given an array of integers (positive and negative) find the largest contiguous subsum (sum of a subarray).
#
# You can solve this trivially in O(n**2) time by considering all subarrays. Try to solve it in O(n) time with O(1) memory.

# Suppose your array is [5, 3, -7, 6], then:
# * The largest subsum is 8 with subarray [5, 3].
# * The largest subsum ending at the last element is 7 with subarray [5, 3, -7, 6].
#
# Say that you push 4 to the array to get [5, 3, -7, 6, 4].
# * The largest subsum ending at the last element is 11 with subarray [5, 3, -7, 6, 4].
# * The largest subsum overall is the max of the old largest subsum AND the new largest subsum.
# In other words, the new largest sum is 11 because [8, 11].max = 11.

# Time: O(n), where n is length of array
# Space: O(1)
# Two trackers. One tracks max_sum, and another tracks current_sum
# Dynamic programming is used to keep adding current element to previously solved problems
def largest_contiguous_subarray(arr)
    return nil if arr.empty?

    # initialize sum because we cannot start at sum = 0
    max_sum = arr[0]
    current_sum = max_sum

    (1...arr.length).each do |idx|
        current_sum += arr[idx]
        current_sum = [current_sum, arr[idx]].max
        # if current_sum < 0
        #   current_sum = 0
        max_sum = current_sum if current_sum > max_sum 
    end
    max_sum

end

p largest_contiguous_subarray([5, 3, -7, 6]) == 8 # 5 + 3
p largest_contiguous_subarray([5, 3, -7, 6, 4]) == 11 # 5 + 3 - 7 + 6 + 4
p largest_contiguous_subarray([5, 3, -7, 36, 8]) == 45 # 5 + 3 + -7 + 36 + 8
p largest_contiguous_subarray([-2, -3, 4, -1, -2, 1, 5, -3]) == 7 # [4, -1, -2, 1, 5]
p largest_contiguous_subarray([5, 3, -7, 36, -8]) == 37
p largest_contiguous_subarray([-5, -9, -7, -6, -4]) == -4



# Given an array of integers, return all pairs that sum up to a specified value k. List the pairs in [min, max] order.
# Time complexity: O(n).
def pair_sum(arr, target) 

    hash = {} 

    arr.each do |el|
        remainder = target - el 
        arr[remainder]
    end 
end 

pair_sum([1, 2, -1], 0)          # => #<Set: {[-1, 1]}>
pair_sum([1, 2, -1, -1], 0)      # => #<Set: {[-1, 1]}>
pair_sum([1, 2, -1, -1, -2], 0)  # => #<Set: {[-1, 1], [-2, 2]}>
pair_sum([1, 2, -1, -1, -2], 1)  # => #<Set: {[-1, 2]}>
pair_sum([1, 2, -1, -1, -2], -1) # => #<Set: {[-2, 1]}>