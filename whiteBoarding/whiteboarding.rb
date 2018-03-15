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

# |"" | C | A | T  
# --------------------
# "" | 0 | 0 | 0 | 0
# --------------------
# R  | 0 | 0 | 0 | 0
# --------------------
# A  | 0 | 0 | 1 | 0
# --------------------
# T  | 0 | 0 | 0 | 2  <--- Longest substring ends here!


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
def fibs(n)
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

p fibs(3) == [0, 1, 1]
p fibs(5) == [0, 1, 1, 2, 3]
p fibs(9) == [0, 1, 1, 2, 3, 5, 8, 13, 21]


# Time: O(n), where is is n elements 
# Space: O(n), where n is n frames on call stack
def fibs_rec(n)
    # remember that whatever data type your desired output is, make sure the base case returns the same data type!
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2
    
    # at peak of stack, fibs = [0, 1] base case, then as stack unwinds, next line runs following line fibs[-1] + fibs[-2] however many times the height of stack is
    fibs = fibs_rec(n - 1)
    fibs.push(fibs[-1] + fibs[-2])
end 

p fibs_rec(3) == [0, 1, 1]
p fibs_rec(5) == [0, 1, 1, 2, 3]
# p fibs_rec(9) == [0, 1, 1, 2, 3, 5, 8, 13, 21]


puts "---subsets---"


## DAY 6 
# Write a function that takes an array and returns all of its subsets. How many sets will it return?
# 2^n exponential sets. 2^n = 8 sets
# [1, 2, 3] = [[], [1], [1, 2], [1, 3], [2], [2, 3], [3], [1, 2, 3]]

def subsets(arr)
    output_arr = [[]]
   
    (0...arr.length).each do |slow_idx|
        small_subset = [arr[slow_idx]]
        output_arr.push(small_subset)

        (slow_idx + 1...arr.length).each do |fast_idx|
            med_subset = small_subset + [arr[fast_idx]]
            output_arr.push(med_subset)    
        end 

        large_subset = arr[slow_idx..-1]
        output_arr.push(large_subset) unless output_arr.include?(large_subset)
    end 

    output_arr
end 

# p subsets([1, 2, 3]) 
# p subsets([1, 2, 3, 4]) 
# p subsets([1, 2, 3, 4]).length  == 16

# def subsets(arr)
#     return [[]] if arr.empty?

#     val = arr[-1] 
#     subs = subsets(arr[0...arr.length - 1])
#     new_subs = subs.map do |sub|
#         sub + [val]
#     # Step 1: iterate arr[0..arr.length - 1]
#     end 
#     subs + new_subs
# end 

def subsets(arr)
    return [[]] if arr.empty?
  
    val = arr[-1]
    subs = subsets(arr[0...arr.length - 1])
    new_subs = subs.map { |sub| sub + [val] }
  
    subs + new_subs
  end

p subsets([1, 2, 3]) 
p subsets([1, 2, 3, 4]) 
p subsets([1, 2, 3, 4]).length == 16 

0,1,0,2,1,0,1,3,2,1,2,1]

puts "---permutations---"


|
3  +                           +---+
   |                           |   |
2  +           +---+           +-------+   +---+
   |           |   | x   x   x |   |   | x |   |
1  +   +---+   +-------+   +-----------------------+
   |   |   | x |   |   | x |   |   |   |   |   |   |
   +-----------------------------------------------+
     0   1   0   2   1   0   1   3   2   1   2   1 
     0   1   1   2   2   2   2   3   3   3   3   3
     3   3   3   3   3   3   3   3   2   2   1   0
     
# O(n!)
def permutations(arr)
    return [[]] if arr.empty?
  
    perms = []
    arr.length.times do |i|
      # Choose an element to be first
      el = arr[i]
      rest = arr.take(i) + arr.drop(i + 1)
  
      # Find permutations of the rest, and tack the first `el` at front.
      new_perms = permutations(rest).map { |perm| perm.unshift(el) }
      perms.concat(new_perms)
    end
  
    perms
  end


  puts "---merge_sort---"

