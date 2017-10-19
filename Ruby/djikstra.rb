# In a directed graph, what are the properties of a node?
# - Whether it is the root node, or the end.
# - The nodes it can go to (and the distances between them?)
# - The distance from the root

# This would be interesting to implement with a database, 
# with a standard table representing the nodes and a self-join table with distance values
# representing the vertices.

# Note to self: The lowest calculated distance determines the next node you visit
# You only visit a node once it's confirmed that the path to it is calculated
# to be the shortest. 

# Remember that this algorithm is GREEDY. Meaning it will always go for the mathematically
# shortest option even if it 'looks' roundabout

# The signifance of "visited" nodes is that you already have found the shortest path to them
 

class Node
  
  def initialize
    @distance = Float::INFINITY
    
  end

  attr_accessor :distance
end