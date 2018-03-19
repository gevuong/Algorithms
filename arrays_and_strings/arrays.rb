require "set"

# Given an array of integers (positive and negative, or all negative) find the largest contiguous subsum (sum of a subarray).
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


puts "---pair_sum---"

# Given an array of integers, return all unique pairs that sum up to a specified target. List the pairs in [min, max] order.
# Time: O(n)
# Space: O(n + 2m), where n is length of hash, and 2m is size of pairs 2D arr
def pair_sum(arr, target) 
    return [] if arr.length < 2

    # initialize hash
    hash = {} 
    pairs = []

    (0...arr.length).each do |idx|
        current_val = arr[idx]

        desired_val = target - current_val
        desired_idx = hash[desired_val] # returns nil if pair doesn't exist

        if hash[desired_val]
            pair = []
            min_val = [current_val, arr[desired_idx]].min
            max_val = [current_val, arr[desired_idx]].max
            pair.concat([min_val, max_val])
            pairs.push(pair)
        end 
        # store el and idx as key-values after hash[remainder] is checked to prevent using same idx as pair
        hash[current_val] = idx 
    end 

    pairs.uniq # O(n) time, where n is length of pairs arr
end 

p pair_sum([1, 2, -1], 0) == [[-1, 1]]        
p pair_sum([-1, 2, 1, 11], 0) == [[-1, 1]]     
p pair_sum([1, 2, -1, -1], 0) == [[-1, 1]]     
p pair_sum([1, 2, -1, -1, -2], 0) == [[-1, 1], [-2, 2]] 
p pair_sum([1, 2, -1, -1, -2], 1) == [[-1, 2]] 
p pair_sum([1, 2, -1, -1, -2], -1) == [[-2, 1]] 
p pair_sum([5, -5, -5, -5], 0) == [[-5, 5]] 
p pair_sum([5, 5, 5, 5], 10)  == [[5, 5]] 
p pair_sum([-1, -2, 2, 2, -2, 0, 1, 2, -1, -4], 0) == [[-2, 2], [-1, 1]] 


puts "---pair_sum_2 using Set data type---"
# Given an array of integers, return all unique pairs that sum up to a specified target. List the pairs in [min, max] order.
# Time: O(n), where n is length of array
# Space: O(n + m), where n and m are length of both Sets
# implementation using a Set, no duplicates
def pair_sum_2(arr, target)
    # initialize 
    set = Set.new
    pairs = Set.new 

    arr.each do |current_val|
        desired_val = target - current_val
        if set.include?(desired_val)
            pair = []
            min_val = [current_val, desired_val].min
            max_val = [current_val, desired_val].max
            pair.concat([min_val, max_val])
            pairs.add(pair)
        end
        
        set.add(current_val)
    end

    pairs.to_a
end 

p pair_sum_2([1, 2, -1], 0) == [[-1, 1]]        
p pair_sum_2([-1, 2, 1, 11], 0) == [[-1, 1]]     
p pair_sum_2([1, 2, -1, -1], 0) == [[-1, 1]]     
p pair_sum_2([1, 2, -1, -1, -2], 0) == [[-1, 1], [-2, 2]] 
p pair_sum_2([1, 2, -1, -1, -2], 1) == [[-1, 2]] 
p pair_sum_2([1, 2, -1, -1, -2], -1) == [[-2, 1]] 
p pair_sum_2([5, -5, -5, -5], 0) == [[-5, 5]] 
p pair_sum_2([5, 5, 5, 5], 10) == [[5, 5]] 
p pair_sum_2([-1, -2, 2, 2, -2, 0, 1, 2, -1, -4], 0) == [[-2, 2], [-1, 1]] 


# returns indices, not values
def pair_sum_3(arr, target) 
    return [] if arr.length < 2

    # initialize hash
    hash = {} 
    pairs = []

    (0...arr.length).each do |idx|
        current_val = arr[idx]

        desired_val = target - current_val
        desired_idx = hash[desired_val] # returns nil if pair doesn't exist

        if hash[desired_val]
            pair = []
            min_idx = [idx, desired_idx].min
            max_idx = [idx, desired_idx].max
            pair.concat([min_idx, max_idx])
            pairs.push(pair)
        end 
        # store el and idx as key-values after hash[remainder] is checked to prevent using same idx as pair
        hash[current_val] = idx 
    end 

    pairs # O(n) time, where n is length of pairs arr
