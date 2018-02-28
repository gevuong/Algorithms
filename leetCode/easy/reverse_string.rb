# Write a function that takes a string as input and returns the string reversed.

# Example:
# Given s = "hello", return "olleh".

def reverse_string(s)
    s_arr = s.split("")
    reverse_str = ""
    (s_arr.length - 1).downto(0) do |idx|
        reverse_str.concat(s[idx])
    end 
    reverse_str 

end

p reverse_string("hello") == "olleh"
