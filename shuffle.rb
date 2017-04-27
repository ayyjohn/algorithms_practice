# you are given an array and a random number generator, shuffle the array

# is there anything wrong with iterating over the array and just swapping
# each value with a random index upt to the end of the array? or would
# that result in disproportionately shuffled things.
# let's try

def shuffle(array)
  array.each_index do |idx|
    shuffle = rand(array.length)
    array[idx], array[shuffle] = array[shuffle], array[idx]
  end
  array
end

4.times do
  array = shuffle([1, 2, 3, 4, 5])
  p array
end
