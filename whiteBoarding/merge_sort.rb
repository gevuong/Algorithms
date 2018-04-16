def merge_sort(arr)
    return arr if arr.length < 2

    mid_idx = arr.length / 2

    sorted_left = merge_sort(arr[0...mid_idx])
    sorted_right = merge_sort(arr[mid_idx..-1])

    merge(sorted_left, sorted_right)
end

def merge(left, right)
    sorted_arr = []
    until left.empty? || right.empty?
        sorted_arr << (left.first < right.first ? left.shift : right.shift)
    end

    sorted_arr + left + right
end


p merge_sort([3, 6, 2, 1, 0, 3, 2])
# p [3, 6, 2, 1, 0, 3, 2].merge_sort
