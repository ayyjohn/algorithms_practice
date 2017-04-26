# write a function, longest_common_substring(str1, str2) that takes two strings as
# arguments and returns the longest common substring. A substring is defined as any
# consecutive slice of letters from another word. Bonus: Solve it in O(m * n) time and
# O(m * n) space using dynamic programming.

# Naive solution: collect all substrings of each word, find the union of both arrays/hashes
# and take the longest.
# Time complexity: Finding the substrings of a string is O(length of string ** 2), because
# it involves iterating over length, length - 1, length - 2... 3, 2, 1, elements which reduces to
# n * (n-1) / 2. This must be called twice, so m**2 + n**2 time. Then the next part involves finding
# the common elements of both substring arrays. All substrings of an n length string will be n! length
# and finding the common substrings can be done by iterating over one list, saving all elements in a hash
# and then iterating over the second and inserting elements in a new array if they're in the hash.
# that part is O(n! + m!). And then finally depending on how long the common elements are you have to
# iterate over all of them and find the max by length, which is linear time. Overall O(m!) time with
# O(m!) space.

def longest_common_substring(str1, str2)
  substrings1 = substrings(str1)
  substrings2 = substrings(str2)
  return '' if substrings2.empty? || substrings1.empty?
  common_substrings = substrings1 & substrings2
  common_substrings.max_by { |word| word.length }
end

def substrings(string)
  length = string.length
  substrings = []
  (0..length).each do |i|
    (i + 1..length).each do |j|
      substrings << string[i...j]
    end
  end
  substrings
end

# slight improvement, can be done in O(m * n**2) time with O(1) space by not storing substrings, just
# checking inclusion as you iterate over the n length string

def longest_common_substring(str1, str2)
  length = str1.length
  longest_substring = ""
  (0..length).each do |i|
    (i + 1..length).each do |j|
      if j - i - 1 > longest_substring.length
        substring = str1[i...j]
        longest_substring = substring if str2.include?(substring) && substring.length > longest_substring.length
      end
    end
  end
  longest_substring
end

def make_matrix(str1, str2)
  matrix = Array.new(str1.length + 1) { Array.new(str2.length + 1, 0) }

  str1.chars.each_with_index do |el1, idx1|
    str2.chars.each_with_index do |el2, idx2|
      if el1 == el2
        matrix[idx1 + 1][idx2 + 1] = matrix[idx1][idx2] + 1
      else
        matrix[idx1 + 1][idx2 + 1] = 0
      end
    end
  end

  matrix
end

def longest_common_substring(str1, str2)
  matrix = make_matrix(str1, str2)
  greatest_substring = ""
  matrix.each_with_index do |row, idx1|
      row.each_with_index do |length, idx2|
      if length > greatest_substring.length
        greatest_substring = str2[idx2 - length...idx2]
      end
    end
  end
  greatest_substring
end
