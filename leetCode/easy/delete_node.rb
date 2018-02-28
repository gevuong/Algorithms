# TRICKY: Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.
#Cannot use this method if node to delete is the tail.
#
# Supposed the linked list is 1 -> 2 -> 3 -> 4 and you are given the third node with value 3, the linked list should become 1 -> 2 -> 4 after calling your function.

# Hint: Do not return anything, modify node in-place instead.
class Node
  attr_accessor :val, :next
  def initialize(val = nil)
    @val = val
    @next = nil
  end
end

# Implementation:
def delete_node(node)
  # set current node value to next node's value
  node.val = node.next.val
  # set current node's next pointer to the node after next node, thereby skipping the subsequent node.
  node.next = node.next.next
end
