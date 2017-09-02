
### Time Complexity
- `addHead`, `addTail`, `removeHead`, and `removeTail` are of **constant time, O(1)**. This is because the head and tail pointers are keeping track of the head and tail nodes in the list.  

- `search` is of **linear time, O(n)**.

### Use Cases
- Online gaming (i.e. poker, dominoes)

### Why is a Linked List a more suitable data structure to use in low-level programming?
- When dealing with memory storage, you may not be able to store all elements together in memory. Having a linked list allows you to store values in different locations in memory. Each node object has a property that tracks where the next or previous node is, allowing scattered distribution of each node in the linked list. 
