# Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?
def is_unique(string)
  string.split("").uniq == string.split("")
end

p is_unique("string") == true
p is_unique("strings") == false

# O(n) time
# O(n) space, using hash
def is_unique2(string)
  hash = Hash.new(0)
  string.each_char do |ch|
    hash[ch] += 1
  end

  hash.values.each do |val|
    return false if val > 1
  end
  return true
end

p is_unique2("string") == true
p is_unique2("strings") == false

# O(n^2) time
# O(1) space, doesn't require storing data in new data structure
def is_unique3(string)
  length = string.length
  string.each_char.with_index do |ch, idx|
    new_idx = idx + 1
    next if new_idx > length
    sliced_string = string.slice(new_idx, length)
    return false if sliced_string.index(ch)
  end
  return true
end

p is_unique3("string") == true
p is_unique3("strings") == false


# Given two strings, write a method to decide if one is a permutation of the other.
def check_permutation(str1, str2)
  str1.split("").permutation.to_a.each do |str|
    return true if str == str2.split("")
  end
  return false
end

p check_permutation("abc", "cbd") == false
p check_permutation("abc", "cba") == true

def check_permutation2(str1, str2)
  return false if str1.length != str2.length
  hash = Hash.new(0)

  str1.each_char do |ch|
    hash[ch] += 1
  end

  str2.each_char do |ch2|
    hash[ch2] -= 1
  end

  hash.values.each do |val|
    return false if val != 0
  end

  return true
end

p check_permutation2("abc", "cbd") == false
p check_permutation2("abc", "cba") == true


# Write a method to replace all spaces in a string with '%20  You may assume that the string has sufficient space at the end to hold the additional characters, and that you are given the "true" length of the string. (Note: If implementing in Java,please use a character array so that you can perform this operation in place.)
def URLify(string)
  new_str = ""
  string.each_char do |ch|
    if ch == " "
      new_str.concat("%20")
    else
      new_str.concat(ch)
    end
  end
  new_str
end

p URLify("a b c") == "a%20b%20c"
p URLify(" ") == "%20"


# Given a string, write a function to check if it is a permutation of a palin­drome. A palindrome is a word or phrase that is the same forwards and backwards. A permutation is a rearrangement of letters. The palindrome does not need to be limited to just dictionary words.

# EXAMPLE
# Input: Tact Coa
# Output: True (permutations: "taco cat", "atco eta", etc.)

def palindrome_permutation(string)
  hash = Hash.new(0)
  string.each_char do |ch|
    next if ch == " "
    hash[ch] += 1
  end

  hash2 = Hash.new(0)
  hash.values.each do |val|
    if val % 2 == 0
      hash2[:even] += 1
    else
      hash2[:odd] += 1
    end
  end

  return false if hash2[:odd] > 1
  return true
end

p palindrome_permutation("taco cat") == true
p palindrome_permutation("taco catt") == false


# There are three types of edits that can be performed on strings: insert a character, remove a character, or replace a character. Given two strings, write a function to check if they are one edit (or zero edits) away.
# EXAMPLE
# pale, ple -> true,
# pales, pale -> true,
# pale, bale -> true,
# pale, bake -> false

def one_away(str1, str2)
  return true if str1 == str2 # zero edits away
  arr = str1.split("")
  str2.each_char do |ch|
    arr.delete(ch)
  end

  return false if arr.length > 1
  return true
end

p one_away("pale", "ple") == true
p one_away("pales", "pale") == true
p one_away("pale", "bale") == true
p one_away("pale", "bake") == false


# Implement a method to perform basic string compression using the counts of repeated characters. For example, the string aabcccccaaa would become a2blc5a3. If the "compressed" string would not become smaller than the original string, your method should return the original string. You can assume the string has only uppercase and lowercase letters (a - z).

def string_compression(str)
  new_str = ""
  counter = 1

  char = str[0] # initialize first char
  (1..str.length).each do |idx|
    if str[idx] == char
      counter += 1
    else
      new_str.concat(char)
      new_str.concat(counter.to_s)
      char = str[idx]

      counter = 1
    end
  end
  new_str
end

p string_compression("aabcccccaaa") == "a2b1c5a3"
p string_compression("aabcccccaaahhfffaaa") == "a2b1c5a3h2f3a3"


# Rotate Matrix: Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place? Transpose.
def rotate_matrix(matrix)
  new_matrix = []
  sub_arr = []

  (0...matrix.length).each do |col|
    (0...matrix.length).each do |row|
      sub_arr.concat([matrix[col][row]])
    end
    new_matrix.push(sub_arr)
    sub_arr = []
  end
  new_matrix
end

p rotate_matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p rotate_matrix([[1, 2], [4, 5], [7, 8]]) == [[1, 4, 7], [2, 5, 8]]


# Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0.
def zero_matrix(matrix)
  (0...matrix.length).each do |row|

  end
end
