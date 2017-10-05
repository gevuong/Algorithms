


# Given a number, sum the digits of a positive integer. If integer greater than or equal to 10, sum the digits of the resulting number. Keep repeating until there is only one digit in the result, called the digital root. Do not use string conversion within method.

# Step 0: Base cases?
# Is the number passed in the arg always going to be greater than 0?
# Can we assume the number is an integer and not a float?
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
    num /= 10
  end

  sum
end

puts digital_root(12345)
