# Given two strings, write a method to decide if one is a permutation of the other.

=begin
1. Do the strings only contain English alphabets? ASCII? Numbers?
2. Case-sensitive?
3. Do we consider white spaces when checking for permutation between both strings?
4. Do strings needs to be the same length?
5. Do you have an example test case or sample you can provide?

Option 1:
Store characters of first string in a counter hash adding 1 for each unique character. Then store characters of second string in a counter hash, subtracting 1 for each unique character.

Option 2:
Use algebra to determine which indices a character should be in both strings. This seems to be more complicated.

Option 3:
Sort the strings and compare strings to see if they're equal.
=end




require 'benchmark'

unsorted = "qwertyuiopasdfghjklzxcvbnm"
sorted = "abcdefhijklmnopqrstuvwxyz"
result = ""

Benchmark.bmbm do |b|
    b.report("unsorted: ") { 1_000_000.times { result = unsorted.split("").sort.join } }
    b.report("sorted: ") { 1_000_000.times { result = sorted.split("").sort.join } }
end
