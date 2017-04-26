# Write a function that takes in a message and an icrement amount and 
# outputs the same letters shifted by that amount in the alphabet.
# Assume lowercase and no punctuation, but do preserve spaces between
# multiple words which are allowed.

# Iterate over string, converting it into an array of ascii values and
# for each of those, add the shift value, and if it's more than 'z'
# then subtract 26.

# Time complexity: O(n), since you have to iterate over the entire string
# multiple times.
def caesar_cypher(string, shift)
  string.split('').map do |char|
    if char == ' '
      char
    elsif char.ord + shift > 'z'.ord
      (char.ord + shift - 26).chr
    else
      (char.ord + shift).chr
    end
  end.join('')
end

puts caesar_cypher("hello", 1)
puts caesar_cypher("hello", 2)
puts caesar_cypher("hello world", 1)
puts caesar_cypher("zzz", 1)
