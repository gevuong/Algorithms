=begin
Suppose we could access yesterday's stock prices as an array, where:

   The indices are the time in minutes past trade opening time, which was 9:30am local time.
   The values are the price in dollars of Apple stock at that time.

So if the stock cost $500 at 10:30am, stock_prices_yesterday[60] = 500.

Write an efficient method that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.

For example:

 stock_prices_yesterday = [10, 7, 5, 8, 11, 9]

get_max_profit(stock_prices_yesterday)
# returns 6 (buying for $5 and selling for $11)

No "shorting"—you must buy before you sell. You may not buy and sell in the same time step (at least 1 minute must pass).
=end

##########
=begin
1. Can we assume that the array will never be empty?
2. Can we assume that the values in arr are integers and not floats?
3. We need to consider stock prices may decrement throughout entire array?
4. Is "shorting" allowed, meaning can we buy and sell at the same time step?
5. If all the stock prices are the same, then return 0? and if it decrements, return negative profit?
=end

# Nieve solution
# Time O(n + n-1 + n-2 + ... + 2 + 1) = n(n+1)/2 = 
# Space O(1)
def get_max_profit(arr)
  max_profit = 0
  (0...arr.length - 1).each do |idx|
    (idx + 1...arr.length).each do |idx2|
      later_price = arr[idx2]
      earlier_price = arr[idx]

      profit = later_price - earlier_price
      max_profit = profit if profit > max_profit
    end
  end
  max_profit
end


puts get_max_profit([10, 7, 5, 8, 11, 9]) == 6
puts get_max_profit([11, 10, 9, 8, 7, 5]) == -1
puts get_max_profit([10, 7, 11, 8, 5, 9]) == 4
