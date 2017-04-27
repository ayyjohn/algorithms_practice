# Write a method that reads in a file of integers, one per line, and sums them up. skip the line
# if it begins with a comment (#)

def sum_from_file(filename):
    total = 0
    with open(filename) as file:
        for line in file:
            if line[0] != '#':
                total += int(line.strip())
    return total
print(sum_from_file('./test.txt'))
