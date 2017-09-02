### Singly vs Doubly Linked List
- Singly: Each node only has access to its next node.
- Doubly: Each node has access to its previous and next node.


### Time Complexity
- `addHead`, `addTail`, `removeHead`, and `removeTail` are of **constant time, O(1)**. This is because the head and tail pointers are keeping track of the head and tail nodes in the list.  

- `search` is of **linear time, O(n)**.


### Use Cases
- Online gaming (i.e. poker, dominoes)
- Each player in a poker game can be a node object. There would be multiple pointers


### Why is a Linked List a more suitable data structure to use in lower-level programming?
- In memory storage, values may not always be stored all together. Having a linked list allows you to store values in different locations in memory. This is because each node object has properties that track where the next or previous node is, allowing node values to be scattered in memory. This is primarily why implementing a linked list is preferred. 
