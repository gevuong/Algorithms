# Graph

- A collection of nodes with edges connecting them.
- Directed edges (one-way street) or Undirected edges (two-way street)
- "Acyclic" graph is a graph without cycles 

[Insert Image]

- 
### Topological Sort 
- Only possible if and only if graph is directed, and acyclic.
- There can be more than one topological order per graph. 
- Time O(V+E), where V and E are number of vertices and edges respectively. 

Examples:
1. connected_components(matrix)
    - Print all subsets of connected components in an undirected graph. 
    - Undirected graph
    - can use BFS or DFS to solve.
 