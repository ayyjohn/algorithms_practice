// write a function that takes a string and returns true if it's a palindrome.
// and false if it's not. This should take less time and memory than reversing
// the string and comparing. Use JavaScript.

// faster than reversing and comparing is to check the first n/2 letters of the
// string with the last n/2 letters, and you don't need to go past the middle
// of the word to do this so it's faster than reversing and comparing.

const isPalindrome = (string) => {
    let len = string.length;
    for (let i = 0; i < len / 2; i++) {
        if (string[i] !== string[len - i - 1]) {
            return false;
        }
    }
    return true;
};

console.log(isPalindrome('racecar'));
console.log(isPalindrome('hello'));
console.log(isPalindrome(''));
console.log(isPalindrome('abc cba'));
console.log(isPalindrome('slakdjfk'));
