package Graph 
{
	import mx.collections.ArrayList;
	import mx.managers.layoutClasses.PriorityQueue;
	import mx.utils.ArrayUtil;
	/**
	 * ...
	 * @author Mountain Dew
	 */
	
	/* vertex_list contains all vertices in the graph */
	/* neighbor_list is an array of arrays, where the i-th inner array contains all out-edges of the
	 * i-th vertex */
	public class Graph 
	{
		private var vertex_list:ArrayList;
		private var neighbor_list:ArrayList;
		
		public function Graph() 
		{
			vertex_list = new ArrayList();
			neighbor_list = new ArrayList();
		}
		
		public function addVertex(v:Vertex)
		{
			vertex_list.addItem(v);
			neighbor_list.addItem(new ArrayList());
		}
		
		private function getItemIndexByVertex(list:ArrayList, v:Vertex) {
			for (var i:int = 0; i < list.length; i++) {
				if (v.equals(list[i])) {
					return i;
				}
			}
			
			return -1;
		}
		
		private function getItemIndexByEdge(list:ArrayList, e:DirectedEdge) {
			for (var i:int = 0; i < list.length; i++) {
				if (v.equals(list[i])) {
					return i;
				}
			}
			
			return -1;
		}
		
		public function addDirectedEdge(edge:DirectedEdge)
		{
			//Add source to vertex_list
			var source:Vertex = edge.getSource();
			var source_index:int = getItemIndexByVertex(vertex_list, source);
			if (source_index != -1)
			{
				var neighbors:ArrayList = (ArrayList) (neighbor_list.getItemAt(source_index));
			}
			else {
				vertex_list.addItem(source);
				var neighbors:ArrayList = new ArrayList();
				neighbors_list.addItem(neighbors);
			}
			
			//Add edge to subarray of neighbors_list
			var edge_index:int = getItemIndexByEdge(neighbors, edge);
			if (edge_index == -1)
			{
				neighbors.addItem(edge);
			}
			else {
				neighbors[edge_index] = edge;
			}
			
			//Add source to vertex_list
			var destination:Vertex = edge.getDestination();
			var destination_index:int = getItemIndexByVertex(vertex_list, destination);
			if (destination_index != -1)
			{
				vertex_list.addItem(destination);
				var neighbors:ArrayList = new ArrayList();
				neighbors_list.addItem(neighbors);
			}
		}
		
		public function getNeighbors(v:Vertex):ArrayList
		{
			var source_index:int = vertex_list.getItemIndexByVertex(v);	
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
		
		/**
		* Implements A-star on our graph with a Euclidean distance heuristic. We look for soughtVertex from the vertices
		* stored in the searchQueue
		*/
		private function findDestination(final_destination:Vertex, frontier:PriorityQueue, 
										  observed_vertices:ArrayList,
										  follow_list:ArrayList):Tuple
		{
			while (!frontier.isEmpty()) 
			{
				var vertex_edge_and_distance:Tuple = frontier.removeSmallest();
				var destination_vertex = vertex_edge_and_distance[0];
				var edge:DirectedEdge = vertex_edge_and_distance[1];
				var distance:Number = vertex_edge_and_distance[2];
				
				if (getItemIndexByVertex(observed_vertices, destination_vertex) == -1) {
					follow_list.addItem(edge);
					observed_vertices.addItem(destination_vertex);
					
					if (final_destination.equals(destination_vertex)) {
						return new Tuple(observed_vertices, follow_list);
					}
					else {
						var neighbor_edges:ArrayList = this.getNeighbors(destination_vertex);
						var path_distance:Number = distance - final_destination.distanceTo(destination_vertex);
						
						for (var i:int = 0; i < neighbor_edges.length; i++) 
						{
							var neighbor_edge:DirectedEdge = (DirectedEdge) (neighbor_edges.getItemAt(i));
							var new_destination_vertex = neighbor_edge.getDestination();
							var new_distance:Number = path_distance + neighbor_edge.getWeight() + final_destination.distanceTo(new_destination_Vertex);
							
							frontier.addObject(new Tuple(new_destination_vertex, neighbor_edge, new_distance), new_distance);
						}
					}
				}
			}
			
			return new Tuple(null, null);
		}
		
		private function getPathFromFollowList(observed_vertices:ArrayList, follow_list:ArrayList):ArrayList
		{
			var check_index:int;
			var path = new ArrayList();
			var edge = follow_list[follow_list.length - 1];
			
			while (edge != null) {
				path.push(edge);
				source = edge.getSource();
				check_index = getItemIndexByVertex(observed_vertices, source);
				edge = follow_list[check_index];
			}
			
			return path.reverse();
		}
		
		/* We return an edge list detailing the shortest path from vertex a to vertex b. If a and b are not connected
		 * we return null 
		 */
		public function getShortestPath(a:Vertex, b:Vertex):ArrayList 
		{
			if (b.equals(a))
				return null;
			else 
			{
				var search_queue:PriorityQueue = new PriorityQueue();
				var distance = b.distanceTo(a);
				search_queue.addObject(new Tuple(a, null, distance), b.distanceTo(a));
				var result = findDestination(b, searchQueue, new ArrayList());
				var observed_vertices = result[0];
				var follow_list = result[1]
				
				if (follow_list != null) {
					getPathFromFollowList(observed_vertices, follow_list);
				}
				else {
					return null;
				}
			}
		}
	}
}