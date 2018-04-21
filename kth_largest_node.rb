# O(n) proportional to k, each node is encountered once
def kth_largest_node(root, k)
    # keep a counter
    # keep reference to correct node

    kth_node = {counter: 0, current_node: n} # keeps all our data for us

    reverse_in_order(nth_node, root, k)
end


def reverse_in_order(nth_node, root, k)
    if kth_node[:count] < k && root
        if root.right
            kth_node = reverse_in_order(kth_node, root.right, k)
        end

        if kth_node[:count] < k
            kth_node[:count] += 1
            kth_node[:current_node] = root
        end
    end

    # ...on root.left
    if kth_node[:count] < k
    kth_node
end
