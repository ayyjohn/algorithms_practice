# Write a method that finds all the unique substings for a word.

# assuming that a substring is defined as a contiguous section of the word
# this will require iterating through the string n-1 + n-2 + ... times
# which is on the order of O(n**2) where n is the length of the string.
# the algorithm will be to iterate over the string in a nested loop
# and slice it over and over, finding all the substrings eventually.
# and then since order doesn't matter, you can store them in a hash
# and at the end retrieve all of them.

# Time complexity: O(n^3) where n is the length of the string.
# the time complexity of the outer two loops is on the order of O(n^2)
# from n-1 + n-2 + ... and then hashing a string of length n is linear
# time as is slicing a string into n length parts

def unique_substrings(string)
  substrings = {}
  0.upto(string.length - 1) do |i|
    (i + 1).upto(string.length) do |j|
      substrings[string[i...j]] = true
    end
  end
  substrings.keys
end

p unique_substrings('cat')
p unique_substrings('aaaa')
p unique_substrings('hello')

# better implementation, same time complexity but using a set
# in ruby to achieve slightly better readability

require 'set'

def unique_substrings(string)
  substrings = Set.new

  string.length.times do |i|
    (i...string.length).each do |j|
      substrings.add(string[i..j])
    end
  end

  substrings.to_a
end

p unique_substrings('cat')
p unique_substrings('aaaa')
p unique_substrings('hello')
