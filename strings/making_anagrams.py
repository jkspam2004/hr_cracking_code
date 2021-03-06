'''
    Strings: Making Anagrams

    Given two strings, a and b, that may or may not be of the same length,
    determine the minimum number of character deletions required to make a and b
    anagrams.  Any characters can be deleted from the either of the strings

    Anagram: Two strings can be rearranged to match each other; both strings
    must contain the same exact letters with the same exact frequency.

    Input: two strings
    cde
    abc
    Output: total number of deletions for both strings to become anagrams
    4
    Remove d and e from cde to get c
    Remove a and b from abc to get c
'''

# store character counts into a dictionary of a list pair
def number_needed(a, b):
    char_count = {}

    # store count of characters from first string as first element of list
    for c in list(a):
        first = char_count[c][0] + 1 if c in char_count else 1
        char_count[c] = [first, 0]

    # store count of characters from second string as second element of list
    for c in list(b):
        first = char_count[c][0] if c in char_count else 0 # keep first element if exist
        second = char_count[c][1] + 1 if c in char_count else 1
        char_count[c] = [first, second]

    # the difference between counts of characters from first and second string
    # are the number of deletions needed to make anagram of the strings
    deletions = 0
    for c in char_count:
        deletions += abs(char_count[c][0] - char_count[c][1])
    
    #print(char_count)
    return deletions

a = input().strip()
b = input().strip()

print(number_needed(a, b))
