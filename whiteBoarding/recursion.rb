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

  def subsets
    return [[]] if self.empty?
    subs = self.slice(0, self.length - 1).subsets
    print "subs: "
    p subs
    arr = subs.map do |sub|
      print "sub: "
      p sub
      sub + [self.last]
    end
    print "arr: "
    p arr

    print "subs_res: "
    p subs.concat(arr)
  end
end

p [1,2,3].subsets

# a = [1, [2], [3, [4]]]
# p a.deep_dup
