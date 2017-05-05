# Given two strings, str1 and str2, find the minimum number of edits (operations)
# required to convert str1 to str2. You have the following actions: Insert, Remove, Replace.

# examples:
# str1 = 'geek', str2 = 'gesek', output = 1, because we insert an s.
# str1  = 'cat', str2 = 'cut', output = 1, because we replace a with u.
# str1 = 'sunday', str2 = 'saturday', output = 3, because we replace n
# with r, and then insert t and a.

# recursive solution: if the strings are the same length, then the edit distance
# is found by iterating over elements and incrementing every time there's a
# discrepancy.
# note that if the strings are the same, then the edit distance is 0
# if the first string is shorter than the second string (assuming the first string
# is being transformed into the second string) then the edit distance is
# found recursively by adding letters until the strings are the same length,
# and finding the shortest resulting edit distance.
# EG to convert cat to chat you insert each of the elements of %w(c h a t)
# into different spots in 'cat' and see which of them has the shortest edit distance.
# note that this can get REALLY slow if the words are longer than 2 apart**
# if the first string is longer than the second string then the recursion applies
# in the other direction, recursively deleting characters and finding which deletion
# gives you the best edit distance.

def edit_distance(str1, str2)
  count = 0
  return count if str1 == str2
  return str2.length if str1.empty?
  return str1.length if str2.empty?
  list1 = str1.split('')
  list2 = str2.split('')
  if str1.length == str2.length
    list1.each_index do |i|
      count += 1 if list1[i] != list2[i]
    end
  elsif str1.length < str2.length
    min_edit_distance = Float::INFINITY
    list2.each_index do |i|
      modifiable = list1.dup
      times = list1.length
      times.times do |j|
        new_word = modifiable.insert(j, list2[i]).join('')
        new_edit_distance = edit_distance(new_word, str2)
        min_edit_distance = (new_edit_distance + 1) if new_edit_distance < min_edit_distance
      end
    end
    return min_edit_distance
  else
    min_edit_distance = Float::INFINITY
    list1.each_index do |i|
      new_word = list1[0...i].concat(list1[i + 1..-1]).join('')
      new_edit_distance = edit_distance(new_word, str2)
      min_edit_distance = (new_edit_distance + 1) if new_edit_distance < min_edit_distance
    end
    return min_edit_distance
  end
  count
end

puts edit_distance('cat', 'car')
puts edit_distance('cat', 'hey')
puts edit_distance('', 'c')
puts edit_distance('h', 'hio')
puts edit_distance('ciit', 'cat')
puts edit_distance('hello', 'elloh')
puts ''
def edit_distance(str1, str2)
  return str1.length if str2.empty?
  return str2.length if str1.empty?

  delt = str1[-1] == str2[-1] ? 0 : 1
  [edit_distance(str1[0...-1], str2[0...-1]) + delt, edit_distance(str1[0...-1], str2) + 1, edit_distance(str1, str2[0...-1]) + 1].min
end

puts edit_distance('cat', 'car')
puts edit_distance('cat', 'hey')
puts edit_distance('', 'c')
puts edit_distance('h', 'hio')
puts edit_distance('ciit', 'cat')
puts edit_distance('hello', 'elloh')
