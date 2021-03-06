- A hash or array data structure provides constant lookup time. 

## What is a Set? 
- A **Set** is an abstract data type (ADT) that can store unordered, unique items. 
- Uses Hash as storage, no indexing, and disregards insertion order.
- It is a hybrid of Array's intuitive inter-operation facilities and Hash's fast lookup.
- However, sets have fast retrieval time and can quickly look up the presence of values. 
- For example, #add and #include? are O(1) time.

- An ADT can be thought of as a high-level description of a structure and an API (i.e., a specific set of methods). Examples of ADTs are things like sets, maps, stacks, or queues.

- For more info: 
    - http://ruby-doc.org/stdlib-2.5.0/libdoc/set/rdoc/Set.html
    - https://spin.atomicobject.com/2012/09/04/when-is-a-set-better-than-an-array-in-ruby/




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

    3. pair_sum(arr, target)
        - Consider storing pairs in a Set to ensure uniqueness.
        - Time: O(n)

    3. three_sum(arr, target) 
        - First sort array, O(nlogn) time
        - Three pointers: One at zero index, second on first index, and third at last index of array
        - First pointer iterates length of array, O(n). Subtract target by value at first pointer. 
        - Sum value at second and third pointer. If value < remaining target, shift second pointer to next larger value, elsif value > remainder, shift third pointer down to smaller value and sum again. 
        - Time: O(n^3/2) according to wiki



  3. delete_node() 


  4. remove_nth_node_from_end_of_list()
    - One pointer starts at head of LL. Other pointer starts at n nodes from head of LL. Both pointers begin traversing LL until fast_runner reaches tail of LL. This means that slow_runner is at the nth node.

  5. 


### Algorithms 

1. In-place
  - Prevents allocation of extra space for another array. Results in **O(1)** extra memory.
  - Array is modified.