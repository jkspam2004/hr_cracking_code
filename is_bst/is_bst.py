# Python program to check if a binary tree is BST or not

"""
a binary search tree is a binary tree with the following ordering properties:

    The value of every node in a node's left subtree is less than the data value of that node.
    The value of every node in a node's right subtree is greater than the data value of that node.

Given the root node of a binary tree, can you determine if it's also a binary search tree? 
"""

 
INT_MAX = 4294967296
INT_MIN = -4294967296

# Node is defined as
class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

def check_binary_search_tree_(root):
    return check_binary_search_tree(root, INT_MIN, INT_MAX)
    
def check_binary_search_tree(node, min, max):
    #print("min=", min, "max=", max, "node=", node.data)
    if (node.data <= min or node.data >= max):
        return False
    
    if (node.left is None and node.right is None):
        #print("leaf node", node.data)
        return True
    
    truth_left = True
    if (node.left):
        #print("root.left=", node.left.data, "root=", node.data )
        truth_left = check_binary_search_tree(node.left, min, node.data)
      
    truth_right = True
    if (node.right):
        #print("root.right=", node.right.data, "root=", node.data )
        truth_right = check_binary_search_tree(node.right, node.data, max)
        
    return truth_left and truth_right

"""
  valid tree
  2
  1 2 3 4 5 6 7
  expected = yes
"""
root = Node(4)
root.left = Node(2)
root.right = Node(6)
root.left.left = Node(1)
root.left.right = Node(3)
root.right.left = Node(5)
root.right.right = Node(7)

is_valid = check_binary_search_tree_(root)
if is_valid:
    print("is valid BST")
else:
    print("not valid BST")


"""
invalid BST tree
4
2 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
expected = No
"""
# level 0
root = Node(16)

# level 1
root.left = Node(8)
root.right = Node(24)

# level 2
root.left.left = Node(4)
root.left.right = Node(12)
root.right.left = Node(20)
root.right.right = Node(28)

# level 3
root.left.left.left = Node(2)
root.left.left.right = Node(6)
root.left.right.left = Node(10)
root.left.right.right = Node(14)
root.right.left.left = Node(18)
root.right.left.right = Node(22)
root.right.right.left = Node(26)
root.right.right.right = Node(30)

# level 4
root.left.left.left.left = Node(2)     # 2
root.left.left.left.right = Node(3)    # 2
root.left.left.right.left = Node(5)    # 6
root.left.left.right.right = Node(7)   # 6
root.left.right.left.left = Node(8)    # 10
root.left.right.left.right = Node(11)  # 10
root.left.right.right.left = Node(13)  # 14
root.left.right.right.right = Node(15) # 14
root.right.left.left.left = Node(17)   # 18
root.right.left.left.right = Node(19)  # 18
root.right.left.right.left = Node(21)  # 22
root.right.left.right.right = Node(23) # 22
root.right.right.left.left = Node(25)  # 26
root.right.right.left.right = Node(27) # 26
root.right.right.right.left = Node(29) # 30
root.right.right.right.right = Node(31) # 30

is_valid = check_binary_search_tree_(root)
if is_valid:
    print("is valid BST")
else:
    print("not valid BST")


