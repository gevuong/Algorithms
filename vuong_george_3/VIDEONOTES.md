# Priority Queues (Heaps Part 1)
* How to determine importance of certain processes and tasks, similar to boarding a flight. There are different tiers: priority, gold, silver, bronze

### Proposed solution: Create a Linked List or an Array
* To insert a gold tier into the list, change points to the gold node in the correct spot in the list. This is a O(n) time operation because it requires a check of each node to find out where it needs to be. We can do better.

* Use LRU cache which hold pointers that identify the start of each tier in a hash.
Ex: { bronze: ..., silver: ..., gold: ...}. This wouldn't be efficient because we would essentially be creating an extra data structure that replicates the linked list. This does not have to be that complicated.  

* If we stored nodes in an array, insert node to end of array, and then sort, it would take nlog(n) time, which is best case. Which is inefficient.

* To solve this, implement data structures: min-Heap and Binary Heap



# Understanding Heaps (Heaps Part 2) Particularly minHeap and BinaryHeap
* Priority queue and heaps are used interchangeably
* Heaps as data structures are related to priority queues.

### Heaps will have 3 public methods (aside from initialize):
* #peek (min/max), intended to return the minimum priority in the heap. Lets us know what the smallest integer in data structure. Needs to be in constant time.
* #insert (#push), has to put integer in appropriate place in heap, while following priority queue. Has to be better than linear time.
* #extract (#pop), Returns minimum value in data structure in #peek, but also removes integer from data structure entirely.

## What is a Heap?
* A binary tree that follows certain constraints. A parent has two children, and each child has two children.
* A full binary tree means every spot has a node. Heap is not worried about having a full binary tree, but more about completeness, meaning working towards a full tree.
* To implement completeness, if you add a new node, it would have to be connected to a child from left to right. Cannot have any gaps, or skipping of node spots.

### Heap Constraints
* Must be a complete tree.
* Must satisfy min-Heap property. For each node, its parent needs to be less than or equal to its child. Must be >= its parent.

### The Heapifying Process
* Swapping of values when comparing child value with its parent. A parallel assignment.
* #PEEK, just looks at minimum of Heap, just by looking at root node, which is what we have access to.
* #INSERT, At each level of a Heap, we are doubling the number of nodes that can exist on that level. Meaning we are going to have a logarithmic number of levels. For insert, we will have O(log(n)).
* #EXTRACT, swap largest value with the smallest value. Then compare the largest value at the top of tree with its children. O(log(n))


# Implementation (Heaps Part 3)

## How to store binary tree into array
* To find children of parent: 2i + 1 and 2i + 2, where i is value of parent
* To find parent of children: (i - 1)/2, where i is value of child
* #peek: the root element, which is the min element will always be constant time
* #insert: add element to end of array, find parent and swap with parent if element < parent.
* #extract: Swap min element with value in tail element at index -1. Then pop last element in array. And then the largest element at the beginning of array is compared with each element using min-heap. And this will sort array.


# Heap Sort Intro
* Always going to run O(log(n)) time.
* Can be done in place without needing to duplicate input array multiple times, which creates a linear time complexity. 
* Heapify
* Insertion is a log(n), meaning it's nlog(n). So is extraction.



# Heap Sort (In Place)
* Very stable sorting algorithm. Worst case, is nlog(n). Merge sort is also nlog(n), but it's not in place, so it uses quite a bit of extra space as it goes. So if space is limited, heap sort is the preferred sort algorithm.

## Heapify left to right
* Implement Max Heap instead of min-heap: Parents need to be larger than its children. Move heap one placement to the right, compare last value within heap with its parent, and if it is larger, then swap larger value with smaller value.

## Extract right to left
* Swap largest value at beginning of array with the last element in array. Every time you swap and it becomes sorted, move the heap range, and continue the heapifying process.
