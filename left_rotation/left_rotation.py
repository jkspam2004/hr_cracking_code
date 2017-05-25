'''
    Given an array of integers and a number, perform left rotations on the array. 
    Then print the updated array as a single line of space-separated integers.

    input:
    5 4
    1 2 3 4 5

    output:
    5 1 2 3 4 
'''

def array_left_rotation(a, n, k):
    k = -k  # rotate left is a negative offset
    
    while k < 0: # make it a positive offset
        k += n
        
    newlist = []
    for j in range(n):
        if j >= n-k: # handle the wrap-around, shifting off the end of array
            newlist.insert(j - (n-k), a[j])
        else:
            newlist.insert(j+k, a[j])
            
    return newlist
    
# n = length of the list, k = number of rotations to the left
n, k = map(int, input().strip().split(' '))
# a = integer list
a = list(map(int, input().strip().split(' ')))
answer = array_left_rotation(a, n, k);
print(*answer, sep=' ')


# list.insert(position, value)
# list.append(value)

