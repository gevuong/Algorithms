var LinkedList = function() {
  this.head = null;
  this.tail = null;
}

var Node = function(value, next, prev) {
  this.value = value;
  this.next = next;
  this.prev = prev;
}

LinkedList.prototype.addToHead = function(value) {
  var newNode = new Node(value, this.head, null);
  if (this.head) this.head.prev = newNode;
  else this.tail = newNode;
  this.head = newNode;
}

// To test code above:
// var ll = new LinkedList();
// ll.addToHead(100);
// console.log('addFirstNode', ll);
// ll.addToHead(200);
// console.log('addSecondNode', ll);
// ll.addToTail(300);
// console.log('addThirdNode', ll);

// console.log('ll.tail.prev'); // => 100
// console.log('ll.tail.prev.prev'); // => 200
// console.log('ll.head.next.next'); // => 300

// /* removeHead:
// 1. Set head pointer to the current head's nextNode.
// 2. If LL only has one node, set head to null.
// 3. If LL has multiple nodes, set this.head
// */
// LinkedList.prototype.removeHead = function() {
//   if (!this.head) return null;
//   var val = this.head.value;
//   this.head = this.head.next; // now we have a new head node
//   if (this.head) this.head.prev = null;
//   else this.tail = null;
//   return val;
// }
//
// var ll = new LinkedList();
// ll.addToHead(1);
// ll.addToHead(2);
// ll.addToTail(3);
//
// console.log(ll.removeHead());
// console.log(ll.removeHead());
