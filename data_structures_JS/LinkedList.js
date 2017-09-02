var LinkedList = function() {
  this.head = null; // head pointer
  this.tail = null; // tail pointer
}

var Node = function(value, next, prev) {
  this.value = value;
  this.next = next;
  this.prev = prev;
}

/* addToHead method:
1. create newNode
2. Set head pointer to newNode
2. If LL has nodes, set that head's previous pointer to newNode
3. If LL is empty, set tail pointer to newNode
*/
LinkedList.prototype.addToHead = function(value) {
  var newNode = new Node(value, this.head, null);
  this.head = newNode;
  if (this.head) this.head.prev = newNode;
  else this.tail = newNode;
}

// Will first reassigning this.head to newNode affect the remaining code in function?
LinkedList.prototype.addToTail = function(value) {
  var newNode = new Node(value, null, this.tail);
  this.tail = newNode;
  if (this.tail) this.tail.next = newNode;
  else this.head = newNode;
}

// var ll = new LinkedList();
// ll.addToHead(100);
// console.log('addFirstNode', ll);
// ll.addToHead(200);
// console.log('addSecondNode', ll);
// ll.addToTail(300);
// console.log('addThirdNode', ll);

/* removeHead:
1. Set head pointer to the current head's nextNode.
2. If LL only has one node, set head to null.
3. If LL has multiple nodes, set this.head
*/
LinkedList.prototype.removeHead = function() {
  if (!this.head) return null;
  var val = this.head.value;
  this.head = this.head.next; // now we have a new head node
  if (this.head) this.head.prev = null;
  else this.tail = null;
  return val;
}

var ll = new LinkedList();
ll.addToHead(1);
ll.addToHead(2);
ll.addToTail(3);

console.log(ll.removeHead());
console.log(ll.removeHead());
