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

    # initialize
    hash = {} 
    pairs = []

    (0...arr.length).each do |idx|
        current_val = arr[idx]
        desired_val = target - current_val

        if hash[desired_val] # returns nil if pair doesn't exist
            pair = []
            min_val = [current_val, desired_val].min
            max_val = [current_val, desired_val].max
            pair.concat([min_val, max_val])
            pairs.push(pair)
        end 

        # store el and idx after hash[desired_val] is checked 
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

        # skip value if previously processed
        next if idx > 0 && current_val == nums[idx - 1]
        
        # reset left_idx and right_idx per iteration
        desired_val = target - current_val
        left_idx, right_idx = idx + 1, nums.length - 1
    
        until left_idx >= right_idx
            left_val, right_val = nums[left_idx], nums[right_idx]
            total_val = left_val + right_val

            if  total_val > desired_val
                right_idx -= 1
            elsif total_val < desired_val 
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

p three_sum([-6, -6, -6, -3, -1, -1, -1, 0, 1, 1, 2, 3], 0) == [[-3,0,3],[-3,1,2],[-1,-1,2],[-1,0,1]]
p three_sum([-5, -4, -4, -4, -3, -1, -1, -1, -1, 0, 1, 1, 2, 3], 0) == [[-5,2,3],[-4,1,3],[-3,0,3],[-3,1,2],[-1,-1,2],[-1,0,1]]
p three_sum([-1, 0, 1, 2, -1, -4], 0) == [[-1, -1, 2], [-1, 0, 1]]
p three_sum([-1, 0, 1], 0) == [[-1, 0, 1]]



puts '---four_sum?---'
# Given an array of unique integers and a target sum, determine whether any four integers in the array sum to that amount.
def four_sum?(nums, target)
    return false if nums.length < 4

    # initialize
    hash = {}
    # contains sum of first element
    one_hash = {}

    # contains sum of first two elements 
    two_hash = {}

    # contains sum of three elements
    three_hash = {} 

    nums.each do |el|

        return true if three_hash[target - el]
        
        two_hash.each_key do |key|
            three_hash[key + el] = true
        end 

        one_hash.each_key do |key|
            two_hash[key + el] = true 
        end 
        
        hash.each_key do |key|
            one_hash[key + el] = true
        end 

        hash[el] = true
    end

    false
end 


def four_sum?(array, target)

    # the first hash contains each of the elements that we have checked thus far
    hash = Hash.new
  
    # two_sum_hash contains sums of two elements from our array
    two_sum_hash = Hash.new
  
    # three_sum_hash contains sums of three elements from our array
    three_sum_hash = Hash.new
  
    array.each do |num|
  
      # Return true if there is a sum of three numbers equal to the difference of 
      # the target and the current num (i.e., if the current num and one of the
      # three_sums sum to the target)
      return true if three_sum_hash[target - num]
  
      # if we have any nums in our two_sum hash, add the current num to each to 
      # populate a hash of three_sums
      two_sum_hash.each_key do |key|
        three_sum_hash[key + num] = true
      end
  
      # if we have any nums in our single num hash, sum the current num 
      # with each of these numbers and store them in a hash of possible two sums
      hash.each_key do |key|
        two_sum_hash[key + num] = true
      end
  
      # lastly, add the num to a hash of all nums
      hash[num] = true
    end
  
    false
  
  end

arr = [0, 1, 5, 7]
p four_sum?([0, 0, 0, 1], 0) == false # => should be false
p four_sum?([1, 8, -1, 9, -2, 2], 0) == true # => should be false
p four_sum?([1, 0, -1, 0, -2, 2], 0) == true # => should be false
p four_sum?(arr, 10) == false # => should be false
p four_sum?([0, 1, 5, 7], 6) == false # => should be true
p four_sum?([0, 1, 5, 7, 0], 6) == true # => should be true
p four_sum?(arr, 13) == true # => should be true
p four_sum?([7, 0, -9, 8, -2, 8], 23) == true
p four_sum?([0, 15, 1, 19, 5, 21, 7], 13) == true # => should be false
p four_sum?([0, -15, 1, -19, 5, -21, 7], 13) == true # => should be false


puts '---three_sum?---'
# Given an array of unique integers and a target sum, determine whether any four integers in the array sum to that amount.
def three_sum?(nums, target)
    return false if nums.length < 3

    # initialize
    one_hash = {}
    two_hash = {}

    nums.each do |el|
        
        one_hash.each_key do |key|
            return true if two_hash[el]
            two_hash[key - el] = true
        end 

        remaining = target - el
        one_hash[remaining] = true

    end
    false

end 

p three_sum?([7, -9, 8, -2, 8], 23) == true
p three_sum?([0, 1, 5, 7], 6) == true # => should be true
p three_sum?([0, 15, 13, 2, 21, 7], 13) == false # => should be false
p three_sum?([0, 15, 13, 0, 21, 7], 13) == true # => should be false
p three_sum?([0, 15, 19, 6, 21, 7], 13) == true # => should be false
p three_sum?([0, 15, 1, 19, 5, 21, 7], 13) == true # => should be false
p three_sum?([0, -15, 1, -19, 5, -21, 7], 13) == true # => should be false



puts '---two_sum?---'
# Given an array of unique integers and a target sum, determine whether any four integers in the array sum to that amount.
def two_sum?(nums, target)
    return false if nums.length < 2

    # initialize
    one_hash = {}

    nums.each do |el|
        remaining = target - el
        return true if one_hash[remaining]
        one_hash[el] = true
    end 
    
    false
end 

p two_sum?([0, 1, 5, 7], 6) == true# => should be true
p two_sum?([0, 1, 5, 7], 10) == false # => should be false
p two_sum?([0, 1, 1, 5, 5, 6, 5, 7, 8], 15) == true # => should be true
p two_sum?([0, 1, 1, -5, -5, -6, -5, -7, -8], -15) == true # => should be true



def climb_stairs(n)
    return n if n <= 3
    
    return climb_stairs(n - 1) + climb_stairs(n - 2)
end

# p climb_stairs(44)


$cache = {}
def climb_stairs(n)
  $cache = { 1 => 1, 2 => 2, 3 => 3 }
  
  return $cache[n] if $cache[n]
  res = climb_stairs(n - 1) + climb_stairs(n - 2)
  $cache[n] = res 
  return res
end

p climb_stairs(2)
p climb_stairs(3)
p climb_stairs(4)
p climb_stairs(5)