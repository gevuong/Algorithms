# Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.
#
# Note:
# The length of both num1 and num2 is < 5100.
# Both num1 and num2 contains only digits 0-9.
# Both num1 and num2 does not contain any leading zero.
# You must not use any built-in BigInteger library or convert the inputs to integer directly.

def add_strings(num1, num2)
    arr1 = num1.split("")
    arr2 = num2.split("")

    length = [arr1.length, arr2.length].max
    sum = 0
    (0...length).each do |el|
        sum += (arr1.pop.to_i + arr2.pop.to_i) * 10**el
    end
    sum
end

p add_strings("5", "10") # 15
p add_strings("521", "152") # 673



def add_strings2(num1, num2)
  # when you hear "contains only digits 0-9", think of creating a hash of those values.
  num_hash = {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9
  }

  # O(n) time I believe
  num1_arr = num1.split("").reverse
  num2_arr = num2.split("").reverse

  num_1 = 0
  num_2 = 0

  # O(n) time
  num1_arr.each_with_index do |num, pow|
    num_1 += num_hash[num] * 10**pow
  end

  num2_arr.each_with_index do |num, pow|
    num_2 += num_hash[num] * 10**pow
  end

  # cannot convert string to int, but converting int to string is fine
  (num_1 + num_2).to_s
end

p add_strings2("0", "0") == "0"
p add_strings2("1", "1") == "2"
p add_strings2("1234", "88") == "1322"
p add_strings2("11234", "19012") == "30246"
p add_strings2("999", "999") == "1998"
