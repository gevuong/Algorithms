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
var bst = new BST(50);
bst.insert(45);
bst.insert(55);
bst.insert(30);
bst.insert(20);
bst.insert(35);
bst.insert(54);
bst.insert(56);
bst.insert(47);
console.log(bst);
console.log(bst.left.left.right); // 35
console.log(bst.left.left.left); // 20
console.log(bst.right.left); // 55

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
console.log(bst.contains(35));
console.log(bst.contains(20));
console.log(bst.contains(21));


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
console.log(bst.depthFirstSearch(logValueFunc, 'in-order')); // values should logged from least to greatest
console.log(bst.depthFirstSearch(logValueFunc, 'pre-order'));
console.log(bst.depthFirstSearch(logValueFunc, 'post-order'));


// #breadthFirstSearch method (no recursion)
BST.prototype.breadthFirstSearch = function(logValueFunc) {
  queue = [this]; // initially stores root node
  while (queue.length > 0) {
    var treeNode = queue.shift() // store root node in treeNode
    logValueFunc(treeNode.value);
    if (treeNode.left) queue.push(treeNode.left)
    if (treeNode.right) queue.push(treeNode.right)
  }
}

console.log('bfs', bst.breadthFirstSearch(logValueFunc));


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
console.log('getMinVal', bst.getMinVal());
console.log('getMaxVal', bst.getMaxVal());
