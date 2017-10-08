// constructor function
function BST(value) {
  this.value = value; // root node
  this.left = null;
  this.right = null;
}

// every node or element in BST is considered a sub-tree that can contain up to two children
// #insert method
BST.prototype.insert = function(value) {
  if (value <= this.value) {
    if (!this.left) this.left = new BST(value);
    else this.left.insert(value);
  }
  else if (value > this.value) {
    if (!this.right) this.right = new BST(value);
    else this.right.insert(value);
  }
}

// Test above case:
var bst = new BST(50);
bst.insert(30);
bst.insert(70);
bst.insert(100);
bst.insert(60);
bst.insert(59);
bst.insert(20);
bst.insert(45);
bst.insert(35);
bst.insert(85);
bst.insert(105);
bst.insert(10);
console.log(bst); // not very helpful
console.log(bst.right.left.left); // => 59
console.log(bst.left.right.left); // => 35
console.log(bst.right.right); // => 100
