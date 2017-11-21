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
  # p longest_substring
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
