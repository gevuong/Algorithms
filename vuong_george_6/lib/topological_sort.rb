require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  queue = []
  in_edge_count = {}
  # Collect node with no in_edges
  vertices.each do |ver|
    queue << ver if ver.in_edges.empty?
    in_edge_count[ver] = ver.in_edges.length
  end

  out_arr = []
  until queue.empty?
    curr = queue.shift
    out_arr << curr
    curr.out_edges.each do |out_edge|
      to_vertex = out_edge.to_vertex
      in_edge_count[to_vertex] -= 1
      queue << to_vertex if in_edge_count[to_vertex] == 0
    end
  end
  out_arr
end
