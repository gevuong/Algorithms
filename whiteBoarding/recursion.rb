# BST (in-order)
def traversal(node)
  return [] if node.left.nil?
  
end


# factorial
def factorial(n)
  return 0 if n == 0
  return 1 if n == 1
  n * factorial(n - 1)
end

puts factorial(5)
# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.

def range(min, max)
  # iteratively
  # (min..max).map { |el| el }

  # recursively
  return [] if max <= min
  range(min, max - 1) << max - 1
end

p range(-2, 3)

# Write both a recursive and iterative version of sum of an array.
def sum_arr(arr)
  return 0 if arr.empty?
  sum = 0
  sum = arr[0] + sum_arr(arr.drop(1));
  sum
end

p sum_arr([1,2,3,8])

class Array
  def deep_dup

  end

  p deep_dup([1, [2], [3, [4]]])
end
