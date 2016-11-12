/* JavaScript programs to check if a binary tree is BST */

var intMax = 4294967296;
var intMin = -4294967296;

function Node(data) {
    this.data = data;
    this.left = null;
    this.right = null;    
}

function checkBinarySearchTree_(root) {
    return checkBinarySearchTree(root, intMin, intMax);
}

function checkBinarySearchTree(node, min, max) {
    if (node.data <= min || node.data >= max) {
        return false;
    }

    if (node.left === undefined && node.right === undefined) {
        return true;
    }

    var truth_left = true;
    if (node.left) {
        truth_left = checkBinarySearchTree(node.left, min, node.data);
    }

    var truth_right = true;
    if (node.right) {
        truth_right = checkBinarySearchTree(node.right, node.data, max);
    }

    return truth_left && truth_right;
}

/*
    valid tree
    input:
    2
    1 2 3 4 5 6 7
    expected: yes
*/

root = new Node(4)
root.left = new Node(2)
root.right = new Node(6)
root.left.left = new Node(1)
root.left.right = new Node(3)
root.right.left = new Node(5)
root.right.right = new Node(7)

var is_valid = checkBinarySearchTree_(root)
if (is_valid) {
    console.log("is valid BST");
} else {
    console.log("not valid BST");
}

/*
  invalid BST tree
  4
  2 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
  expected = No
*/
// level 0
root = new Node(16)

// level 1
root.left = new Node(8)
root.right = new Node(24)

// level 2
root.left.left = new Node(4)
root.left.right = new Node(12)
root.right.left = new Node(20)
root.right.right = new Node(28)

// level 3
root.left.left.left = new Node(2)
root.left.left.right = new Node(6)
root.left.right.left = new Node(10)
root.left.right.right = new Node(14)
root.right.left.left = new Node(18)
root.right.left.right = new Node(22)
root.right.right.left = new Node(26)
root.right.right.right = new Node(30)

// level 4
root.left.left.left.left = new Node(2)     // 2
root.left.left.left.right = new Node(3)    // 2
root.left.left.right.left = new Node(5)    // 6
root.left.left.right.right = new Node(7)   // 6
root.left.right.left.left = new Node(8)    // 10
root.left.right.left.right = new Node(11)  // 10
root.left.right.right.left = new Node(13)  // 14
root.left.right.right.right = new Node(15) // 14
root.right.left.left.left = new Node(17)   // 18
root.right.left.left.right = new Node(19)  // 18
root.right.left.right.left = new Node(21)  // 22
root.right.left.right.right = new Node(23) // 22
root.right.right.left.left = new Node(25)  // 26
root.right.right.left.right = new Node(27) // 26
root.right.right.right.left = new Node(29) // 30
root.right.right.right.right = new Node(31) // 30


var is_valid = checkBinarySearchTree_(root)
if (is_valid) {
    console.log("is valid BST");
} else {
    console.log("not valid BST");
}