def merge_sort(array)
    # already sorted
    return array if array.count < 2
  
    middle = array.count / 2
    left, right = array.take(middle), array.drop(middle)
  
    sorted_left, sorted_right = merge_sort(left), merge_sort(right)
  
    merge(sorted_left, sorted_right)
  end
  
  def merge(left, right)
    merged_array = []
    until left.empty? || right.empty?
      merged_array <<
        ((left.first < right.first) ? (left.shift) : (right.shift))
    end
  
    merged_array + left + right
  end
#   Time complexity: O(n*log(n)).
  
  def merge(left, right)
    merged_array = []
    i, j = 0, 0
    until i == left.length || j == right.length
      if left[i] > right[j]
        merged_array << right[j]
        j += 1
      else
        merged_array << left[i]
          i += 1
      end
    end
    merged_array + left.drop(i) + right.drop(j)
  end



  puts "---binary_search---"

def binary_search(array, target)
    return nil if array.count == 0
  
    midpoint = array.length / 2
    case target <=> array[midpoint]
    when -1
      binary_search(array.take(midpoint), target)
    when 0
      midpoint
    when 1
      subproblem_answer =
        binary_search(array.drop(midpoint + 1), target)
      subproblem_answer.nil? ? nil : (midpoint + 1) + subproblem_answer
    end
  end



  puts "---is binary_search_tree?---"

# Given a binary tree, write a function to check whether it’s a binary search tree or not.
# O(n): must check every node (stops at first detected violation). The time complexity of this solution is O(n) since we need to visit each node once.
def is_bst?(node, min = nil, max = nil)
    return true if node.nil?
  
    # does this node violate constraints?
    if (min && (min > node.value)) || (max && (max < node.value))
      return false
    end
  
    # this node follows constraints; do its children, too?
    is_bst?(node.left, min, node.value) && is_bst?(node.right, node.value, max)
  end




  puts "---count_islands---"

#  Given a boolean 2D matrix, find the number of islands. A group of connected trues forms an island. For example, the below matrix contains 5 islands.

# Input : mat = [[T, T, F, F, F],
# [F, T, F, F, T],
# [T, F, F, T, T],
# [F, F, F, F, F],
# [T, F, T, F, T]]
# Output : 5
# In order to get neighbor coordinates:
#
# [x - 1, y - 1], [x - 1, y], [x - 1, y + 1]
# [x, y - 1]    ,   SELF    , [x, y + 1]
# [x + 1, y - 1], [x + 1, y], [x + 1, y + 1]    
def count_islands(matrix)
    rows = matrix.length
    cols = matrix[0].length
    visited = Array.new(rows) { Array.new(cols) }
  
    # Initialize count as 0 and traverse through all 
    # cells of the given matrix 
    count = 0 
    (0...rows).each do |row|
      (0...cols).each do |col|
  
        # If a cell with a true value is not visited yet,
        # then new island is found
        if !visited[row][col] && matrix[row][col] 
          # Visit all cells in this island
          # increment island count
  
          visit_island(row, col, visited, matrix)
          count += 1
        end
      end
    end
  
    count 
  end
  
  def visit_island(row, col, visited, matrix)
    neighbor_row = [-1, -1, -1, 0, 0, 1, 1, 1]
    neighbor_col = [-1, 0, 1, -1, 1, -1, 0, 1]
  
    visited[row][col] = true 
  
    (0...8).each do |idx|
      if is_island(row + neighbor_row[idx], col + neighbor_col[idx], visited, matrix)
        visit_island(row + neighbor_row[idx], col + neighbor_col[idx], visited, matrix)
      end
    end
  end
  
  def is_island(row, col, visited, matrix)
    return (row >= 0 && row < matrix.length) && (col >= 0 && col < matrix[0].length) && (matrix[row][col] && !visited[row][col])
  end
#   Time complexity: O(row x col)

