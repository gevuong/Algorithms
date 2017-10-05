

# Step 0:
=begin
0. Repeat question to ensure you understand what is being asked.
1. Do you have an example input/output you can provide?
Constraints:
2. Are the strings the same length?
3. Do the strings contain characters other than letters in the English alphabet?
4. Do the strings contain spaces in between words?
5. Are all the letters lowercase?
=end


#Step 1: Base cases?



# Step 2: Create two counter hashes, one for each string
def making_anagrams(str1, str2)
  char_count = Hash.new(0)

  str1.each_char { |ch| char_count[ch] += 1 }
  str2.each_char { |ch| char_count[ch] -= 1 }

  count = 0
  char_count.values.each { |el| count += el.abs }
  count
end

=begin My initial solution:
def making_anagrams(str1, str2)
  hash1 = Hash.new(0)
  str1.chars.each do |ch|
    hash1[ch] += 1
  end

  hash2 = Hash.new(0)
  str2.chars.each do |ch|
    hash2[ch] += 1
  end

  count = 0
  hash1.keys.each do |el|
    if hash2[el] == 0
      count += hash1[el]
    else
      count += (hash2[el] - hash1[el]).abs
    end
  end

  hash2.keys.each do |el|
    if hash1[el] == 0
      count += hash2[el]
    end
  end

  count
end
=end

puts making_anagrams("abc", "cde") #=> 4
puts making_anagrams("abc", "cccdee") #=> 7
string1 = "I have array of words and I want to get a hash".split(" ").join
string2 = "where keys are words and values are word count".split(" ").join
puts making_anagrams(string1, string2) #=> 25
