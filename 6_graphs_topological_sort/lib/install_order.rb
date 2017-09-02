# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

def install_order(arr)
  max = 0
  vertices = {}
  arr.each do |tuple|
    #create the graph
    vertices[tuple[0]] = Vertex.new(tuple[0]) unless vertices[tuple[0]]
    vertices[tuple[1]] = Vertex.new(tuple[1]) unless vertices[tuple[1]]
    Edge.new(vertices[tuple[1]], vertices[tuple[0]])

    #reset max if needed
    max = tuple.max if tuple.max > max
  end

  # find missing packages
  independent = []
  (1..max).each do |i|
    independent << i unless vertices[i]
  end

  # sort vertices of graph and add missing packages
  independent + topological_sort(vertices.values).map(&:value) 
end
