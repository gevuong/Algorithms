# You are given a file which looks like so:

# lines = [
#         "AA BB",
#         "DD FF",
#         "CC EE",
#         "EE DD"
#        ]

# Each line of the file contains a pair of strings. Each string represents the name of a vertex. The line represents an edge connecting two vertices.
# Your task is to find the connected components of the graph. A connected component is a subset of vertices all connected to each other. In this example, the connected components are [["AA", "BB"], ["CC", "DD", "EE", "FF"]].
# You don't have to return the elements of the components in any particular order.
lines = File.readlines("file.txt")

matrix = {}
lines.each do |line|
  v1, v2 = line.split(" ")
  matrix[v1] ||= []
  matrix[v1] << v2
  matrix[v2] ||= []
  matrix[v2] << v1
end

components = []
until matrix.empty?
  component = []

  first_key = matrix.keys.first
  queue = [first_key]
  until queue.empty?
    key = queue.shift
    next unless matrix.has_key?(key)
    neighbors = matrix.delete(key)

    component << key
    queue.concat(neighbors)
  end

  components << component
end

p components
# def connected_components(lines)
#     matrix = {}
#     lines.each do |line|
#     v1, v2 = line.split(" ")
#     matrix[v1] ||= []
#     matrix[v1] << v2
#     matrix[v2] ||= []
#     matrix[v2] << v1
#     end

#     components = []
#     until matrix.empty?
#         component = [] 
#         first_key = matrix.keys.first 
#         queue = [first_key]
#         until queue.empty?
#             key = queue.shift 
#             if  matrix.has_key?(key)
#                 neighbor = matrix.delete(key) # neighbor is assigned to value of corresponding key
#             else 
#                 next # skip iteration if matrix does not contain key
#             end 
#             component << neighbor

#         end 
#         components << component

#     end 
#     components
# end 

# p connected_components(lines)

# In this solution, we start by reading in the file. We will represent our graph as a hash in which the keys represent each vertex, and the values are an array of their connections (the other vertices).

# From there, we can generate a list of connected components by traversing our hash. We start by taking an arbitrary key from our hash and breadth first searching for connected vertices. We start a queue as well as an array representing our component. We search outwards, adding each key to the component and deleting it from the hash as we encounter it. We then add its neighbors to the queue. When our queue is empty, we've finished our current component, and check the next key in our hash to grab the next component.

# return the order in which files should be concatenated together

# def sorted_imports(root = "main.x", path)
#     return root if path[root].empty?

#     # initialize queue with root's children
#     children = path[root]
#     queue = []
#     children.each do |child|
#         queue.push(child) 
#     end 

#     ordered_files = [] 
#     until queue.empty?
#         key = queue.shift 
#         dependencies = path[key]
#         if dependencies 
#             dependencies.each { |child| queue.push(child) } 
#         elsif dependencies.empty?
#             ordered_files.push(key)
#         end 
#     end 
#     ordered_files
# end 


# path = {
#             "main.x": ["thread.x", "message.x"],
#             "thread.x": ["message.x", "contact.x"],
#             "message.x": ["contact.x"],
#             "contact.x": [],
#         }

# sorted_imports("main.x", path) == ["contact.x", "message.x", "thread.x", "main.x"]