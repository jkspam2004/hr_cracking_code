"""
    left_rotation: shift elements of an array to the left by given offset
    input:
    [1, 2, 3, 4, 5]
    output:
    [3, 4, 5, 1, 2] 
"""

class Solution(object):
    def left_rotation(self, arr, shiftBy):
        shiftBy = -shiftBy # turn it negative to make it rotate left

        while shiftBy < 0:
            shiftBy += len(arr) # make it positive for easier calculation

        newArr = [None] * len(arr)
        for idx, num in enumerate(arr):
            newArr[(idx + shiftBy) % len(arr)] = num

        return newArr

if __name__ == "__main__":
    s = Solution()
    arr = [1, 2, 3, 4, 5]
    offset = 2
    answer = s.left_rotation(arr, offset)
    print(arr)
    print(answer) # [3, 4, 5, 1, 2]
            

