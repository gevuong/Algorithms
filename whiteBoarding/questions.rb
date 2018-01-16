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


# Given two sorted arrays, find the median element amongst the two arrays. That is, if both arrays were combined, find the median element from the combined array. Assume that there is not enough memory to actually combine both arrays. There exists an O(log n + log m) solution.

# Important question to distinguish between O(n) or O(log(n + m)) time.
# Are both arrays of the same size? If so, then using divide and conquer provides an efficient solution to obtain O(log(n))

# helper method
def median(arr)
  if arr.length % 2 == 0
    med = ((arr[arr.length / 2] + arr[(arr.length - 1) / 2]) / 2)
  else
    med = arr[arr.length / 2]
  end

  med
end

def get_median(arr1, arr2)
  # base case
  return nil if arr1.empty? && arr2.empty?

  # have to keep track of length of arrays. When length of array is 2, then we can find the median by executing the following
  if arr1.length == 2 && arr2.length == 2
    return ([max(arr2, arr1) + min(arr2, arr1)] / 2)
  end

  # find medium of arr1 and arr2 individually
  med_1 = median(arr1)
  med_2 = median(arr2)

  # if med_1 < med_2, median is in range (med_1..med_2)
  # if med_1 > med_2, median is in range (med_2..med_1)
  if med_1 < med_2
    get_median(arr1[med_1..-1], arr2[0..med_2])
  elsif med_1 > med_2
    get_median(arr1[med_2..-1], arr2[0..med_1])
  elsif med_1 == med_2
    return med_1
  end

end



puts("--------median")
get_median([1,2,3,5,8], [4,5,6,7])


# Day 16
# Write a method that takes an array and returns its duplicate values. Use less than O(n*n) time.

# Whiteboarding steps
# Step 1: create a counter hash to store number of occurrences.
# Step 2: if hash values are greater than 2, then push key into copy_arr.
# Step 3: return copy_arr

# O(n)
def duplicates(arr)
  return nil if arr.empty?
  hash = Hash.new(0)

  arr.each do |el|
    hash[el] += 1
  end

  copy_arr = []
  hash.keys.each do |key|
    copy_arr.push(key) if hash[key] > 1
  end

  copy_arr
end
puts("----------duplicates")
p duplicates([1,2,2,3,4,4,5]) == [2, 4]



# Write a method that takes a hash of symbol keys, for which the values are integers representing each key's weight. The method returns a key such that the chances of selecting a particular key are weighted by that key's value.

# For the hash {:a => 1, :b => 2, :c => 3}, the chance of returning :c is 1/2, :b is 1/3, and :a is 1/6.

# Whiteboarding scenario:
# the values of keys are weights

# sum of weights: need to get sum of values to find weight
# divide the keys value by sum of weights and return result

# wc: O(n)
def choose_a_record(hash)
  sum_of_values = hash.values.reduce(:+)
  return nil if sum_of_values == 0
  rand_num = rand(sum_of_values) # returns a random number from (0...sum_of_values)

  sum = 0
  hash.each do |key, val|
    sum += val
    # the higher the value is, the more likely value > rand_num generated. its corresponding key will return. If val > rand_num, we are in the weighted portion of the corresponding key, and key is returned.
    # if rand_num > sum, then the next key-val pair will be assessed, val will be added to sum, and so forth.
    # if rand_num = 0, then any val > 0 will return corresponding key.
    if rand_num < sum
      return key
    end
  end
end

p ('--------choose_a_record')
p choose_a_record({:a => 1, :b => 2, :c => 3})
