var LinkedList = function() {
  this.head = null; // head pointer
  this.tail = null; // tail pointer
}

var Node = function(value, next, prev) {
  this.value = value;
  this.next = next;
  this.prev = prev;
}

// 1. create newNode
// 2. if LL already has nodes, set head's previous pointer to newNode
// 3. if LL is empty, set tail pointer to newNode
// 4. regardless if LL was empty or not, assign head pointer to newNode
LinkedList.prototype.addToHead = function(value) {
  var newNode = new Node(value, this.head, null)
  if (this.head) this.head.prev = newNode;
  else this.tail = newNode; // if only node in LL.
  this.head = newNode;
}

var ll = new LinkedList();
ll.addToHead(100);
console.log('addFirstNode', ll);
ll.addToHead(200);
console.log('addSecondNode', ll);
ll.addToHead(300);
console.log('addThirdNode', ll);
