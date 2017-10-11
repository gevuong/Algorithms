# Given two strings, write a method to decide if one is a permutation of the other.

=begin
1. Do the strings only contain English alphabets? ASCII? Numbers?
2. Case-sensitive?
3. Do we consider white spaces when checking for permutation between both strings?
4. Do strings needs to be the same length?
5. Do you have an example test case or sample you can provide?

Option 1:
Store characters of first string in a counter hash adding 1 for each unique character. Then store characters of second string in a counter hash, subtracting 1 for each unique character. This will be O(n) time and space?

Option 2:
Use algebra to determine which indices a character should be in both strings. This seems to be more complicated.

Option 3:
Sort the strings and compare strings to see if they're equal. This will be O(nlogn) time, space is O(n)
=end

def check_permutation(str1, str2)
  return true if str1.strip.split(" ").join.chars.sort == str2.strip.split(" ").join.chars.sort # eliminates white spaces before comparing both strings
  return false
end

puts check_permutation("god", "dog")
puts check_permutation("string1 a", "string1 b")
puts check_permutation(" str i ng1 ", " str i ng1 ")



# TIL sort method in Ruby uses quicksort, which is O(nlogn) best and average case. Sorting an already sorted array will result in worst case is O(n^2)? Space complexity is O(n)? Benchmark test doesn't prove that sorting a sorted array is slower...
require 'benchmark'

unsorted = "qwertyuiopasdfghjklzxcvbnm"
sorted = "abcdefhijklmnopqrstuvwxyz"
result = ""

Benchmark.bmbm do |b|
    b.report("unsorted: ") { 100_000.times { result = unsorted.split("").sort.join } }
    b.report("sorted: ") { 100_000.times { result = sorted.split("").sort.join } }
end
