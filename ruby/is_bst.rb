#!/usr/bin/ruby

$intMax = 4294967296
$intMin = -4294967296

class Node
    attr_accessor :data, :left, :right

    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end
end 

def check_binary_search_tree_(root)
    check_binary_search_tree(root, $intMin, $intMax)
end

def check_binary_search_tree(node, min, max)
    # data out of bounds
    if node.data <= min || node.data >= max
        return false
    end

    # leaf node
    if node.left == nil && node.right == nil
        return true
    end

    # check left branch
    truth_left = true
    if node.left
        truth_left = check_binary_search_tree(node.left, min, node.data)
    end

    # check right branch
    truth_right = true
    if node.right
        truth_right = check_binary_search_tree(node.right, node.data, max)
    end

    return truth_left && truth_right
end

=begin
    valid tree
    input:
    2
    1 2 3 4 5 6 7
    expected: yes
=end

root = Node.new(4)
root.left = Node.new(2)
root.right = Node.new(6)
root.left.left = Node.new(1)
root.left.right = Node.new(3)
root.right.left = Node.new(5)
root.right.right = Node.new(7)

is_valid = check_binary_search_tree_(root)
if is_valid
    puts "is valid BST"
else
    puts "not valid BST"
end

=begin
  invalid BST tree because of duplicate 2
  4
  2 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
  expected = No
=end

root = nil

# level 0
root = Node.new(16)

# level 1
root.left = Node.new(8)
root.right = Node.new(24)

# level 2
root.left.left = Node.new(4)
root.left.right = Node.new(12)
root.right.left = Node.new(20)
root.right.right = Node.new(28)

# level 3
root.left.left.left = Node.new(2)
root.left.left.right = Node.new(6)
root.left.right.left = Node.new(10)
root.left.right.right = Node.new(14)
root.right.left.left = Node.new(18)
root.right.left.right = Node.new(22)
root.right.right.left = Node.new(26)
root.right.right.right = Node.new(30)

# level 4
root.left.left.left.left = Node.new(2)     # 2
root.left.left.left.right = Node.new(3)    # 2
root.left.left.right.left = Node.new(5)    # 6
root.left.left.right.right = Node.new(7)   # 6
root.left.right.left.left = Node.new(8)    # 10
root.left.right.left.right = Node.new(11)  # 10
root.left.right.right.left = Node.new(13)  # 14
root.left.right.right.right = Node.new(15) # 14
root.right.left.left.left = Node.new(17)   # 18
root.right.left.left.right = Node.new(19)  # 18
root.right.left.right.left = Node.new(21)  # 22
root.right.left.right.right = Node.new(23) # 22
root.right.right.left.left = Node.new(25)  # 26
root.right.right.left.right = Node.new(27) # 26
root.right.right.right.left = Node.new(29) # 30
root.right.right.right.right = Node.new(31) # 30

is_valid = check_binary_search_tree_(root)
if is_valid
    puts "is valid BST"
else
    puts "not valid BST"
end

