=begin
You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.
#
# Write a method get_products_of_all_ints_except_at_index() that takes an array of integers and returns an array of the products.

Do not use division in your solution.

For example, given:

 [1, 7, 3, 4]

your method would return:

 [84, 12, 28, 21]

by calculating:

 [7 * 3 * 4,  1 * 3 * 4,  1 * 7 * 4,  1 * 7 * 3]
=end

=begin
Questions:
1. Do you have a sample input/output you can provide?
2. Can we modify the original array or need to return a new array?
3. Can we use any math operations to solve problem?
4. We need to consider if there are zeros in the array
5. We need to consider if array length is less than 2
=end

# product of integers prior to index: [1, 1, 1 * 7, 1 * 7 * 3]
# product of integers after current_index: [7 * 3 * 4, 3 * 4, 4, 1]
def get_products_of_all_ints_except_at_index(arr)
  return arr if arr.length < 2

  products_of_ints = Array.new(4) { 1 }
  products_of_ints[0] = 1 # initialize first index of array
  products_prior = 1
  products_after = 1

  arr.each_index do |current_idx|
    next if current_idx == 0
    products_prior *= arr[current_idx - 1]
    products_of_ints[current_idx] *= products_prior

    products_after *= arr[arr.length - current_idx]

    products_of_ints[arr.length - 1 - current_idx] *= products_after
    p products_of_ints

  end

  products_of_ints
end

p get_products_of_all_ints_except_at_index([1, 7, 3, 4])
p get_products_of_all_ints_except_at_index([1, 2, 6, 5, 9])
p get_products_of_all_ints_except_at_index([3, 1, 2, 5, 6, 4])
