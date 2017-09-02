var LinkedList = function() {
  this.head = null;
  this.tail = null;
}

var Node = function(value, next, prev) {
  this.value = value;
  this.next = next;
  this.prev = prev;
}

// 1. reassign head pointer to newNode
// 2. reassign newNode.prev to null
// 3. reassign newNode.next to this.head
LinkedList.prototype.addHead = function(value) {
  var newNode = new Node(value, this.head, null)
  if (this.head) {
    this.next = this.head;
  } else {
    this.head = null;
  }
  return newNode;
}

let ll = new LinkedList;
ll.addHead(100);
ll.addHead(200);
ll.addHead(300);
