#!/usr/bin/perl
use strict;
use Data::Dumper;

our $INT_MAX = 4294967296;
our $INT_MIN = -4294967296;

package Node {
    sub new {
        my $class = shift;
        my $args = shift;
        my $self = {%$args};

        $self->{data} = $args->{data};
        $self->{left} = undef;
        $self->{right} = undef;

        bless $self, $class;
        return $self;
    }
}
1;

sub check_binary_search_tree_ {
    my $root = shift;

    return &check_binary_search_tree($root, $INT_MIN, $INT_MAX);
}

sub check_binary_search_tree {
    my $node = shift;
    my $min = shift;
    my $max = shift;

    if ($node->{data} <= $min || $node->{data} >= $max) {
        return 0;
    }

    if (!$node->{left} && !$node->{right}) {
        return 1;
    }

    my $truth_left = 1;
    if ($node->{left}) {
        $truth_left = &check_binary_search_tree($node->{left}, $min, $node->{data});
    }
    my $truth_right = 1;
    if ($node->{right}) {
        $truth_right = &check_binary_search_tree($node->{right}, $node->{data}, $max);
    }

    return $truth_left && $truth_right;
}

# valid BST
my $node = Node->new({ data => 4 });
$node->{left} = Node->new({ data => 2 });
$node->{right} = Node->new({ data => 6 });
$node->{left}->{left} = Node->new({ data => 1 });
$node->{left}->{right} = Node->new({ data => 3 });
$node->{right}->{left} = Node->new({ data => 5 });
$node->{right}->{right} = Node->new({ data => 7 });

print Dumper($node);

my $is_valid = &check_binary_search_tree_($node);
if ($is_valid) {
    print "is valid BST\n";
} else {
    print "not valid BST\n";
}

=pod
    invalid BST tree
    4
    2 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
    expected = No
=cut

# level 0
my $root = Node->new({ data => 16 });

# level 1
$root->{left} = Node->new({ data => 8 });
$root->{right} = Node->new({ data => 24 });

# level 2
$root->{left}->{left} = Node->new({ data => 4 });
$root->{left}->{right} = Node->new({ data => 12 });
$root->{right}->{left} = Node->new({ data => 20 });
$root->{right}->{right} = Node->new({ data => 28 });

# level 3
$root->{left}->{left}->{left} = Node->new({ data => 2 });
$root->{left}->{left}->{right} = Node->new({ data => 6 });
$root->{left}->{right}->{left} = Node->new({ data => 10 });
$root->{left}->{right}->{right} = Node->new({ data => 14 });
$root->{right}->{left}->{left} = Node->new({ data => 18 });
$root->{right}->{left}->{right} = Node->new({ data => 22 });
$root->{right}->{right}->{left} = Node->new({ data => 26 });
$root->{right}->{right}->{right} = Node->new({ data => 30 });

# level 4
$root->{left}->{left}->{left}->{left} = Node->new({ data => 2 });      # 2
$root->{left}->{left}->{left}->{right} = Node->new({ data => 3 });     # 2
$root->{left}->{left}->{right}->{left} = Node->new({ data => 5 });     # 6
$root->{left}->{left}->{right}->{right} = Node->new({ data => 7 });    # 6
$root->{left}->{right}->{left}->{left} = Node->new({ data => 8 });     # 10
$root->{left}->{right}->{left}->{right} = Node->new({ data => 11 });   # 10
$root->{left}->{right}->{right}->{left} = Node->new({ data => 13 });   # 14
$root->{left}->{right}->{right}->{right} = Node->new({ data => 15 });  # 14
$root->{right}->{left}->{left}->{left} = Node->new({ data => 17 });    # 18
$root->{right}->{left}->{left}->{right} = Node->new({ data => 19 });   # 18
$root->{right}->{left}->{right}->{left} = Node->new({ data => 21 });   # 22
$root->{right}->{left}->{right}->{right} = Node->new({ data => 23 });  # 22
$root->{right}->{right}->{left}->{left} = Node->new({ data => 25 });   # 26
$root->{right}->{right}->{left}->{right} = Node->new({ data => 27 });  # 26
$root->{right}->{right}->{right}->{left} = Node->new({ data => 29 });  # 30
$root->{right}->{right}->{right}->{right} = Node->new({ data => 31 }); # 30

print Dumper($root);

$is_valid = check_binary_search_tree_($root);

if ($is_valid) {
    print "is valid BST\n";
} else {
    print "not valid BST\n";
}

