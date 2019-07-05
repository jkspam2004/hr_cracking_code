#!/usr/bin/ruby

=begin
  Given an array of integers and a number, perform left rotations on the array.
  Then print the updated array as a single line of space-separated integers.

  input:
  5 4
  1 2 3 4 5

  output:
  5 1 2 3 4 5
=end

n,k = gets.strip.split(' ')
n = n.to_i # length of array
k = k.to_i # offset
a = gets.strip # array
a = a.split(' ').map(&:to_i)

def array_left_rotation(arr, length, shiftBy)
    shiftBy = -shiftBy
    
    # add length until offset is positive
    while shiftBy < 0 do
        shiftBy += length
    end
    
    newlist = []
    for j in 0...length
        if j >= length - shiftBy # handle wrap-around
            newlist[j - (length - shiftBy)] = arr[j]
        else # shift by number of positions
            newlist[j + shiftBy] = arr[j]
        end
    end
    
    newlist
end

newlist = array_left_rotation(a, n, k)
print newlist.join(' '), "\n"
