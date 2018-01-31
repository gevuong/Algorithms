# Given an array where every element occurs TWICE, except one element which occurs only once. Find the element that occurs once. Expected time complexity is O(n) and O(1) extra space.

# TWO XOR FACTS YOU NEED TO KNOW:
# 1. XOR of a number with itself is 0 (i.e. 3 ^ 3 = 0)
# 2. XOR of a number with 0 is the number (i.e. 2 ^ 0 = 2)

# Examples of how XOR works
# true ^ false # true
# false ^ true # true
#
# false ^ false # false
# true ^ true # false
#
# # Compare the last example against using OR
# true || true # true

# For example,
# a = 2
# b = 6
# c = a ^ b # 4

# Let's examine what ruby is doing under-the-hood.
# # Converts the operators to binary
# a.to_s(2) # "10"
# b.to_s(2) # "110"
#
# # Bit-wise operation
# # a = 010
# # b = 110
# # xor ---
# # c = 100
#
# # Converts the result back to an integer
# "100".to_i(2) # 4
#
# # Thus,
# c == 4 # true
# In Ruby, Integer#to_s(2) converts a number to binary and String#to_i(2) converts a binary string to a number!

def find_unique_element(arr)
    return nil if arr.empty?
    return arr[0] if arr.length == 1
  
    res = 0
    arr.each do |el|
      res = res ^ el
    end
    res
  end
  
  p find_unique_element([3, 8, 1, 2, 8, 3, 1, 2, 4]) == 4
  p find_unique_element([3, 8, 8, 2, 8, 3, 3]) == 2
  p find_unique_element([3, 8, 1, 2, 8, 3, 1]) == 2
  p find_unique_element([-3, 8, -1, 2, 8, -3, -1]) == 2
  
  