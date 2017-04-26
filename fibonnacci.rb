# write a function fibs(num) which returns the first n elements of the
# fibonnacci sequence in an array. Do it recursively and iteratively.
# Time complexity: O(n) for both
def iterative_fibs(n)
  return [] if n == 0
  return [0] if n == 1
  fibs = [0, 1]
  until fibs.length == n
    fibs << fibs[-1]+ fibs[-2]
  end
  fibs
end

def recursive_fibs(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2
  previous = recursive_fibs(n - 1)
  previous << previous[-1] + previous[-2]
  previous
end
