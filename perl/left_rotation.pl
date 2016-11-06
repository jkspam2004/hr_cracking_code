#!/usr/bin/perl
use strict;

=pod
    left_rotation:
    Given an array of integers and a number, perform left rotations on the array.
    Then print the updated array as a single line of space-separated integers.

    input (shift left 4):
    5 4
    1 2 3 4 5

    output:
    5 1 2 3 4

=cut


my $n_temp = <STDIN>;
chomp($n_temp);
my @n_arr = split(/ /, $n_temp);
my $n = $n_arr[0]; # number of integers in the array
my $k = $n_arr[1]; # the number of rotations to shift left

my $a_temp = <STDIN>;
chomp($a_temp);
my @a = split(/ /, $a_temp); # the array

sub left_rotation {
    my $arr = shift;
    my $length = shift;
    my $shift = shift;

    $shift = -$shift; # rotating left is a negative offset

    # make the negative into a positive offset
    # i.e. shifting left 2 is equivalent to shifting right 3 for a 5 element array
    while ($shift < 0) {
        $shift += $length;
    }
 
    my $newarr = []; 
    for (my $i = 0; $i < $length; $i++) {
        if ($i >= $length - $shift) {
            # take care of wrapping around the other side of array
            @$newarr[$i - ($length - $shift)] = @$arr[$i];
        } else {
            # add the shift amount
            @$newarr[$i + $shift] = @$arr[$i];
        } 
    } 

    return $newarr;
}

my $newarr = &left_rotation(\@a, $n, $k); 
my $newstring = join(" ", @$newarr);
print $newstring . "\n";

