### Things you need to know, BST.
1. Collection of nodes all connected together. Each node will have up to two child nodes, a left and right node.
2. Each node can hold any data type as a value.
3. All left nodes will be of lesser or equal value than their parent node. All right nodes will be greater than their parent node.
4. Each element/node is its own BST. Each node is basically a sub-tree. Each node is a root node with up to two children nodes.
5. Recursion is essential in BST, which is when a function calls itself until the base case is satisfied. Here is an example:

```
function factorial(num) {
  if (num === 1) return num;
  return num * factorial(num - 1);
}
```

### Setup constructor functions
1. Create a BST constructor function that takes in a `value` argument, and contains 3 properties: a `value` (which is the root node), and left and right child nodes that are initialized to `null`. All nodes are made with the BST constructor function.


### insert method (3 steps, 2 sets of conditions)
1. Create `insert` method in the prototype of BST, taking in a `value` argument. The `value` is used to make a new BST (or node) and is then placed in original BST at correct location.

- Consider two conditions:
2. If `value` is less than or equal to the value of the root node (hint: `this.value`):
* If `left` child does not exist, set `left` child to the value of the new instance of BST.
* Otherwise, if a `left` child does exist, run `insert` method on current `left` child passing in `value`.

3. If `value` greater than the value of the root node:
* and the `right` child node is empty, set `right` child to the value of the new instance of BST.
* Otherwise, if a `right` child does exist, run `insert` method on current `right` child passing in `value`.

- Test `insert` method before moving on.


### contains method (return true if BST contains a given value)
1. Create a `contains` method in the prototype of BST, taking in `value` as an argument.

- First condition to consider:
2. If root node is equal to `value`, `return true` to stop executing rest of code.

- Next conditions:
3. If `value` is less than current node (or `this.value`), and there is no `left` child, `return false`. This means BST does not contain value. However, if there is a `left` child, run `contains` method on `left` child passing in `value`.

4. If `value` is greater than current node, and there is no `right` child, `return false`. However, if there is a `right` child, run `contains` method on `right` child passing in `value`.

- Test `contains` method before moving on.


### depthFirstTraversal method (Requires 5 lines of code, each line being an if-statement)
- This method starts traversing at the top of BST, and travels through a single branch all the way to its bottom, before moving on to the next branch. The iterator function will run on each of the traversed nodes.
1. Create `depthFirstTraversal` method in the prototype of BST, taking in `iteratorFunc` and `order` as arguments.

#### Couple versions/orders in DFS:
**in-order**, most widely used version in practice, touches all nodes in BST in order from least to greatest.

1. If a `left` child exists, run `depthFirstTraversal` method passing in `iteratorFunc` and `order` as arguments.
2. If `order` is `in-order`, run `iteratorFunc` passing in `value` of root node. Remember that all nodes are its own BST with a root node, and up to two children nodes.
3. If there is a `right` child, run `depthFirstTraversal` method passing in `iteratorFunc` and `order` as arguments.

- To test order type in DFS,
1. Define `iteratorFunc` taking in a `value` argument that console logs each value. This will log the order in which DFS is traversing in BST.

### Do we really need `iteratorFunc` to properly implement DFS? Or is it primarily used to console log values to see how DFS traverses?

**pre-order** touches top node first, then operates as if `order` is `in-order`, touching left branch, then right branch.

- Assign new condition in first line of code:
1. If `order` is set to `pre-order`, run `iteratorFunc` on value of current node (or `this.value`).

**post-order** first touches lowest level of left branch, touching `left` children of each sub-tree, `right` children of each sub-tree, then parent node of each sub-tree. Then touches lowest level of right branch, touching `left` children of each sub-tree, `right` children of each sub-tree, then parent node of each sub-tree, finally reaching the top node of original BST. This type of `order` is great for safely deleting nodes from a BST because it starts from the lowest level and works its way up.

- Assign new condition in last line of code:
1. If `order` is set to `post-order`, run iteratorFunc on value of current node after the `left` and `right` children are processed.


### breadthFirstTraversal method
- Traverses BST level-by-level, beginning with top level. In practice, BFS is useful for defining a hierarchy or level of command, such as storing all employees of a company to determining who are in executive roles or subordinate roles.  

1. Create `breadthFirstTraversal` method in prototype of BST, taking `iteratorFunc` as an argument.
2. Define a `queue` to be an array that stores the root node. (i.e. `var queue = [this]`) **But why [this] and not [this.value]?** A `queue` implements FIFO, like waiting in line at a grocery store.
3. Run a `while` loop until `queue` is an empty array.
4. Run shift on `queue` and store value in `treeNode`.

- Consider condition:
5. If `treeNode` has a `left` child, push `left` child of `treeNode` into `queue`.
6. If `treeNode` has a `right` child, push `right` child of `treeNode` into `queue`.

- To test BFS:
1. Since we are passing nodes to the queue and not the value, alter `iteratorFunc` to take 'node' as an argument, and console log the value of the node.


### getMinVal method

### getMaxVal method


### Wrap Up
How BSTs are used in practice:
1. Used very often to store data because searching through, and retrieving data takes O(log n) time. LL takes O(n) time for searching, because in the worst case, "n" node may need to be searched to find the one you are looking for.
2. `insert` and `delete` data from a BST implements binary search.
- BST are most performant when balanced, meaning all or most nodes have a left and right child, so you have a full tree.
- Great data structure to implement a dictionary or phone book, or to store users of an application if users are stored by a numerical id, because through binary search, you can very quickly find a user you are looking for.
