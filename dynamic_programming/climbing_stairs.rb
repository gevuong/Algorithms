# You are climbing a stair case. It takes n steps to reach to the top.
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top? 
# Note: Given n will be a positive integer.

# Example 1:

# Input: 2
# Output:  2
# Explanation:  There are two ways to climb to the top.

# 1. 1 step + 1 step
# 2. 2 steps


# Example 2:

# Input: 3
# Output:  3
# Explanation:  There are three ways to climb to the top.

# 1. 1 step + 1 step + 1 step
# 2. 1 step + 2 steps
# 3. 2 steps + 1 step

# Recursion with Memoization
$cache = { 1 => 1, 2 => 2 } # defined outside function to prevent from having to go down the same subtree you already calculated. If cache[2] was already calculated, you won't have to go down that subtree. If $cache was defined inside function, you would be traversing same subtree multiple times.

# Time: O(n), where n is size of recursion tree
# Space: O(n), depth of recursion tree can go up to n
def climb_stairs(n)
  return $cache[n] if $cache[n]
  a = climb_stairs(n - 1)
  b = climb_stairs(n - 2)
  res = a + b
  $cache[n] = res 
  return res
end


p climb_stairs(3)
p climb_stairs(4)
p climb_stairs(5)
p climb_stairs(6)
p climb_stairs(35)