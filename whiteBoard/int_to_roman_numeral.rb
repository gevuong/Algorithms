# Give an integer between 1-3999, convert it to a roman numeral.

# Step 0: Base cases?

ROMAN_NUMERAL = {
  1 => "I",
  2 => "II",
  3 => "III",
  4 => "IV",
  5 => "V",
  6 => "VI",
  7 => "VII",
  8 => "VIII",
  9 => "IX",
  10 => "X",
  20 => "XX",
  30 => "XXX",
  40 => "XL",
  50 => "L",
  60 => "LX",
  70 => "LXX",
  80 => "LXXX",
  90 => "XC",
  100 => "C",
  200 => "CC",
  300 => "CCC",
  400 => "CD",
  500 => "D",
  600 => "DC",
  700 => "DCC",
  800 => "DCCC",
  900 => "CM",
  1000 => "M"
}

def int_to_roman_numeral(num)
  return ROMAN_NUMERAL[num] if num <= 10

  digit_count = num.to_s.length
  str = ""

  while digit_count > 0
    divider = 10**(digit_count - 1) # returns 1000, 100, 10
    if digit_count == 1
      str.concat(ROMAN_NUMERAL[num % 10])
      p str
      digit_count -= 1
      p digit_count
    else
      quotient = num / divider
      multiplied_val = quotient * divider

      str.concat(ROMAN_NUMERAL[multiplied_val])
      digit_count -= 1
      p digit_count
    end
  end
  return str
end

int_to_roman_numeral(8) #=> "VIII"
int_to_roman_numeral(18) #=> "XVIII"
