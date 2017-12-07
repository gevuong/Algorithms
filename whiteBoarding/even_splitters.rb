# Even Splitters
# ------------------------------------------------------------------------------
# Return an array of characters on which we can split an input string to produce
# substrings of the same length.

# Don't count empty strings after the split.

# Here's an example for "banana":
#
# "banana".split("a") # => ["b", "n", "n"] (all elements same length)
# "banana".split("b") # => ["", anana"] (all elements same length - there's only
# one element "anana" because the empty string doesn't count)
# "banana".split("n") # => ["ba", "a", "a"] (all elements NOT same length)
#
# result: ["b", "a"]

def even_splitters(string)
  return [] if string.empty?
  arr = []
  hash = Hash.new
  return string.chars if string.chars.uniq == string.chars

  string.chars.uniq.each do |uniq_ch| # iterate through each uniq char
    temp_arr = string.split(uniq_ch) # contains splitted string in array

    if temp_arr.length == 1
      arr << uniq_ch
      break
    else
      temp_arr.each do |el|
        next if el == ""
        hash[el.length] = 0
      end

      if hash.keys.length == 1
        arr << uniq_ch
        hash = Hash.new
      else
        hash = Hash.new
      end
    end
  end
  arr
end

puts "-----Even Splitters----"
puts even_splitters("") == []
puts even_splitters("t") == ["t"]
puts even_splitters("jk") == ["j", "k"]
puts even_splitters("xoxo") == ["x", "o"]
puts even_splitters("banana") == ["b", "a"]
puts even_splitters("mishmash") == ["m", "h"]
