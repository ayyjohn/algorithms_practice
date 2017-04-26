# Write a function that takes a string as an input. It should return true
# if and only if the input is a valid ipv4 address, ie follows the pattern
# n.n.n.n where 0 <= n <= 255

# This can be done by splitting the thing on periods and coverting elements
# to numbers to check if they're between 0 and 255 inclusive.
# to remove any other string inputs we can check to ensure that it matches the
# n.n.n.n pattern with a quick regex.

def valid_ip?(string)
  return false unless string =~ /^\d+(\.\d+){3}$/
  nums = string.split('.').map(&:to_i)
  nums.all? { |num| num >= 0 && num <= 255 }
end
