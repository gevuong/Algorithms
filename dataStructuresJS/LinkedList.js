// create constructor function
function LinkedList() {
  this.head = null;
  this.tail = null;
}

function Node(value, next, prev) {
  this.value = value;
  this.next = next;
  this.prev = prev;
}


// #addToHead function
LinkedList.prototype.addToHead = function(value) {
  var headNode = new Node(value, this.head, null);
  if (!this.head) this.tail = headNode;
  else this.head.prev = headNode;
  this.head = headNode;
}
// #addToTail function
LinkedList.prototype.addToTail = function(value) {
  var tailNode = new Node(value, null, this.tail);
  if (!this.tail) this.head = tailNode;
  else if (this.tail) this.tail.next = tailNode;
  this.tail = tailNode;
}
// test above code
console.log('----- test #addToHead -----');
var LL = new LinkedList();
LL.addToHead(3);
LL.addToHead(2);
LL.addToHead(2);
LL.addToHead(1);
console.log(LL);
console.log('----- test #addToTail -----');
LL.addToTail(4);
LL.addToTail(4);
LL.addToTail(5);
LL.addToTail(6);
console.log(LL);


// #removeHead function
LinkedList.prototype.removeHead = function() {
  if (!this.head) return null;
  let removedHeadVal = this.head.value;
  this.head = this.head.next; // this.head is either a node or null
  if (!this.head) this.tail = null; // if null, set tail to null
  else this.head.prev = null;
  return removedHeadVal;
}
// #removeTail function
LinkedList.prototype.removeTail = function() {
  if (!this.tail) return null;
  let removedTailVal = this.tail.value;
  this.tail = this.tail.prev; // because we're removing tail
  if (this.tail) this.tail.next = null;
  else this.head = null;
  return removedTailVal;
}
// test above code
console.log('----- test #removeHead -----');
console.log(LL.removeHead() === 1);
console.log(LL.removeHead() === 2);
console.log(LL);
console.log('----- test #removeTail -----');
console.log(LL.removeTail() === 6);
console.log(LL.removeTail() === 5);
console.log(LL);


// #search function
LinkedList.prototype.search = function(searchValue) {
  let currentNode = this.head;
  while (currentNode) {
    if (searchValue === currentNode.value) return currentNode.value;
    currentNode = currentNode.next;
  }
  return null;
}
// test above code
console.log('----- test #search -----');
console.log(LL.search(3));
console.log(LL.search(2));
console.log(LL.search(6));


// #indexOf function
LinkedList.prototype.indexOf = function(searchValue) {
  let currentNode = this.head;
  let indices = [];
  let currentIndex = 0;
  while (currentNode) {
    if (searchValue === currentNode.value) indices.push(currentIndex);
    currentIndex++;
    currentNode = currentNode.next;
  }
  return indices;
}
// test above code:
console.log('----- test #indexOf -----');
console.log(LL);
console.log(LL.indexOf(3));
console.log(LL.indexOf(4));
console.log(LL.indexOf(0));
