# return all possibilities of a window size k = 2. There are (arr.length - K) + 1 windows (i.e. (5 - 2) + 1 = 4)

# determine windows in original array of integers
def window(arr, k)
  window_arr = []

  arr.each_index do |idx|
    break if idx + k > arr.length
    window_arr.push(arr[idx...idx + k])
  end
  window_arr
end

arr = [1, 2, 3, 4, 5]
test_arr = Array.new(2000) {rand(50000..150000)}
k = 3
p window(arr, k)
p window(test_arr, k)
# if k = 2: return [1, 2], [2, 3], [3, 4], [4, 5]
# if k = 3: return [1, 2, 3], [2, 3, 4], [3, 4, 5]


# Iterate through each window, search and retrieve increasing or decreasing subranges, where a subrange is a contiguous range of indices where each element is greater than the previous value, or less than the previous value.
