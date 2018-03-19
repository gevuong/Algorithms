## DAY 1
# Write a method, digital_root(num). It should sum the digits of a positive integer. If it is greater than or equal to 10, sum the digits of the resulting number. Keep repeating until there is only one digit in the result, called the "digital root". Do not use string conversion within your method.

# 1234 => 1 + 2 + 3 + 4 = 10.
# Assume num is a positive integer 
# Time: O(n*m), where n is number of digits in integer, and m is number of iterations until 
# Space: O(1), sum holds a single value
def digital_root(num)
    return num if num < 10
    
    # initialize sum to enter while loop
    sum = num
    while sum >= 10
        sum = sum_digits(sum)
    end 
    sum

end 

def sum_digits(num)
    sum = 0
    while num > 0 
        sum += num % 10 
        num = num / 10
    end 
    sum
end 

# Recursive solution 
def digital_root_rec(num)
    return num if num < 10 
    sum = 0
    while num > 0
        sum += num % 10 
        num = num / 10
    end 
    return digital_root_rec(sum) # add "return" because when you reach peak of call stack, and stack begins to unwind, immediately return calculated sum. I think that's how it works.
end 

p digital_root(1234) == 1
p digital_root(123) == 6
p digital_root(1234567) == 1

puts "---digital_root_rec---"

p digital_root_rec(99) == 9
p digital_root_rec(1234) == 1



puts "---caesar_cipher---"

# Write a function that takes a message and an increment amount and outputs the same letters shifted by that amount in the alphabet. Assume lowercase and no punctuation. Preserve spaces.
def caesar_cipher(string, increment)
    # initialize the lowercase alphabet and empty string 
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    output_str = ""

    string.each_char.with_index do |ch, idx|
        if ch == " "
            output_str.concat(ch) 
            next 
        else 
            initial_idx = alphabet.index(ch)
            new_idx = (initial_idx + increment) % 26
            output_str.concat(alphabet[new_idx])
        end 
    end 
    output_str

end 

p caesar_cipher("", 5) == ""
p caesar_cipher("z", 5) == "e"
p caesar_cipher("a b x y z", 5) == "f g c d e"



puts "---longest_common_substring---"

# Write a function, longest_common_substring(str1, str2) that takes two strings and returns the longest common substring. A substring is defined as any consecutive slice of letters from another string.

# Bonus: solve it in O(m * n) using O(m * n) extra space. (Hint: the solution involves dynamic programming which will be introduced later in the course.) 

# Naive Solution
# Time: Worst case O(n*m!), where n is length of str1, and m! is to check inclusion for every combination, like subsets
# Space: O(n), where n is length of string? 
def longest_common_substring(str1, str2)
    return str1 if str1 == str2
    # initialize two pointers, slow_runner and fast_runner, max_length, output_str
    slow_idx = 0
    fast_idx = 1 
    max_length = 0
    output_str = ""

    # track shorter_str for minor optimization, look at 1st and 2nd test cases to see what I mean
    str1.length > str2.length ? shorter_str = str2 : shorter_str = str1 

    while slow_idx < str1.length
        current_str = str1[slow_idx...fast_idx]

        if !str2.include?(current_str) || fast_idx > str1.length
            current_str = str1[slow_idx...fast_idx - 1]
            current_length = current_str.length
            if current_length > max_length 
                max_length = current_length
                output_str = current_str
                return output_str if output_str.length == shorter_str.length    
            end 
            slow_idx += 1
            fast_idx = slow_idx + 1
        else 
            fast_idx += 1
        end 
    end 
    output_str

end 

p longest_common_substring("abcdefghijklmnop", "abcdefgh") == "abcdefgh"
p longest_common_substring("abcdefghijklmnop", "abcdefghijklmno") == "abcdefghijklmno"
p longest_common_substring("", "bc") == ""
p longest_common_substring("ad", "abc") == "a"
p longest_common_substring("cab", "abc") == "ab"
p longest_common_substring("abc", "c") == "c"
p longest_common_substring("GeeksforGeeks", "GeeksQuiz") == "Geeks"
p longest_common_substring("abcdxyz", "xyzabcd") == "abcd"
p longest_common_substring("zxabcdezy", "yzabcdezx") == "abcdez"


