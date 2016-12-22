#!/usr/bin/ruby

=begin
    Strings: Making Anagrams
  
    Given two strings, a and b, that may or may not be of the same length,
    determine the minimum number of character deletions required to make a and b
    anagrams.  Any characters can be deleted from the either of the strings
 
    Anagram: Two strings can be rearranged to match each other; both strings
    must contain the same exact letters with the same exact frequency.

    Input: two strings
    Output: total number of deletions for both strings to become anagrams
=end

def number_needed(a, b)
    first_arr = a.chars
    second_arr = b.chars

    char_count = {}
    for char in first_arr
        first = char_count.key?(char) ? char_count[char][0] + 1 : 1
        char_count[char] = [first, 0]  
    end

    for char in second_arr
        first = char_count.key?(char) ? char_count[char][0] : 0
        second = char_count.key?(char) ? char_count[char][1] + 1 : 1
        char_count[char] = [first, second]  
    end

    print char_count, "\n"

    deletions = 0
    for char in char_count.keys
        deletions += (char_count[char][1] - char_count[char][0]).abs
    end

    deletions
end

a = gets.strip
b = gets.strip

deletions = number_needed(a, b)
puts deletions


# chars - returns array of characters from string including spaces
# scan - returns characters without the spaces. ex: "This is the bee's knees".scan /\w/

=begin
    input:
    abccd
    aac

    output:
    4 
=end
