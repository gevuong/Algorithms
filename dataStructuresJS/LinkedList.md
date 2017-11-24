### Things you need to know, LL:
1. List of nodes linked together in a single file line.
2. Singly LL: Each node only has reference to its next node.
3. Doubly LL: Each node has reference to its previous and next node.
4. LL only needs to have a head and tail pointer/property to function correctly.
5. Each node contains three properties. Here are some examples:

`headNode => next => node => next => tailNode`
`headNode <= prev <= node <= prev <= tailNode`

```
node = {
  value: 7,
  next: nextNode,
  prev: prevNode
}

headNode = {
  value = 1,
  next: nextNode,
  prev: null
}

tailNode = {
  value: 3,
  next: null,
  prev: prevNode
}
```

### Setup constructor functions
1. Create a `LinkedList` constructor function, initially setting `this.head` and `this.tail` properties/pointers to `null` because there are no nodes in LL yet.
2. Create a `Node` constructor function that takes three arguments (val, prev, next), and assign the arguments to three properties (stated above) within the constructor function.


### #Create addToHead method (5 steps), O(1)
1. Create `addToHead` method to `LinkedList` prototype that takes a `value` argument. This is how you add a new method to `LinkedList` constructor function.
2. Create `newNode` to add to head of LL. Set `next` property to `this.head`, which will point to the old head node if there are already nodes in LL. If there are no nodes in LL, then `next` property is set to `null`. Because `newNode` is going to be the new head node, which means there are no nodes that come before it, set `prev` property to `null`.

- Now, consider two conditions:
3. If LL is not empty and `this.head` exists, which references to the old head node of LL, set previous pointer of old head node (hint: `this.head.prev`) to new head node.
4. However, if LL is empty and there are no nodes, set tail pointer to `newNode` because `newNode` will be the only node in the list.
5. Whether LL is empty or not, make sure the head is now referencing the new head node and not the old head node. Note: This line of code needs to be added after considering both conditions or else `this.head.prev` will be assigned to newNode.

- Test function and test cases in chrome dev tools before moving on.


### #addToTail method (5 easy steps), O(1)
- Similar to `addToHead`, try coding `addToTail` method.


### #removeHead method (6 steps, 2 sets of conditions), O(1)
1. Create `removeHead` function in `LinkedList` prototype, taking no arguments.

- Consider two conditions:
2. If LL is empty, or if there is no `this.head`, return `null` so rest of code is not executed.
3. Otherwise, if `this.head` exists, save head value in a variable to be later returned at end of function.
4. Now set `this.head` to be the old head node, using the next pointer of the current head node.

- The new head node assigned to `this.head` can be a node itself, or `null` if LL started with one node. Consider two conditions:
5. If there is a `head` present, set `prev` property to `null`. Otherwise, set `tail` property to `null`, meaning that LL is empty so both head and tail pointers are `null`.
6. Return value of head node (in Step 3) that is being removed.

### #removeTail method, O(1)
- Similar to `removeHead`, try coding `removeTail` method.


### #search method (use while loop), O(n)
1. Create `search` method as a prototype of `LinkedList`, taking in a `searchValue` argument.
2. Set `currentNode` equal to head property.
3. While `currentNode` exists, iterate through each node by setting `currentNode` to next node, and if `value` of `currentNode` is equal to `searchValue`, return `value` of `currentNode`.
4. After iterating through each node in LL and exiting while loop, return `null`.


### #indexOf method, O(n)
1. Create `indexOf` method by adding method to LinkedList constructor function, taking in a `searchValue` argument.
2. Set `indices` equal to empty array.
3. Set `currentNode` equal to head property.
4. Set `currentIndex` equal to 0 to begin iteration.
5. While `currentNode` exists, iterate through each node by setting `currentNode` to next node, increasing `currentIndex` count by 1. If `searchValue` is equal to currentNode's `value`, push `currentIndex` to `indices` array.
6. Return `indices` array.


### Time Complexity
- `addToHead`, `addToTail`, `removeHead`, and `removeTail` are of **constant time, O(1)**. This is because the head and tail pointers are keeping track of the head and tail nodes in the list.  

- `search` is of **linear time, O(n)**.


### Use Cases
- Online gaming (i.e. poker, dominoes)
- Each player in a poker game can be a node object. There would be multiple pointers


### Why is a Linked List a more suitable data structure to use in lower-level programming?
- In memory storage, values may not always be stored all together. Having a linked list allows you to store values in different locations in memory. This is because each node object has properties that track where the next or previous node is, allowing node values to be scattered in memory. This is primarily why implementing a linked list is preferred.
