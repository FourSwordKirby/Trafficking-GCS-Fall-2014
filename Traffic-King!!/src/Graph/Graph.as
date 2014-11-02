package Graph 
{
	import mx.collections.ArrayList;
	import mx.managers.layoutClasses.PriorityQueue;
	import mx.utils.ArrayUtil;
	/**
	 * ...
	 * @author Mountain Dew
	 */
	public class Graph 
	{
		private var vertex_list:ArrayList;
		private var neighbor_list:ArrayList;
		private var edge_list:ArrayList;
		
		public function Graph() 
		{
			vertex_list = new ArrayList();
			neighbor_list = new ArrayList();
			edge_list = new ArrayList();
		}
		
		public function addVertex(v:Vertex)
		{
			vertex_list.addItem(v);
			neighbor_list.addItem(new ArrayList());
		}
		
		public function addDirectedEdge(edge:DirectedEdge)
		{
			var source_index:int = vertex_list.getItemIndex(edge.getSource());	
			if (source_index != -1)
			{
				var neighbors:ArrayList = (ArrayList) (neighbor_list.getItemAt(source_index));
				if (neighbors.getItemIndex(edge.getDestination()) == -1)
				{
					neighbors.addItem(edge);
				}
			}
			edge_list.addItem(edge);
		}
		
		public function getNeighbors(v:Vertex):ArrayList
		{
			var source_index:int = vertex_list.getItemIndex(v1);	
			if (source_index != -1)
			{
				return new ArrayList((ArrayList) (neighbor_list.getItemAt(source_index)).toArray());
			}
			return null;
		}
		
		public function getVertices():ArrayList 
		{
			return new ArrayList(vertex_list.toArray());
		}
		
		/* We return an edge list detailing the shortest path from vertex a to vertex b. If a and b are not connected
		 * we return null 
		 */
		public function getAllShortestPaths(a:Vertex):ArrayList 
		{
			var search_queue:PriorityQueue = new PriorityQueue();
			var neighbor_edges:ArrayList = this.getNeighbors(a);
					
			for (var i:int = 0; i < neighbor_edges.length; i++) 
			{
				var neighbor_edge:DirectedEdge = (DirectedEdge) (neighbor_edges.getItemAt(i));
				var distance = neighbor_edge.getWeight();
				
				frontier.addObject(new Tuple(neighbor_edge, distance), distance);
			}
			
			return getFollowList(searchQueue, new ArrayList(), new ArrayList());
		}
		
		private function getFollowList(frontier:PriorityQueue, follow_list:ArrayList, observed_vertices:ArrayList):ArrayList
		{
			while (!frontier.isEmpty()) 
			{
				var edge_and_distance:Tuple = frontier.removeSmallest();
				var edge:DirectedEdge = edge_and_distance[0];
				var destination_vertex:Vertex = edge.getDestination();
				var distance:int = edge_and_distance[1];
				
				if (observed_vertices.getItemIndex(destination_vertex) == -1) {
					follow_list.addItem(edge);
					observed_vertices.addItem(destination_vertex);
					
					var neighbor_edges:ArrayList = this.getNeighbors(destination_vertex);
					
					for (var i:int = 0; i < neighbor_edges.length; i++) 
					{
						var neighbor_edge:DirectedEdge = (DirectedEdge) (neighbor_edges.getItemAt(i));
						var new_distance = distance + neighbor_edge.getWeight();
						
						frontier.addObject(new Tuple(neighbor_edge, new_distance), new_distance);
					}
				}
			}
			
			return follow_list;
		}
		
		/* We return an edge list detailing the shortest path from vertex a to vertex b. If a and b are not connected
		 * we return null 
		 */
		public function getShortestPath(a:Vertex, b:Vertex):ArrayList 
		{
			if (a.equals(b))
				return null;
			else 
			{
				var search_queue:PriorityQueue = new PriorityQueue();
				search_queue.addObject(a, 0);
				return findDestination(b, 0, searchQueue, new ArrayList());
			}
		}
	
		/**
		* Implements BFS on our graph. We look for soughtVertex from the vertices
		* stored in the searchQueue
		*/
		private function findDestination2(destination:Vertex, current_distance:int, frontier:PriorityQueue, observed_vertices:ArrayList):ArrayList
		{
			while (!frontier.isEmpty()) 
			{
				var vertex_seeker:Vertex = (Vertex) frontier.removeSmallest();
				
				observed_vertices.addItem(vertexSeeker);
				
				var potential_edges:ArrayList = this.getNeighbors(vertex_seeker);
				/*
				* searches the current array of edges for one that leads to our sought
				* after vertex
				*/
				for (var i:int = 0; i < potential_edges.length; i++) 
				{
					var considered_edge:DirectedEdge = (DirectedEdge) (potential_edges.getItemAt(i));
					if (destination.equals(considered_edge.getDestination))
						return current_distance + considered_edge.getWeight();
					/*
					* if the current vertex we are considering is not the one we
					* are looking for we make sure to check his list of neighbors
					* at some point
					*/
					if(observed_vertices.getItemIndex(considered_edge.getSource()) == -1)
						frontier.enqueue(considered_vertex);
				}				
			}
		}
	}
}