end 

p pair_sum_3([1, 2, -1], 0) #== [[-1, 1]]        
p pair_sum_3([-1, 2, 1, 11], 0) #== [[-1, 1]]     
p pair_sum_3([1, 2, -1, -1], 0) #== [[-1, 1]]     
p pair_sum_3([1, 2, -1, -1, -2], 0) #== [[-1, 1], [-2, 2]] 
p pair_sum_3([1, 2, -1, -1, -2], 1) #== [[-1, 2]] 
p pair_sum_3([1, 2, -1, -1, -2], -1) #== [[-2, 1]] 
p pair_sum_3([5, -5, -5, -5], 0) #== [[-5, 5]] 
p pair_sum_3([5, 5, 5, 5], 10)  #== [[5, 5]] 
p pair_sum_3([-1, -2, 2, 2, -2, 0, 1, 2, -1, -4], 0) #== [[-2, 2], [-1, 1]] 



puts "---three_sum---"
# Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
# Note: The solution set must not contain duplicate triplets.

# For example, given array S = [-1, 0, 1, 2, -1, -4],

# A solution set is:
# [
#   [-1, 0, 1],
#   [-1, -1, 2]
# ]

# Time: n * m 
# Space: O(n * 3) 2D matrix
def three_sum(nums, target)
    return [] if nums.length < 3
    nums.sort!
    threes = []
    
    (0...nums.length - 2).each do |idx|
        current_val = nums[idx]
        desired_val = target - current_val
        
        # reset left_idx and right_idx per iteration
        left_idx, right_idx = idx + 1, nums.length - 1
    
        until left_idx >= right_idx
            left_val, right_val = nums[left_idx], nums[right_idx]
            total_val = left_val + right_val


            if  total_val > desired_val
                right_idx -= 1 while right_idx > left_idx && nums[right_idx] == nums[right_idx - 1]
                right_idx -= 1
            elsif total_val < desired_val 
                left_idx += 1while left_idx < right_idx && nums[left_idx] == nums[left_idx + 1]
                left_idx += 1
            elsif total_val == desired_val
                three_sum = [left_val, right_val, current_val].sort
                threes.push(three_sum)
                # these loops will skip same element and fasten algorithm
                left_idx += 1 while left_idx < right_idx && nums[left_idx] == nums[left_idx + 1]
                right_idx -= 1 while left_idx < right_idx && nums[right_idx] == nums[right_idx - 1]
                right_idx -= 1
                left_idx += 1
            end 
        end 
    end
    threes.uniq

end 

p three_sum([-3, -1, -1, -1, -1, 0, 1, 1, 2, 3], 0) # [-3,0,3],[-3,1,2],[-1,-1,2],[-1,0,1]]
p three_sum([-5, -4, -4, -4, -3, -1, -1, -1, -1, 0, 1, 1, 2, 3], 0) # == [[-1, 0, 1], [-1, -1, 2]]
# == [[-5,2,3],[-4,1,3],[-3,0,3],[-3,1,2],[-1,-1,2],[-1,0,1]]
p three_sum([-1, 0, 1, 2, -1, -4], 0) # == [[-1, 0, 1], [-1, -1, 2]]
p three_sum([-1, 0, 1], 0) == [[-1, 0, 1]]
# [-4, -1, -1, 0, 1, 2]


# puts '---three_sum_2---'
# def three_sum_2(nums, target)

#     pairs = Set.new
#     (0...nums.length).each do |idx|
#         desired_val = target - nums[idx]

#         arr = nums[0...idx] + nums[idx + 1..-1]
#         pairs.add(pair_sum_3(arr, desired_val))
#     end 
#     pairs
# end 

# p three_sum_2([-1, 0, 1, 2, -1, -4], 0)
# p three_sum_2([-1, 0, 1], 0)