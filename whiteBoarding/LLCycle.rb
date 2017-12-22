class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end

  # def self.cycle_check(node)
  #   marker1 = node
  #   marker2 = node
  #
  #   while marker2 != nil && marker2.next_node != nil
  #     marker1 = marker1.next_node
  #     marker2 = marker2.next_node.next_node
  #
  #     return true if marker1 == marker2
  #   end
  #
  #   false
  # end

  def self.cycle_check(head)
    marker1 = head
    marker2 = head

    while !marker2.nil? && !marker2.next_node.nil?
      marker1 = marker1.next_node
      marker2 = marker2.next_node.next_node

      return true if marker1 == marker2
    end
    false
  end

end

# a = Node.new('a')
# b = Node.new('b')
# c = Node.new('c')
#
# a.next_node = b
# b.next_node = c
# c.next_node = a
#
# p Node.cycle_check(a)
#
# x = Node.new('x')
# y = Node.new('y')
# z = Node.new('z')
#
# x.next_node = y
# y.next_node = z
#
# p Node.cycle_check(x)