# Dynamic Programming (Bottom up approach)
# https://www.youtube.com/watch?v=BysNXJHzCEs

# create matrix to store the length of longest_common_substring between str1 and str2. You add 1 to array so you can refer to previous diagonal value to add 1 to. Length of a common substring is dependent on previous diagonal value, so 0 + 1 would be the first instance of a common_substring.

# |"" | C | A | T  
# --------------------
# "" | 0 | 0 | 0 | 0
# --------------------
# R  | 0 | 0 | 0 | 0
# --------------------
# A  | 0 | 0 | 1 | 0
# --------------------
# T  | 0 | 0 | 0 | 2  <--- Longest substring ends here!


# Time: O(n * m), n and m being length of str1 and str2
# Space: O(n * m)
def make_matrix(str1, str2)
    matrix = Array.new(str1.length + 1) { Array.new(str2.length + 1, 0) }
  
    str1.chars.each_with_index do |el1, idx1|
      str2.chars.each_with_index do |el2, idx2|
        if el1 == el2
          matrix[idx1 + 1][idx2 + 1] = matrix[idx1][idx2] + 1
        else
          matrix[idx1 + 1][idx2 + 1] = 0
        end
      end
    end
  
    matrix
  end

p make_matrix("abd", "abcrga")
p make_matrix("cat", "rat")
p make_matrix("abcde", "abcd")


def longest_common_substring_2(str1, str2)
    matrix = make_matrix(str1, str2)
    longest_substring = ""
    matrix.each_with_index do |row, idx1|
      row.each_with_index do |length, idx2|
        if length > longest_substring.length
          longest_substring = str2[idx2 - length...idx2]
        end
      end
    end
    longest_substring
    
end

p longest_common_substring_2("cat", "rat")
p longest_common_substring_2("abcdefghijklmnop", "abcdefgh") == "abcdefgh"
p longest_common_substring_2("abcdefghijklmnop", "abcdefghijklmno") == "abcdefghijklmno"
p longest_common_substring_2("", "bc") == ""
p longest_common_substring_2("ad", "abc") == "a"
p longest_common_substring_2("cab", "abc") == "ab"
p longest_common_substring_2("abc", "c") == "c"
p longest_common_substring_2("GeeksforGeeks", "GeeksQuiz") == "Geeks"
p longest_common_substring_2("abcdxyz", "xyzabcd") == "abcd"
p longest_common_substring_2("zxabcdezy", "yzabcdezx") == "abcdez"




puts "---sum_rec---"

# Write a function that takes an array of integers and returns their sum. Use recursion.
# Time: O(n), where n is length of nums array
# Space: O(n), where n is length of nums array
def sum_rec(nums)
    return 0 if nums.empty?

    # at peak of stack, sum = 0, as stack unwinds, nums array will be filled with one element at a time, so += nums[-1] will add last element to sum. At each recursive call, nums array was shrinking by one element, [1, 2, 3] => [1, 2] => [1] => []. As it unwinds, each nums array is looked at, and the last element is used to add to sum.
    sum = sum_rec(nums[0...nums.length - 1])
    sum += nums[-1]
end 

p sum_rec([]) == 0
p sum_rec([1, 2]) == 3
p sum_rec([1, 2, 3, 4]) == 10



puts "---get_max_profit---"

## EXTRA 
# Suppose we could access yesterday's stock prices as an array, where:

#    The indices are the time in minutes past trade opening time, which was 9:30am local time.
#    The values are the price in dollars of Apple stock at that time.

# So if the stock cost $500 at 10:30am, stock_prices_yesterday[60] = 500.

# Write an efficient method that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.

# For example:

#  stock_prices_yesterday = [10, 7, 5, 8, 11, 9]

