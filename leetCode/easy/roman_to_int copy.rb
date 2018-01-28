# Given a roman numeral, convert it to an integer.
#
# Input is guaranteed to be within the range from 1 to 3999.

def roman_to_int2(str)
  return nil if str.empty?

  # inititalize
  roman_hash = {
    "M" => 1000,
    "D" => 500,
    "C" => 100,
    "L" => 50,
    "X" => 10,
    "V" => 5,
    "I" => 1
  }
  
  total = 0
  ch_arr = str.split("")

  # iterate through array excluding last element, or can write conditional within iteration that states if idx == ch_arr.length - 1
  (0...ch_arr.length - 1).each do |idx|
    current_roman = ch_arr[idx]
    next_roman = ch_arr[idx + 1]
    if roman_hash[current_roman] >= roman_hash[next_roman]
      total += roman_hash[current_roman]
    else
      total -= roman_hash[current_roman]
    end
  end
  # after exiting iteration, add value using last element in ch_arr
  total += roman_hash[ch_arr.last]

end

p roman_to_int2("DCXLI") == 641
p roman_to_int2("DCXXI") == 621
p roman_to_int2("MCMXCVI") == 1996



# first attempt on leetCode. Not the cleanest code but it works.
# Looks like O(n) time, where n is length of input string.
def roman_to_int(s)
  roman_hash = {
    "I" => 1,
    "II" => 2,
    "III" => 3,
    "IV" => 4,
    "V" => 5,
    "VI" => 6,
    "VII" => 7,
    "VIII" => 8,
    "IX" => 9,
    "X" => 10,
    "XX" => 20,
    "XXX" => 30,
    "XL" => 40,
    "L" => 50,
    "LX" => 60,
    "LXX" => 70,
    "LXXX" => 80,
    "XC" => 90,
    "C" => 100,
    "CC" => 200,
    "CCC" => 300,
    "CD" => 400,
    "D" => 500,
    "DC" => 600,
    "DCC" => 700,
    "DCCC" => 800,
    "CM" => 900,
    "M" => 1000
  }

  # initialize
  int = 0
  s_arr = s.split("")
  str = ""

  s_arr.each_with_index do |ch, idx|
    str.concat(ch)
    if roman_hash[str]
      # if looking at last set of characters (i.e. VI), we cannot go to next iteration.
      if idx == s_arr.length - 1
        int += roman_hash[str]
        break
      end
      next

    else
      int += roman_hash[str[0...-1]]
      # reset str and append current character
      str = ""
      str.concat(ch)
      # if we're looking at last character (i.e. I), must add to int
      int += roman_hash[str] if idx == s_arr.length - 1
    end
  end
  int

end

p roman_to_int("DCXLI") == 641
p roman_to_int("DCXXI") == 621
p roman_to_int("MCMXCVI") == 1996
