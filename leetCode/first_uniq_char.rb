# Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.

# Examples:

# s = "leetcode"
# return 0.

# s = "loveleetcode",
# return 2.
# Note: You may assume the string contain only lowercase letters.

# Questions to consider: does str have non alphanumeric characters? Does it contain spaces? 


def first_uniq_char(str)
    return -1 if str.empty? 
    return str.length - 1 if str.length == 1
      
    # I would want to iterate string, and somehow keep track of number of instances the character occurs
    counter_hash = Hash.new(0)
    str.each_char do |ch|
      counter_hash[ch] += 1
    end 
     
    # Filter hash based on value == 1. This means the character is unique. 
    filter = counter_hash.select { |key, val| val == 1 }
    
    return -1 if filter.empty? 
    
    # Then iterate through unique elements, create index tracker, and find indexOf of each character in string. If index is less than index_tracker, then update index_tracker 
    min_idx = str.length - 1 # start with highest index
    filter.keys.each do |uniq_ch|
      current_idx = str.index(uniq_ch)
      min_idx = current_idx if current_idx < min_idx 
    end 
    
    min_idx
  end