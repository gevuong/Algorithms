# Write a function to find the longest common prefix string amongst an array of strings.
# Worst case O(n * m), where n is length of array, and m is length of largest string
def longest_common_prefix(arr)
    return "" if arr.all? { |str| str.empty? }
    return arr[0] if arr.length == 1

    # initialize
    min_length = arr[0].length
    min_string = arr[0]

    # find min length of string in array
    arr.each do |string|
        next if string.empty?
        if string.length < min_length
            min_string = string
            min_length = string.length
        end
    end

    lcp = ""
    # O(n * m), where n is length of array, and m is length of largest string
    (0...min_length).each do |idx|
        ch = min_string[idx]
        if arr.all? { |string| string[idx] == ch }
            lcp.concat(ch)
        else
            return lcp
        end
    end

    lcp
end


p longest_common_prefix(["geeksforgeeks", "geeks", "geek", "geezer"]) == "gee"
p longest_common_prefix(["apple", "ape", "april"]) == "ap"
p longest_common_prefix(["abcde", "abcfe", "abcge"]) == "abc"
p longest_common_prefix(["aca","cba"]) == ""


# def longest_common_prefix2(arr)
#
#     mid = arr.length / 2
#     left = longest_common_prefix2(arr[0..mid])
#     right = longest_common_prefix2(arr[mid + 1..-1])
#
#
# end
#
# def compare_strings(str1, str2)
#
# end
