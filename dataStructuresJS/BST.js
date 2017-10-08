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
var BST = new BST(20);
BST.insert(29);
BST.insert(13);
console.log(BST);
