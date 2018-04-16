# Write a function to find the longest common prefix string amongst an array of strings.
# Worst case O(n * m), where n is length of array, and m is length of largest string
def longest_common_prefix(arr)
    return "" if arr.all? { |str| str.empty? }
    return arr[0] if arr.length == 1

    # initialize
    min_length = arr[0].length
    min_string = arr[0]

    # find min length of string in array. That is the longest possible common prefix if all strings in array are equal. 
    arr.each do |string|
        next if string.empty?
        if string.length < min_length
            min_string = string
            min_length = string.length
        end
    end

    lcp = ""

    # Iterate min_length, write a conditional that checks to see if character at respective index is equal to the character of the min_string
    (0...min_length).each do |idx|
        ch = min_string[idx]
        
        if arr.all? { |string| string[idx] == ch }
            lcp.concat(ch)
        end

        return lcp if lcp.empty?
    end

    lcp
end


p longest_common_prefix(["geeksforgeeks", "geeks", "geek", "geezer"]) == "gee"
p longest_common_prefix(["apple", "ape", "april"]) == "ap"
p longest_common_prefix(["aca","cba"]) == ""


# divide and conquer, similar to merge sort technique
# Time O(n*m): For each iteration, you split the list in half (by quantity of strings, n), digging down until your base case gets executed once for each of the n strings. Each of those carries out an O(m) operation. The merge fcn carries out an O(m) operation. O(m) * O(n) is O(mn). 
# Space O(m*log(n)): There is a memory overhead since we store recursive calls in the execution stack. There are log(n) recursive calls, each store needs m space to store the result, so space complexity is O(m*log(n)).
def longest_common_prefix2(arr)
    return "" if arr.all? { |string| string.empty? }
    return arr[0] if arr.length == 1

    mid_idx = arr.length / 2
    left_lcp = longest_common_prefix2(arr[0...mid_idx])
    right_lcp = longest_common_prefix2(arr[mid_idx..-1])
    
    common_prefix(left_lcp, right_lcp)
end

def common_prefix(left_lcp, right_lcp)
    min_length = [left_lcp.length, right_lcp.length].min
    min_string = (left_lcp.length < right_lcp.length ? left_lcp : right_lcp)

    (0...min_length).each do |idx|
        return min_string[0...idx] if left_lcp[idx] != right_lcp[idx]
    end 

    min_string
end 

p longest_common_prefix2(["geeksforgeeks", "geeks", "geek", "geezer"]) == "gee"
p longest_common_prefix2(["apple", "ape", "april"]) == "ap"
p longest_common_prefix2(["aca","cba"]) == ""