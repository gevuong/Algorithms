### Hash Table: Things you need to know:
1. Runtime: On average, O(1) constant time lookup and insertion
2. Stores data in the form of a key (usually a string) associated with a value (usually of any data type).
3. Is a table of pre-determined length where each of the cells (or buckets) of the table holds a value.
4. Initialize with array of a pre-determined length, where each cell is a bucket.
5. Hashing function is used to hash a key and outputs an index to place value in the array.
6. To avoid collisions, each bucket is a linked list so if a new key-value is hashed to the same bucket, the new key-value will be attached to the end of the linked list in that bucket.

7. To retrieve data from a hash table,

### Setup constructor functions
1. Create a `hashTable` constructor function that takes in a `size` argument, with a `buckets` and `numBuckets` property assigned to a new array passing in `size` as an argument and length of `buckets`, respectively.
2. Create a `hashNode` constructor function that takes in three arguments: `key`, `value`, and `next`, with each argument assigned to three properties. The `next` property (which refers to the next node in its specific bucket) is assigned to the `next` argument, or `null` if there is no `next` argument passed in. The `next` property is meant to handle collisions. 

### insert method


### get method


### hash method (to hash keys)
