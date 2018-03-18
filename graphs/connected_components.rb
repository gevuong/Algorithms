## DAY 16
# You are given a file which looks like so:

# AA BB
# DD FF
# CC EE
# EE DD
# Each line of the file contains a pair of strings. Each string represents is the name of a vertex. The line represents an edge connecting two vertices.

# Your task is to find the connected components of the graph. A connected component is a subset of vertices all connected to each other. In this example, the connected components are [["AA", "BB"], ["CC", "DD", "EE", "FF"]].

# You don't have to return the elements of the components in any particular order.
# def connected_components(lines)
#     # initialize hash with empty array as values to represent undirected graph
#     hash = Hash.new { |hash, key| hash[key] = [] }
#
#     # add undirected edges, where vertices are keys and its dependencies are values
#     lines.each do |line|
#         source, destination = line.split(" ")
#         hash[source].push(destination)
#         hash[destination].push(source)
#     end
#
#     p hash
#     components = []
#     until hash.empty?
#         component = []
#
#         first_key = hash.keys.first
#         queue = [first_key]
#         until queue.empty?
#             key = queue.shift
#             next if hash[key].nil?
#
#             neighbors = hash[key]
#             hash.delete(key)
#
#             component.push(key)
#             queue.concat(neighbors)
#         end
#     components.push(component)
#     end
#     # components
#     # components = []
#     # until hash.empty?
#     #     queue = [hash.first[0]]
#     #     sub_component = []
#
#     #     while queue.length > 0
#     #         visited = queue.shift
#     #         next if hash[visited].nil?
#
#     #         dependencies = hash[visited]
#     #         hash.delete(visited)
#
#     #         sub_component.push(visited)
#     #         queue.concat(dependencies)
#     #     end
#     #     components.push(sub_component)
#
#     # end
#     # components
#
# end
#
# def connected_components_2(lines)
#     # matrix = Hash.new { |hash, key| hash[key] = [] }
#
#     matrix = Hash.new { |hash, key| hash[key] = [] }
#     lines.each do |line|
#         v1, v2 = line.split(" ")
#         # matrix[v1] ||= []
#         matrix[v1] << v2
#         # matrix[v2] ||= []
#         matrix[v2] << v1
#     end
#
#     p matrix
#     components = []
#     until matrix.empty?
#         component = []
#
#         first_key = matrix.keys.first
#         queue = [first_key]
#         until queue.empty?
#             key = queue.shift
#             next if matrix[key].nil?
#
#             neighbors = matrix[key]
#             matrix.delete(key)
#
#             component.push(key)
#             queue.concat(neighbors)
#         end
#         components.push(component)
#     end
#     # components
# end


def connected_components_3(lines)
    # matrix = Hash.new { |hash, key| hash[key] = [] }

    hash = Hash.new { |hash, key| hash[key] = [] }
    # add undirected edges, where vertices are keys and its dependencies are values
    lines.each do |line|
        source, destination = line.split(" ")
        hash[source].push(destination)
        hash[destination].push(source)
    end
    # p hash

    matrix = {}
    lines.each do |line|
        v1, v2 = line.split(" ")
        matrix[v1] ||= []
        matrix[v1] << v2
        matrix[v2] ||= []
        matrix[v2] << v1
    end
    # p matrix

    return true if matrix == hash
    false

end


lines = [
    "AA BB",
    "DD FF",
    "CC EE",
    "EE DD"
   ]

paths = [
    "main.x thread.x",
    "main.x message.x",
    "thread.x message.x",
    "thread.x contact.x",
    "message.x contact.x"
    ]

# connected_components(lines)
# # p connected_components(paths)
connected_components_2(paths)

p connected_components_3(lines)
