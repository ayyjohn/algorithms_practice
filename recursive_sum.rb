# write a function that takes an array of numbers and returns the sum
# use recursion.

# Time complexity: O(n) where n is the length of the array.
def sum(array)
  return 0 if array.empty?
  sum(array.drop(1)) + array.first
end
