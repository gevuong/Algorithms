// constructor function
function BST(value) {
  this.value = value; // root node
  this.left = null;
  this.right = null;
}

// Remember, each node or element in BST is its own BST or sub-tree containing up to two children.

// #insert method (use recursion)
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
// test above code:
var bst = new BST(6);
bst.insert(4);
bst.insert(5);
bst.insert(2);
bst.insert(1);
bst.insert(3);
bst.insert(8);
bst.insert(7);
bst.insert(9);
console.log('----- test #insert method -----');
console.log(bst.left.left.right.value == 3);
console.log(bst.left.left.left.value == 1);
console.log(bst.right.left.value == 7);


// #contains method (use recursion)
BST.prototype.contains = function(value) {
  if (value == this.value) return true;
  if (value < this.value) {
    if (!this.left) return false;
    else return this.left.contains(value);
  }
  else if (value > this.value) {
    if (!this.right) return false;
    else return this.right.contains(value);
  }
}
// test above code:
console.log('----- test #contains method -----');
console.log(bst.contains(4) == true);
console.log(bst.contains(9) == true);
console.log(bst.contains(0) == false);


// #depthFirstSearch method
BST.prototype.depthFirstSearch = function(logValueFunc, order) {
  if (order == 'pre-order') logValueFunc(this.value)
  if (this.left)  this.left.depthFirstSearch(logValueFunc, order)
  if (order == 'in-order') logValueFunc(this.value)
  if (this.right) this.right.depthFirstSearch(logValueFunc, order)
  if (order == 'post-order') logValueFunc(this.value)
}

function logValueFunc(value) {
  console.log(value);
}
// test above code:
console.log('------ test #depthFirstSearch ------');
console.log('in-order');
bst.depthFirstSearch(logValueFunc, 'in-order'); // values should logged from least to greatest
console.log('pre-order');
bst.depthFirstSearch(logValueFunc, 'pre-order');
console.log('post-order');
bst.depthFirstSearch(logValueFunc, 'post-order');


// #breadthFirstSearch method (no recursion)
BST.prototype.breadthFirstSearch = function(logValueFunc) {
  queue = [this]; // initially stores root node
  while (queue.length) {
    var treeNode = queue.shift(); // store first node from queue in treeNode
    logValueFunc(treeNode.value);
    if (treeNode.left) queue.push(treeNode.left);
    if (treeNode.right) queue.push(treeNode.right);
  }
}
// test above code:
console.log('----- test #breadthFirstSearch ------');
bst.breadthFirstSearch(logValueFunc);


// #getMinVal method
BST.prototype.getMinVal = function() {
  if (!this.left) return this.value;
  else return this.left.getMinVal();
}
// #getMaxVal method
BST.prototype.getMaxVal = function() {
  if(!this.right) return this.value;
  else return this.right.getMaxVal();
}
// test above code:
console.log('----- test getMinVal, getMaxVal -------');
console.log('getMinVal', bst.getMinVal() == 1);
console.log('getMaxVal', bst.getMaxVal() == 9);
