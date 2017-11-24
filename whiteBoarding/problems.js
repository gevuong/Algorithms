// #
let isPalindrome = function(string) {
  if (string.split("").reverse().join("") === string) {
    return true;
  } else {
    return false;
  }
}

console.log(isPalindrome("racecar"));
console.log(isPalindrome("cat"));
