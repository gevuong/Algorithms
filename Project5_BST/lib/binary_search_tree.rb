# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    if !@root
      @root = BSTNode.new(value)
      return
    end

    BinarySearchTree.insert!(@root, value)
  end

  def find(value, tree_node = @root)
    BinarySearchTree.find!(tree_node, value)
  end

  def delete(value)
    @root = BinarySearchTree.delete!(@root, value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    BinarySearchTree.max(tree_node)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def depth(tree_node = @root)
    BinarySearchTree.height!(tree_node)
  end

  def is_balanced?(tree_node = @root)
    true
  end

  def in_order_traversal(tree_node = @root, arr = [])
    BinarySearchTree.inorder!(tree_node)
  end


  private
  # optional helper methods go here:
  def self.insert!(node, value)
    return BSTNode.new(value) unless node
    if value <= node.value
      node.left = self.insert!(node.left, value)
    else
      node.right = self.insert!(node.right, value)
    end
    node
  end

  def self.inorder!(node)
    return [] unless node
    BinarySearchTree.inorder!(node.left) +
    [node.value] +
    BinarySearchTree.inorder!(node.right)
  end

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value
    if value < node.value
      return self.find!(node.left, value)
    end
    return self.find!(node.right, value)
  end

  def self.height!(node)
    return -1 unless node
    1 + [self.height!(node.left), self.height!(node.right)].max
  end

  def self.max(node)
    return nil unless node
    return node unless node.right
    self.max(node.right)
  end

  def self.min(node)
    return nil unless node
    return node unless node.left
    self.min(node.left)
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left
    node.left = BinarySearchTree.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node
    if value < node.value

      node.left = self.delete!(node.left, value)
      # return node.left.left.right.value
    elsif value > node.value

      node.right = self.delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.left
      temp = node
      # p temp.right
      # node = temp.right
      node.right = BinarySearchTree.delete_min!(temp.right)

      node.left = temp.left
    end
    node
  end
end

BinarySearchTree.new
