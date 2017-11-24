# Day 1
# Write a method, digital_root(num). It should sum the digits of a positive integer. If it is greater than or equal to 10, sum the digits of the resulting number. Keep repeating until there is only one digit in the result, called the "digital root". Do not use string conversion within your method.
def digital_root(num)
  return num if num.between?(0, 10)
  while num >= 10
    num = sum_digits(num)
  end
  num
end

def sum_digits(num)
  sum = 0
  while num > 0
    sum += num % 10
    num = num / 10
  end
  sum
end

p sum_digits(12345) # => 15
p digital_root(12345) # => 6


# Write a function that takes a message and an increment amount and outputs the same letters shifted by that amount in the alphabet. Assume lowercase and no punctuation. Preserve spaces.
def caesar_cipher(string, increment)
  alphabet = ("a".."z").to_a
  new_str = ""
  string.each_char do |el|
    if el == " "
      new_str << el
      next
    end
    idx = alphabet.index(el)
    new_str << alphabet[((idx + increment) % 26)]
  end
  new_str
end

p caesar_cipher("abc xyz", 3) # => "def abc"


# Write a function, longest_common_substring(str1, str2) that takes two strings and returns the longest common substring. A substring is defined as any consecutive slice of letters from another string.

# Bonus: solve it in O(m * n) using O(m * n) extra space. (Hint: the solution involves dynamic programming which will be introduced later in the course.)

# naive solution
# This runs in O(m * n**2) time, where n is the length of the length of str1 and m is the length of str2. We know this because there are two nested while loops that iterate through str1 (O(n**2)), and within the while loop we check the substring for inclusion in str2 (O(m)).
def longest_common_substring(str1, str2)
  longest_substring = ""
  (0...str1.length).each do |idx|
    (idx..str1.length).each do |idx2|
      if str2.include?(str1[idx..idx2])
        if longest_substring.length < str1[idx..idx2].length
          longest_substring = str1[idx..idx2]
        end
      end
    end
  end
  longest_substring.length
end

p longest_common_substring("abcdxyz", "xyzabcd") # => 4, "abcd"
p longest_common_substring("GeeksforGeeks", "GeeksQuiz") # => 5, "Geeks"
p longest_common_substring("zxabcdezy", "yzabcdezx") # => 6, "abcdez"


# Write a function that takes an array of integers and returns their sum. Use recursion.
def sum_rec(arr)
  return 0 if arr.empty?
  sum_rec(arr.slice(0, arr.length - 1)) + arr[-1]
end

p sum_rec([1,2,3,4])


# Day 2
# Write a function, fibs(num) which returns the first n elements from the fibonnacci sequence, given n.
# Solve it both iteratively and recursively.
# Time copmlexity: O(n), Space: O(n) since we will have O(n) frames on the call stack.
def fibs_iter(n)
  return [0, 1].take(n) if n <= 2
  arr = [0, 1]
  (n - 2).times do
    arr << arr[-2] + arr [-1]
  end
  arr
end

p fibs_iter(5)

# Time complexity is O(n), where n is num. Space complexity is O(n), since we will have O(n) frames on the call stack.
def fibs_rec(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  fibs = fibs_rec(n - 1)
  fibs << fibs[-1] + fibs[-2]
end

p fibs_rec(4) # => [0, 1, 1, 2]


# Write a JavaScript function that takes a string and returns true if it's a palindrome, false if it's not. Use JavaScript.
# This solution takes less time and memory than rebuilding the string backward and comparing the two.
def isPalindrome(string)
  string.reverse == string
end

p isPalindrome("racecar") # => true
p isPalindrome("cat") # => false


# Day 6
# To solve without .concat or .map, but using only .each
# time complexity if linear
def subsets(arr)
  return [[]] if arr.empty?
  subs = subsets(arr.slice(0, arr.length - 1))
  new_arr = []
  subs.each do |sub|
    new_arr << sub
    new_arr << sub + [arr.last]
  end
  new_arr
end

p subsets([1, 2, 3])
p subsets([])
p subsets([1])
p subsets([1, 2])


# Day 11
# time and space complexity is O(n!)
def permutations(arr)
  return [arr] if arr.length <= 1

  perms = permutations(arr.slice(0, arr.length - 1))
  permutations_arr = []

  perms.each do |perm|
    # perm.length will never be same as arr.length. In this case, max perm.length is 2
    (0..perm.length).each do |idx|
      permutations_arr << perm[0...idx] + [arr.last] + perm[idx..-1]
    end
  end
  permutations_arr
end

p('----------permutations')
p permutations([1, 2, 3])
