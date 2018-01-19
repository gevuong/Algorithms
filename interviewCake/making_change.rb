# Write a function that, given:
# 1. an amount of money
# 2. a list of coin denominations

# Compute the number of ways to make the amount of money with coins of the available denominations.

# Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your program would output 4—the number of ways to make 4¢ with those denominations:
#
# 1¢, 1¢, 1¢, 1¢
# 1¢, 1¢, 2¢
# 1¢, 3¢
# 2¢, 2¢

# edge case: if denominations are all greater than amount, return 0.
def making_change(amount_left, denominations, current_idx = 0)
  # base cases:
  # return 1 if no amount is left. return 0 if overshoot amount (used too many coins)


  while amount_left > 0
    making_change(amount_left, denominations[current_idx..-1], current_idx + 1)
  end
end


# Make Change: write a function that takes in an amount and a set of coins. Return the minimum number of coins needed to make change for the given amount. You may assume you have an unlimited supply of each type of coin. If it's not possible to make change for a given amount, return nil or NaN.

# Example:
#
# make_change(14, [10, 7, 1])
# return 2 because [7, 7] is the smallest combination
