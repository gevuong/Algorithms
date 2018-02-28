
# 476 test cases passed on leetCode

# O(n) time, where n is length of string. Constant space because 
def valid_palindrome(s)
    # a palindrome exists if the count of characters are all event numbers, or there is exactly one odd number.
    alphanumeric = "abcdefghijklmnopqrstuvwxyz0123456789"
  
    new_str = ""
    s.each_char do |ch|
      ch = ch.downcase
      new_str.concat(ch) if alphanumeric.include?(ch)
    end 
    
    return true if new_str.empty? || new_str.length == 1
    str_length = new_str.length 
    mid = str_length / 2
    if str_length.odd?
      # it doesnt matter what the mid character is
      first_half = new_str[0...mid]
      second_half = new_str[mid + 1..-1]
      p second_half
      return true if first_half == second_half.reverse 
      false
      
    elsif str_length.even?
      first_half = new_str[0...mid]
      second_half = new_str[mid..-1]
      return true if first_half == second_half.reverse
      false
    
    end 
  end

  p valid_palindrome("a ba")