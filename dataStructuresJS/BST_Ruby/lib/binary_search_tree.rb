# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  # tree_node means any sub-tree root. Because remember, every node is its own BST with a root node, adnd up to two children.
  
  # in order to run #insert method recursively, set another argument equal to @root. That way, each value of left and right children of root node can be compared to value.
  def insert(value, tree_node = @root)
    return @root = BSTNode.new(value) if tree_node.nil?
    if value <= tree_node.value
      !tree_node.left ? tree_node.left = BSTNode.new(value) : insert(value, tree_node.left)
    elsif value > tree_node.value
      !tree_node.right ? tree_node.right = BSTNode.new(value) : insert(value, tree_node.right)
    end
  end

  # return THE NODE that has `value`, not the value itself
  def find(value, tree_node = @root)
    return tree_node if tree_node.value == value
    if value < tree_node.value
      !tree_node.left ? nil : find(value, tree_node.left)
    elsif value > tree_node.value
      !tree_node.right ? nil : find(value, tree_node.right)
    end
  end


  def delete(value)
    return nil if find(value, tree_node = @root)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return nil if !tree_node
    return tree_node if !tree_node.right
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

end
