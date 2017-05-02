# Write a function that takes a year (a 4 digit integer) and returns an array with the 10 closest subsequent years
# that satisfy the following condition: The first two digits summed with the last two digits are equal to the
# middle two digits

# eg: 1978 => 19 + 78 = 97
# eg: 2307 => 23 + 07 = 30

def silly_years(year):
    year += 1
    silly_years = []
    while len(silly_years) < 10:
        if is_silly_year(year):
            silly_years.append(year)
        year += 1
    return silly_years

def is_silly_year(year):
    nums = list(str(year))
    first = int(''.join(nums[0:2]))
    second = int(''.join(nums[2:4]))
    inner = int(''.join(nums[1:3]))
    return first + second == inner

print(silly_years(1977))
print(silly_years(1000))
print(silly_years(2306))

# deductive solution: we're looking at 4 digit numbers, necessarily of the
# form 'abcd' (for example in 1987 a = 1 b = 9 c = 8 and d = 7). The first
# two digits plus the last two digits equal the middle two means that
# ab + cd = bc. But ab is really 10 * a + b as 87 is 8 * 10 + 7. So we
# reformulate and regroup to discover that a + d = -9 * (a - b + c).
# Now we've proven that a + d is a multiple of 9, and we also know that a and
# d, being digits, are between 0 and 9 inclusive, so a + d must also be between
# 0 and 18, and the only multiples of 9 within 0 and 18 are 0, 9, and 18.
# Since there's no year 0870 it can't be 0. It also can't be 18 since that would
# mean that a and d are both 9. The year 9bc9 would mean that 9b + 9c is at least
# 99, and we know that 9999 does not match the pattern that we're searching for.
# So now we've proven that a + d = 9 and that a - b + c = 1. Given the above,
# we can figure out what d and c must be once we know a and b. This means that
# there can be at most one silly year per century. On our input year we simply
# iterate up subsequent centuries to see if any of them have a silly year.
# A century tells us a and b, from which we can derive c and d, and if both c and d
# are between 0 and 9 then abcd is a silly year.
