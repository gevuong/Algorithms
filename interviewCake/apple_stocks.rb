# Suppose we could access yesterday's stock prices as an array, where:
#
# The indices are the time in minutes past trade opening time, which was 9:30am local time.
# The values are the price in dollars of Apple stock at that time.
# So if the stock cost $500 at 10:30am, stock_prices_yesterday[60] = 500.
#
# Write an efficient method that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.


# stock_prices_yesterday = [10, 7, 5, 8, 11, 9]
#
# get_max_profit(stock_prices_yesterday)
# # returns 6 (buying for $5 and selling for $11)

# No "shorting"—you must buy before you sell. You may not buy and sell in the same time step (at least 1 minute must pass).

# wc: O(n * (n-1))
def get_max_profit(apple_stocks)
  max_profit = 0
  (0...apple_stocks.length).each do |idx|
    current_price = apple_stocks[idx]
    (idx + 1..apple_stocks.length - 1).each do |idx2|
      break if idx2 >= apple_stocks.length
      next if current_price > apple_stocks[idx2]
      profit = apple_stocks[idx2] - current_price
      max_profit = profit if profit > max_profit
    end
  end

  max_profit
end

p get_max_profit([10, 7, 5, 8, 11, 9]) == 6

# WE CAN DO BETTER! IF we do better, it will either be O(nlog(n)) or O(n) time. nlog(n) usually referes to sorting algorithms, like merge sort.

# O(n)
def get_max_profit(stock_prices_yesterday)
  if stock_prices_yesterday.length < 2
    raise ArgumentError, 'Getting a profit requires at least 2 prices'
  end

  # we'll greedily update min_price and max_profit, so we initialize
  # them to the first price and the first possible profit
  min_price = stock_prices_yesterday[0]
  max_profit = stock_prices_yesterday[1] - stock_prices_yesterday[0]

  stock_prices_yesterday.each_with_index do |current_price, index|

    # skip the first time, since we already used it
    # when we initialized min_price and max_profit
    next if index.zero?

    # see what our profit would be if we bought at the
    # min price and sold at the current price
    potential_profit = current_price - min_price

    # update max_profit if we can do better
    max_profit = [max_profit, potential_profit].max

    # update min_price so it's always
    # the lowest price we've seen so far
    min_price  = [min_price, current_price].min
  end

  max_profit
end

p get_max_profit_2([10, 7, 5, 8, 11, 9]) == 6
p get_max_profit_2([10, 7, 5, 4, 3, 2]) == -1
p get_max_profit_2([10])
