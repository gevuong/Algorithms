# All packages will be listed, (independent packages have nil value or no entry for their dependencies), but the package ids are not numbers. Do not use your notes.

require_relative 'graph'

def install_order2(arr)
  vertices = {}
  arr.each do |tuple|
    dependent = tuple[0]
    dependency = tuple[1]

    vertices[dependent] = Vertex.new[dependent] unless vertices[dependent]
    vertices[dependency] = Vertex.new(dependency) if dependency && !vertices[dependency]
    Edge.new(vertices[dependency], vertices[dependent]) if dependency
  end
  topological_sort(vertices.values).map(&:value)
end

arr = [[3, 1], [2, 1], [6, 5],
    [3, 6], [3, 2], [4, 3],
    [9, 1], [1, nil], [5, nil]]

install_order2(arr)
