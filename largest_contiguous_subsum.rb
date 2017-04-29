# Write a function largest_contiguous_subsum that
# takes in an array of integers (positive and negative) and returns the
# largest sum of any block of numbers in a row. You can solve this in O(n**2) 
# time trivially but attempt to get it in O(n) time and O(1) space.

# Naive solution: Iterate over the array twice O(n**2) time where n is the length
# of the array, and O(n) space. At each point, slice the array and take the sum.
# edge cases to consider: empty array, array of all negative numbers

def largest_contiguous_subsum(array)
  return 0 if array.empty?
  max = -Float::INFINITY
  array.length.times do |i|
    (i + 1).upto(array.length) do |j|
      subsum = array[i...j].inject(:+)
      max = subsum if subsum > max
    end
  end
  max
end

puts largest_contiguous_subsum([1, 2, 3])
puts largest_contiguous_subsum([])
puts largest_contiguous_subsum([-1, -2, -3])
puts largest_contiguous_subsum([8, 9, -7, -50, 19, 1, -2])
puts largest_contiguous_subsum([-1, -9, -2, -8, -1])
puts ''
# More optimized solution: keep a running max sum as you iterate through
# the array. If at any point it becomes negative, you've hit the
# maximum value for what you were iterating over, and you should
# reset the sum to 0.

def largest_contiguous_subsum(array)
  sum = 0
  max = array.first || 0
  array.each do |el|
    sum += el
    max = sum if sum > max
    sum = 0 if sum < 0
  end
  max
end

puts largest_contiguous_subsum([1, 2, 3])
puts largest_contiguous_subsum([])
puts largest_contiguous_subsum([-1, -2, -3])
puts largest_contiguous_subsum([8, 9, -7, -50, 19, 1, -2])
puts largest_contiguous_subsum([-1, -9, -2, -8, -1])

