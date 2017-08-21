## Quicksort In-place

Refer to the videos for instructions on how to implement this method.

This project is shorter than most. It is **HIGHLY** recommended that you use your extra time to begin fixing your resumes, FSPs, and JS projects; applications start on Monday!!!


* Using n additional space, which is nlog(n) space. Worst case is n2 if you're only able to "knock off" one element at a time.

* Old quick sort (out of place) not the most efficient
* Base case: return arr if arr.length <= 1
* Pick a pivot element (usually the first)
* Make a sub-array of all elements less than the pivot_el
* Make a sub-array of all elements greater than the pivot_el
* Join recursive sort of L with pivot_el with recursive sort of R
* Average case is O(nlogn)

* The partition method returns the index at which the pivot element ended up so that we can make recursive calls.


* Space complexity: how much space we are taking up in memory as we are iterating or recursing.

* sub-linear means
* We have log(n) stacks
