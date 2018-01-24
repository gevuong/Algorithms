# All packages will be listed, (independent packages have nil value or no entry for their dependencies), but the package ids are not numbers. Do not use your notes.

require_relative 'graph'
require_relative 'topological_sort'

def install_order2(arr)
  # use hash to store adjacency list to represent graph
  vertices = {}
  arr.each do |tuple|
    dependent = tuple[0]
    dependency = tuple[1]

    # Each vertex (or node) stores a list of adjacent vertices. In an undirected graph (two-way street), an edge (a, b) is stored twice: once in a's adjacent vertices and once in b's adjacent vertices.
    vertices[dependent] = Vertex.new(dependent) unless vertices[dependent]
    vertices[dependency] = Vertex.new(dependency) if dependency && !vertices[dependency]

    # if there is a dependency (i.e. a = tuple[0] and b = tuple[1], then edge (a, b) is created)
    # dependent => from_vertex
    # dependency => to_vertex
    Edge.new(vertices[dependency], vertices[dependent]) if dependency
  end
  vertices[1]
  # topological_sort(vertices.values).map(&:value)
end

# as you can see, these test cases are all arrays. But input may be given as a hash
arr = [[3, 1], [2, 1], [6, 5],
    [3, 6], [3, 2], [4, 3],
    [9, 1], [1, nil], [5, nil]]

    path = [
      ["main.x", "thread.x"],
      ["main.x", "message.x"],
      ["thread.x", "message.x"],
      ["thread.x", "contact.x"],
      ["message.x", "contact.x"],
      ["contact.x", nil]
    ]   

    # works in this case
lines = [
          ["DD", "FF"],
          ["FF", nil],
          ["CC", "EE"],
          ["EE", "DD"]
        ]
# p install_order2(arr) == [1, 5, 2, 9, 6, 3, 4] # I think that's the answer
# p install_order2(arr) == ["contact.x", "message.x", "thread.x", "main.x"] # I think that's the answer
p install_order2(arr) 
# p install_order2(path) 
# p install_order2(lines) 