# get_max_profit(stock_prices_yesterday)
# # returns 6 (buying for $5 and selling for $11)

# No "shorting"—you must buy before you sell. You may not buy and sell in the same time step (at least 1 minute must pass).

# Two-pointer approach. Slow runner tracks min_buy_price, fast_runner is current_price
# Time: O(n), where n is length of nums array
# Space: O(1), since we're assigning variables to values
def get_max_profit(nums)
    return nil if nums.length < 2

    # initialize
    max_profit = nums[1] - nums[0]
    min_buy_price = nums[0] # slow_runner

    # iterate nums array
    (1...nums.length).each_with_index do |time, idx|

        # first, find max_profit
        current_price = nums[time] # fast_runner
        current_profit = current_price - min_buy_price
        max_profit = [max_profit, current_profit].max

        # determines minimum buy price
        min_buy_price = [min_buy_price, current_price].min 
        
    end 
    max_profit

end 

p get_max_profit([10, 7, 5, 3, 2, 1]) == -1
p get_max_profit([10, 7, 5, 8, 11, 9]) == 6
p get_max_profit([3, 15, 6, 10, 7, 5, 8, 11, 9]) == 12



## DAY 2
puts "---fibonacci sequence---"

# Write a function, fibs(n) which returns the first n elements from the fibonnacci sequence, given n. Assume n > 0

# Solve it both iteratively and recursively.
# Time: O(n), where n is n elements
# Space: O(n), where n is n elements in nums array
def fib_sequence(n)
    return [0] if n == 1
    return [0, 1] if n == 2

    nums = [0, 1]
    i = 0 
    j = 1
    while nums.length < n
        num_1 = nums[i]
        num_2 = nums[j]
        nums.push(num_1 + num_2)
        i += 1
        j += 1
    end 
    nums
end 

p fib_sequence(3) == [0, 1, 1]
p fib_sequence(5) == [0, 1, 1, 2, 3]
p fib_sequence(9) == [0, 1, 1, 2, 3, 5, 8, 13, 21]



puts "---fibonacci sequence recursion---"

# Time: O(n), where is is n elements 
# Space: O(n), where n is n frames on call stack
def fib_sequence_rec(n)
    # remember that whatever data type your desired output is, make sure the base case returns the same data type!
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2
    
    # at peak of stack, fibs = [0, 1] base case, then as stack unwinds, next line runs following line fibs[-1] + fibs[-2] however many times the height of stack is
    fibs = fib_sequence_rec(n - 1)
    fibs.push(fibs[-1] + fibs[-2])
end 

p fib_sequence_rec(3) == [0, 1, 1]
p fib_sequence_rec(5) == [0, 1, 1, 2, 3]
p fib_sequence_rec(9) == [0, 1, 1, 2, 3, 5, 8, 13, 21]
# p fibs_rec(100) # == [0, 1, 1, 2, 3, 5, 8, 13, 21]



puts "---fibonacci---"

# Given a number n, print n-th Fibonacci Number. 
# Examples:
# If n = 0, then fib() should return 0. 
# If n = 1, then it should return 1.
# 0 + 1 = 1, 2nd fib number
# 2 + 1 = 3, 3rd fib number
def fibonacci(n)
    return 1 if n == 1 || n == 2
    return fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1 # [0, 1]
p fibonacci(2) == 1 # [0, 1]
p fibonacci(3) == 2 # [0, 1, 1]
p fibonacci(5) == 5 # [0, 1, 1, 2, 3]
p fibonacci(9) == 34 #[0, 1, 1, 2, 3, 5, 8, 13, 21]
# p fibonacci_sum(100) 


puts "---fibonacci memoization---"

def fibonacci_2(n)
    # initialize cache
    cache = { 1 => 1, 2 => 1 }

    return cache[n] unless cache[n].nil?
    res = fibonacci_2(n - 1) + fibonacci_2(n - 2)
    cache[n] = res 
    return res
