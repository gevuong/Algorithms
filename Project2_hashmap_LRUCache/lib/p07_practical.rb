require_relative 'p05_hash_map'
# detects whether a string can be configured to a palindrome
def can_string_be_palindrome?(string)
  hash = Hash.new(0)
  string.each_char do |ch|
    hash[ch] += 1
  end
  odd_counter = 0
  hash.values.each do |val|
    odd_counter += 1 if val % 2 != 0
    return false if odd_counter > 1
  end
  true
end

p can_string_be_palindrome?("edified") == true
p can_string_be_palindrome?("apple") == false
p can_string_be_palindrome?("racecar") == true

# create a hashmap to count up the number of letters
# if word is an even number length, then all letters counts need to be an even number
# if word is odd number length, then all letters counts need to be an even number except one of the entries
