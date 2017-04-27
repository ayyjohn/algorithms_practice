# Implement the folding cypher. It folds the alphabet in half and uses the adjacent letter.
# ie a maps to z, b maps to y, c to x, etc. m and n map to each other in the middle since
# the alphabet is even numbered

# assume lower case letters, although spaces are possible for a longer message
# but with no punctuation

def folding_cypher(string)
  alpha_hash = {}
  alphabet = ('a'..'z').to_a
  alphabet.each_with_index do |letter, idx|
    alpha_hash[letter] = alphabet[alphabet.length - idx - 1]
  end
  string.split('').map do |char|
    if alpha_hash[char]
      alpha_hash[char]
    else
      char
    end
  end.join('')
end

p folding_cypher('hell')
p folding_cypher('hello world')
p folding_cypher('alphabetical with .. and ..??')

# super clean ass version with similar time/space complexity but nice line
# reduction by using zip and Hash::[]

def folding_cypher(string)
  folded_alphabet = Hash[('a'..'z').zip(('a'..'z').to_a.reverse)]
  string.chars.map { |chr| folded_alphabet[chr] }.join
end

p folding_cypher('hell')
p folding_cypher('hello world')
p folding_cypher('alphabetical with .. and ..??')
