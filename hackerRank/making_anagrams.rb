# Question: Given two strings, str1 and str2, that may or may not be of the same length, determine the minimum number of character deletions required to make str1 and str2 anagrams. Any characters can be deleted from either of the strings.

# Step 0:
=begin
Repeat question to ensure you understand what is being asked.
Do you have an example input/output you can provide?

Constraints:
1. Do the strings contain characters other than letters in the English alphabet?
2. Spaces in between words?
3. Are characters case-sensitive?
4. Can characters in strings be deleted?
=end

def making_anagrams(str1, str2)
  char_count = Hash.new(0)

  str1.each_char { |ch| char_count[ch] += 1 }
  str2.each_char { |ch| char_count[ch] -= 1 }

  count = 0
  char_count.values.each { |el| count += el.abs }
  count
end

puts making_anagrams("abc", "cde") #=> 4
puts making_anagrams("abc", "cccdee") #=> 7
string1 = "I have array of words and I want to get a hash".split(" ").join
string2 = "where keys are words and values are word count".split(" ").join
puts making_anagrams(string1, string2) #=> 25
