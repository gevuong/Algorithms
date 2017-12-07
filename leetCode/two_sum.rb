# Given an array of integers, return indices of the two numbers such that they add up to a specific target in O(n) time and space.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.

=begin
Example:
Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].

Example 2:
[3,2,4]
6
return [1,2]

Example 3:
[3,3]
6
return [0,1]
=end

# Questions to ask interviewer:
# Can we assume array won't be empty?
# Are integers in array unique?
# Can we use the same element twice?
# There can be more than one solution or no solution?
# if no solution return [] or nil?

# Nieve (brute force) solution
# O(n^2) time, O(1) space
def two_sum(nums, target)
  (0...nums.length).each do |idx|
    (0...nums.length).each do |idx2|
      next if idx == idx2
      if nums[idx] + nums[idx2] == target
          return [idx, idx2]
      end
    end
  end
end
p two_sum([3, 3], 6) # => [0, 1]
p two_sum([3, 2, 4], 6) # => [1, 2]
p two_sum([2, 7, 11], 13) # => [0, 2]

# Efficient solution (One pass hash table)
# O(n) time. We traverse array only once. Hash table lookup is "near" O(1) lookup in case if collision occurs, which can cause O(n) lookup. However, hash table lookup should be O(1) amortized if hash function is chosen carefully.
# O(n) space, where is represents number of elements store in hash
def two_sum_hash(nums, target)
  hash = {}
  hash[nums[0]] = 0 # initialize first element
  nums.each_with_index do |el, idx|
    next if el > target
    next if idx == 0
    remainder = target - el
    # implement hash lookup
    if hash[remainder] == idx || hash[remainder].nil?
      # store element and idx in hash
      hash[el] = idx  # {3: 1}
      next
    else
      return [hash[remainder], idx]
    end
  end
end

p two_sum_hash([3, 3], 6) # => [0, 1]
p two_sum_hash([3, 2, 4], 6) # => [1, 2]
p two_sum_hash([2, 7, 11], 13) # => [0, 2]
