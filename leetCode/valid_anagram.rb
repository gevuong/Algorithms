# Given two strings s and t, write a function to determine if t is an anagram of s.

# For example,
# s = "anagram", t = "nagaram", return true.
# s = "rat", t = "car", return false.

# Note:
# You may assume the string contains only lowercase alphabets.

# Follow up:
# What if the inputs contain unicode characters? How would you adapt your solution to such case?
# Use a hash table instead of a fixed size counter such as an array. Filling an array with unicode characters can reach up to 1 million. A hash can adapt to any range of characters.


# O(n) time, where n is length of string_1. Although we use extra space, space complexity is O(1) because hash size stays constant no matter how large n is.
def is_anagram(string_1, string_2)
    # edge cases 
    return false if string_2.length != string_1.length
  
    # store characters in string_1 in a counter hash
    counter_hash = Hash.new(0)
    string_1.each_char do |ch|
      counter_hash[ch] += 1 
    end 
  
    # iterate through string_2 and if a character matches a character in string_1, then reduce count
    string_2.each_char do |ch|
      counter_hash[ch] -= 1
    end 
    # run .all? in counter_hash to see if all values are == 0, if not return false
    counter_hash.values.all? { |val| val == 0 }
    
end

p is_anagram("a", "b") == false
p is_anagram("ab", "a") == false