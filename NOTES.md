# Data Structures and Algorithms

## Data Structures 
### Graph 
### Tree 
### Linked List 
### Array

## Graphs 
- A graph is a collection of nodes with edges connecting them.
- A tree is actually a type of graph, but not all graphs are trees.
- Directed edges (one-way street) or Undirected edges (two-way street)
- "Acyclic" graph is a graph without cycles 


1. Topological Sort 
  - Solution is not always unique. There can be multiple solutions to sorting a graph.

  1. Breadth First Search (Kahn's Algorithm)
    - Two data structures, visited queue, and sorted stack.
    - Queue tracks visited vertices and 
    - All vertices (or nodes) are initially unvisited
    - Select any unvisited vertex and begin traversal along one of its child nodes.
    - Continue traversing, and along the way, store visited vertex in a separate data structure.
    - When an unvisited vertex has no children, push said vertex onto stack.
    - Then work your way back to originally selected vertex, seeing if vertices traversed have any children, if not, push vertex to stack and continue working up to originally selected vertex. 


  2. Depth First Search (Tarjan's Algorithm) 
    - Time complexity: O(V + E), where V is number of vertices, and E is number of edges

## Tree vs Binary Tree vs Binary Search Tree
- Each tree has a root node. 
- Binary tree is a tree in which each node has up to two children.
- A node is called a "leaf" node if it has no children. 
- HTML DOM is a tree of nodes



## Techniques to Tackle Array or Linked List Problems
https://leetcode.com/articles/two-pointer-technique/
1. Two Pointer Technique
  - One slow-runner and one fast-runner.
  - Pointers can be set to whichever index is best to solve the problem at hand.

  Examples:
  1. reverse()
    - One pointer starts at the beginning, and other pointer starts at the end
    - Pointers move toward each other and values are swapped until they meet.
    - Time: O(n/2), only requires half of array length
    - Space: O(1), using in-place algorithm

  2. remove_duplicates()
    - Remove duplicates from sorted array in-place
    - One pointer (fast_runner) traverses length of array, while slow_runner only traverses when a unique element is found
    - Time: worst_case O(n)
    - Space: O(1), using in-place algorithm

  3. three_sum(arr, target) 
    - First sort array, O(nlogn) time
    - Three pointers: One at zero index, second on first index, and third at last index of array
    - First pointer iterates length of array, O(n). Subtract target by value at first pointer. 
    - Sum value at second and third pointer. If value < remaining target, shift second pointer to next larger value, elsif value > remainder, shift third pointer down to smaller value and sum again. 
    - Time: O(n^3/2)

  3. delete_node() 


  4. remove_nth_node_from_end_of_list()
    - One pointer starts at head of LL. Other pointer starts at n nodes from head of LL. Both pointers begin traversing LL until fast_runner reaches tail of LL. This means that slow_runner is at the nth node.

  5. 


2. Memoization

  Examples: 
  1. Longest Common Substring or Longest Common Subsequence 


## Algorithms
0. Depth First Search (DFS)
  - Used to traverse or search a **tree** or **graph** data structure.
  - Start at **root** (or some arbitrary root for a graph) and explore as far as possible along each branch before **backtracking**.

1. Dynamic Programming


1. In-place
  - Prevents allocation of extra space for another array. Results in **O(1)** extra memory.
  - Array is modified.