end 

p fibonacci_2(1) == 1 # [0, 1]
p fibonacci_2(2) == 1 # [0, 1]
p fibonacci_2(3) == 2 # [0, 1, 1]
p fibonacci_2(5) == 5 # [0, 1, 1, 2, 3]
p fibonacci_2(9) == 34 #[0, 1, 1, 2, 3, 5, 8, 13, 21]
# p fibonacci_2(100) # does not work


puts "---Fibonacci class memoization---"

# class Fibonacci
#     def initialize
#     # use a data structure that gives us constant lookup time. Both a hash and an array will do. Although we could use an array in this case, a hash is better since it does not confine us to integer keys.
#         @cache = { 1 => 1, 2 => 1 }
#     end
    $cache = { 1 => 1, 2 => 1 }
    def fibonacci_3(n)
        # return 1 if n == 1 || n == 2
        # Check our cache instead of the original base case
        return $cache[n] unless $cache[n].nil?
    
        # Record our answer in our cache before returning it
        ans = fibonacci_3(n - 1) + fibonacci_3(n - 2)
        $cache[n] = ans
        return ans
    end
#   end

# a = Fibonacci.new
p fibonacci_3(100)
# p fibonacci_2(1) == 1 # [0, 1]
# p fibonacci_2(2) == 1 # [0, 1]
# p fibonacci_2(3) == 2 # [0, 1, 1]
# p fibonacci_2(5) == 5 # [0, 1, 1, 2, 3]
# p fibonacci_2(9) == 34 #[0, 1, 1, 2, 3, 5, 8, 13, 21]
# p fibonacci_2(100)



puts "---is_palindrome?---"

# Write a function that takes a string and returns true if it's a palindrome, false if it's not. 
# This solution takes less time and memory than rebuilding the string backward and comparing the two.
# Ex: madam or racecar are palindromes
# You're essentially implementing an in-place #reverse using two-pointer technique
# Time: O(n/2) 
# Space: O(1)
def is_palindrome?(string)
    right_idx = string.length - 1
    (0...string.length / 2).each do |left_idx|
        return false if string[left_idx] != string[right_idx - left_idx]
    end 
    true
end 

p is_palindrome?("madam") == true 
p is_palindrome?("racecar") == true 
p is_palindrome?("raceca") == false 



puts "---valid_ip?---"

# Write a method that takes a string as input. It should return true if the input is a valid IPv4 address (ie. anything between 0.0.0.0 and 255.255.255.255 is valid).
# Time: O(n), where n is length of string 
# Space: O(1), constant because hash always stores 10 key-val pairs
def valid_ip?(string)
    # make sure string contains 3 periods and is not longer than max length
    # it should start with a series one or more digits (\d+) followed by three groups that start with . and are followed with one or more digits ((\.\d+){3}).

    # return false unless str =~ /^\d+(\.\d+){3}$/ 
    return false if string.length > 15 
    
    # to check if string is an integer because "abc".to_i returns 0
    num_hash = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9}

    string.split(".").each do |str|
        return false if str.length > 3 || str.empty?

        # make sure all characters in str are integers
        str.each_char { |el| return false if num_hash[el].nil? } # constant time O(3) worst case

        current_int = str.to_i
        next if current_int >= 0 && current_int <= 255
        false
    end 
    true 

end 

p valid_ip?("0.0.0.0") == true 
p valid_ip?("..0.0") == false 
p valid_ip?("255.255.255.255") == true
p valid_ip?("255.255.255.2m5") == false



puts "---sum_from_file---"

# Write a method that reads in a file of integer strings, one per line, and sums them. Skip the line if it begins with a "#".
# Time: O(n), where n is length nums
# Space: O(n), where n is length of nums
def sum_from_file(filename)
    # ::readlines creates an array of each line in file. Returns an array of integers due to #map
    nums = File.readlines(filename)
               .select { |line| line[0] != "#" }
               .map(&:to_i)
    nums.reduce(:+)
end 

