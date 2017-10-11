# Implement an algorithm to determine if a string has all unique characters.

=begin
1. Are all the characters in the string English alphabetical letters?
2. Is the string case-sensitive?
3. Are there whitespace we need to consider?
4. Can the string contain multiple substrings?
5. Do you have an example you can provide?

Option 1:
We can compare a single character with every character in the string. This will take O(n^2) time and zero space.

Option 2:
We can sort the string, and compare current character with subsequent character. This would be O(nlogn) time and O(n) space.

Option 3:
Store value in a counter hash. Check if value in counter hash is greater than 1.
=end

# Possibility of sorting string, and comparing subsequent characters, but will take up extra space...
# O(n) time and O(n) space

def is_unique?(string)
  counter_hash = Hash.new(0)
  string.each_char do |ch|
    next if ch == " "
    counter_hash[ch] += 1
    return true if counter_hash[ch] > 1
  end
  return false
end

puts is_unique?("string")
puts is_unique?("strin ng")



# TIL how to implement benchmarks in Ruby:
# Benchmark test results: Increase speed by making two changes. The first is use map! instead of map to avoid creating a copy of the split array, and the second is to avoid use of the symbol to proc syntax (e.g. &:split, which adds an extra operation that can be avoided with the more verbose syntax). The symbol to proc syntax usually equates to more "magic", and more magic means more operations, and more operations mean slower performance.

require 'benchmark'

s = "one thing, two things, three things, four things"
result = ""

Benchmark.bmbm do |b|
    b.report("strip/split (map/to_proc): ") { 1_000_000.times { result = s.split(",").map(&:strip) } }
    b.report("strip/split (map): ") { 1_000_000.times { result = s.split(",").map { |e| e.strip } } }
    b.report("strip/split (map!/to_proc): ") { 1_000_000.times { result = s.split(",").map!(&:strip) } }
    b.report("strip/split (map!): ") { 1_000_000.times { result = s.split(",").map! { |e| e.strip } } }
    b.report("regex: ") { 1_000_000.times { result = s.split(/\s*,\s*/) } }
end
