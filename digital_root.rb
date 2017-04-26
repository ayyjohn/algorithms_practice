# Write a method, digital_root(num). It should sum the digits of
# a positive number. If the resulting sum is greater than or equal to 10
# sum the digits of the resulting number. Keep repeating until there is
# only one digit in the resulting sum. This is the digital root
# do not use string conversion.

# Naive solution: Two functions, a helper function that div-mods a number, and
# a higher level function that repeats this until the result is less than
# 10.

# Time complexity: The step function runs O(n/10) because it'll need to go
# another time for each factor of 10 that increases (once for every number
# to div-mod off).  The digital_root function itself is somewhat similar
# to the collatz sequence  in that it's almost impossible to generalize
# the output as a function  of the size of the number because it has more
# to do with the specific number. For example 99 would run twice,
# 99 => 18 => 9, but 10000000 would run only once. Thus, something like O(n).

def digital_root(num)
  root = digital_root_step(num)
  while root >= 10
    root = digital_root_step(root)
  end
  root
end

def digital_root_step(num)
  total = 0
  while num > 0
    total += num % 10
    num = num / 10
  end
  total
end

puts digital_root(9)
puts digital_root(10)
puts digital_root(82)
puts digital_root(0)

# Recursive solution: One digital root step is equivalent to
# the number mod 10 + the number divided by 10 and floored. Therefore
# we can recursively call that combination of operations and stop
# when the input is less than 10.

# Time complexity: Following Scott's FFS algorithm the function has
# 5 constant time operations per iteration, not counting the recursive
# call, and counting return as one since either it will return
# num or the recursive call.
# The function is called n / 10 times approximately because of the
# num // 10 call. Finally, summing, that comes out to n/2 time complexity
# which finalizes to O(n).

def digital_root_recursive(num)
  return num if num < 10
  digital_root_recursive((num % 10) + (num / 10))
end

puts digital_root_recursive(9)
puts digital_root_recursive(10)
puts digital_root_recursive(82)
puts digital_root_recursive(0)

# Tricky solution using mod 9

# Time complexity: Constant (assuming modulo ~ contant) or O(n) assuming
# modulo is O(n), I've heard both arguments. The constant factor is 6. 

def digital_root_quick(num)
  return 9 if num % 9 == 0 && num != 0
  num % 9
end

puts digital_root_quick(9)
puts digital_root_quick(10)
puts digital_root_quick(82)
puts digital_root_quick(0)
