# Given a 32-bit signed integer, reverse digits of an integer.

# Example 1:

# Input: 123
# Output:  321
# Example 2:

# Input: -123
# Output: -321
# Example 3:

# Input: 120
# Output: 21
# Note:
# Assume we are dealing with an environment which could only hold integers within the 32-bit signed integer range. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

def reverse(int)
    return 0 if int == 0
    
    int_str = int.to_s
    int_arr = int_str.split("").reverse # 00001
    if int < 0
      int_arr.unshift("-")
    end 
    
    reversed_int = int_arr.join("").to_i
    if reversed_int.between?(-2147483648, 2147483648)
      
      return reversed_int
    else
      return 0
    end 
  end