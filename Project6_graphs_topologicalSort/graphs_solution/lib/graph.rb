class Vertex
  attr_reader :value, :in_edges, :out_edges

  def initialize(value)
    @value = value 
    @in_edges = [] # in_edges represents the vertex's dependencies (should be called "dependencies" instead)
    @out_edges = [] # out_edges represents whether other vertex's have self.value as a dependency
    # for example: if given [[1, nil], [5, nil], [9, 1], [4, 5]]. 
    # first element = dependent, second element = dependency. As you can see, 1 and 5 have no dependencies, so in_edges is empty. No other vertices depend on 9 and 4, so its @out_edges is empty.
  end
end

class Edge
  attr_reader :to_vertex, :from_vertex, :cost

  # from_vertex => dependent (i.e. 9 and 4)
  # to_vertex => dependency (i.e. 1 and 5)
  def initialize(from_vertex, to_vertex, cost = 1)
    self.from_vertex = from_vertex
    self.to_vertex = to_vertex
    self.cost = cost

    to_vertex.in_edges << self
    from_vertex.out_edges << self
  end

  def destroy!
    self.to_vertex.in_edges.delete(self)
    self.to_vertex = nil
    self.from_vertex.out_edges.delete(self)
    self.from_vertex = nil
  end

  protected
  attr_writer :from_vertex, :to_vertex, :cost
end
