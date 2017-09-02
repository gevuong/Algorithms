# Dynamic Programming

Today we'll learn a technique that combines an old tool, recursion, with a new idea, memoization. This topic relies heavily on recursion, so if you're feeling rusty, do these two readings first:

1. [Recursion Review](./recursion.md)
2. [Recursive Time Complexity](./recursive_time_complexity.md)

Then, get started with Dynamic Programming!

1. [Dynamic Programming - Reading](./dynamic_programming_1.md)
2. [Project](./dynamic_programming_2.md)


## Lecture
### Top Down
* Often referred to as 'memoization'
* Typical of recursive implementations that depend on solutions further down the chain
* Build your stacks and save work to a cache as you bubble up - subsequent calls to the same function within any given stack can pull the answer out of the cache without incurring more function calls.
* Don't incur extra function calls

### Bottom up
* Uses smaller solns as the basis of later/larger solutions
* Typical of iterative implementations
* Can use a cache as well, but builds it from the ground up without incurring extra function calls. 
