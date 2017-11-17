# factorial
def factorial(n)
  return 1 if n == 1
  n * factorial(n - 1)
end
# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.

def range(start, endVal)
  return [] if start >= endVal
  range(start, endVal - 1) << endVal - 1
end



# Write both a recursive and iterative version of sum of an array.
