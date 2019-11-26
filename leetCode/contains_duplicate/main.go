package main

import "fmt"

// Given an array of integers, find if the array contains any duplicates.

// Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

// Example 1:

// Input: [1,2,3,1]
// Output: true

// Example 2:

// Input: [1,2,3,4]
// Output: false

// Example 3:

// Input: [1,1,1,3,3,4,3,2,4,2]
// Output: true

func main() {
	fmt.Println(containsDuplicate([]int{1, 2, 3, 1}) == true)
	fmt.Println(containsDuplicate([]int{1, 2, 3, 4}) == false)
	fmt.Println(containsDuplicate([]int{1, 1, 1, 3, 3, 4, 3, 2, 4, 2}) == true)
}

func containsDuplicate(nums []int) bool {
	// initialize map to store count
	m := make(map[int]int)
	// loop array and increment count in map
	for _, v := range nums {
		m[v]++
	}

	for _, v := range m {
		if v > 1 {
			return true
		}
	}

	return false
}
