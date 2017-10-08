// constructor function
function BST(value) {
  this.value = value; // root node
  this.left = null;
  this.right = null;
}

// every node or element in BST is considered its own BST that can contain up to two children
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
console.log(bst.right.left.left); // => 59
console.log(bst.left.right.left); // => 35
console.log(bst.right.right); // => 100


// #contains method
BST.prototype.contains = function(value) {
  if (value === this.value) return true;
  if (value < this.value) {
    if (!this.left) return false;
    else return this.left.contains(value);
  }
  else if (value > this.value) {
    if (!this.right) return false;
    else return this.right.contains(value);
  }
}

// test above case:
console.log(bst.contains(50));
console.log(bst.contains(60));
console.log(bst.contains(45));
console.log(bst.contains(108));
