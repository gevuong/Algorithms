# Given a binary tree, find its maximum depth.
# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

  # Definition for a binary tree node.
  # class TreeNode
  #     attr_accessor :val, :left, :right
  #     def initialize(val)
  #         @val = val
  #         @left, @right = nil, nil
  #     end
  # end

# O(n) space, where n is depth of tree
# O(n) time, where n is the number of branches and it checked every branch once. Every node in the tree is visited.
def max_depth(root)
  return 0 if root.nil?

  # when leaf node is reached, left_depth and right_depth initially returns 0
  left_depth = max_depth(root.left)
  right_depth = max_depth(root.right)

  # [0, 0].max + 1 = 1, and 1 is passed to one level above leaf node
  [left_depth, right_depth].max + 1
end

# Notes: The height and depth of a root have different meanings. Depth is distance from root, and height is distance from deepest accessible leaf node. For example, At node 3: depth is 1 and height is 3. At Node 1.5: depth is 4 and height is 0. AT node 5, depth is 0 and height is 4.

#############################
 # prefilled_bst looks like: #
 #             (5)           #
 #            /   \          #
 #          (3)   (7)        #
 #         /  \      \       #
 #      (1)   (4)    (9)     #
 #     /   \            \    #
 #   (0)   (2)          (10) #
 #        /                  #
 #      (1.5)                #
 #############################

 # For more info (height of BT): https://www.youtube.com/watch?v=_SiwrPXG9-g
