#!/usr/bin/perl
use strict;
use Data::Dumper;

=pod
    Strings: Making Anagrams

    Given two strings, a and b, that may or may not be of the same length,
    determine the minimum number of character deletions required to make a and b
    anagrams.  Any characters can be deleted from the either of the strings

    Anagram: Two strings can be rearranged to match each other; both strings
    must contain the same exact letters with the same exact frequency.

    Input: two strings
    Output: total number of deletions for both strings to become anagrams
=cut

my $a = <STDIN>;
chomp $a;
my $b = <STDIN>;
chomp $b;

# store character occurences in a nested structure: hash of array
# the array has 2 elements: element 1 is character count from first string, 
# and element 2 is the character count from the second string
# number of deletions to make strings anagrams is the absolute value of the difference
# between first and second character counts
sub making_anagrams {
    my ($first_str, $second_str) = @_;

    my @first_arr = split('', $first_str);
    my @second_arr = split('', $second_str);

    my $all_hash = {};

    # loop through characters in first string and store the character as the key  
    # and occurences of the character in first element of array set
    foreach my $item (@first_arr) {
        my $first = $all_hash->{$item}->[0] ? $all_hash->{$item}->[0] + 1 : 1;
        $all_hash->{$item} = [$first, 0];
    }

    # loop through characters in second string
    foreach my $item (@second_arr) {
        my $first = $all_hash->{$item}->[0] ? $all_hash->{$item}->[0] : 0;
        my $second = $all_hash->{$item}->[1] ? $all_hash->{$item}->[1] + 1 : 1;
        $all_hash->{$item} = [$first, $second];

    }

    print Dumper($all_hash) . "\n";
    my $deletions = 0;
    foreach my $letter (keys %$all_hash) {
        $deletions += abs($all_hash->{$letter}->[0] - $all_hash->{$letter}->[1]);
    }

    print $deletions . "\n";
    
}

&making_anagrams($a, $b);


