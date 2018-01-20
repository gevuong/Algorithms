# BST (in-order)
def traversal(node)
  arr = []
  return arr if node.left.nil? || node.right.nil?
  arr += traversal(node.left)
  arr << node.val
  arr += traversal(node.right) # similar to .concat
  arr
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
  sum = arr[0] + sum_arr(arr.drop(1))
  sum
end

p sum_arr([1, 2, 3, 8])

class Array
  def deep_dup
    new_array = []
    self.each do |el|
      new_array << (el.is_a?(Array) ? el.deep_dup : el)
    end
    new_array
  end

  # there are 2^n possible subsets, where n is # of values in given array
  def subsets
    return [[]] if self.empty?
    subs = self.slice(0, self.length - 1).subsets
    arr = subs.map do |sub| # .map function creates an array containing subarray
      sub + [self.last]
    end
    p subs.concat(arr)
  end
end

p [1,2,3].subsets

# there are n! possible permutations, where n is # of values in given array
def permutations(arr)
  return [arr] if arr.length <= 1 # => [[1]]

  perms = permutations(arr.slice(0, arr.length - 1))

  total_permutations = []

  perms.each do |perm|
    (0..perm.length).each do |idx|
      total_permutations << perm[0...idx] + [arr.last] + perm[idx..-1]
    end
  end
  total_permutations
end

print "permutations"
p permutations([1, 2, 3])

# a = [1, [2], [3, [4]]]
# p a.deep_dup

# find index of target value in array
def bsearch(arr, target) # assume arr is sorted
  return nil if arr.empty?

  mid_index = arr.length / 2
  mid_val = arr[mid_index]
  if mid_val == target
    return mid_index
  elsif target < mid_val
    bsearch(arr.slice(0, mid_index), target)
  elsif target > mid_val
    indices = bsearch(arr.slice(mid_index + 1, arr.length), target)
    indices.nil? ? nil : mid_index + 1 + indices
  end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)

end
