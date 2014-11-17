package Graph 
{
	import mx.collections.ArrayList;
	//import mx.managers.layoutClasses.PriorityQueue;
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
		private var vertex_list:Array;
		private var neighbor_list:Array;
		
		public function Graph() 
		{
			vertex_list = [];
			neighbor_list = [];
		}
		
		public function addVertex(v:Vertex)
		{
			vertex_list.push(v);
			neighbor_list.push([]);
		}
		
		private function getItemIndexByVertex(list:Array, v:Vertex) {
			for (var i:int = 0; i < list.length; i++) {
				if (v.equals(list[i])) {
					return i;
				}
			}
			
			return -1;
		}
		
		private function getItemIndexByEdge(list:Array, e:DirectedEdge) {
			for (var i:int = 0; i < list.length; i++) {
				if (e.equals(list[i])) {
					return i;
				}
			}
			
			return -1;
		}
		
		public function addDirectedEdge(edge:DirectedEdge)
		{
			trace(1);
			//Add source to vertex_list
			var source:Vertex = edge.getSource();
			var source_index:int = getItemIndexByVertex(vertex_list, source);

			if (source_index != -1)
			{
				var neighbors:Array = neighbor_list[source_index];
			}
			else {
				vertex_list.push(source);
				var neighbors:Array = [];
				neighbor_list.push(neighbors);
			}
			
			//Add edge to subarray of neighbors_list
			var edge_index:int = getItemIndexByEdge(neighbors, edge);
			if (edge_index == -1)
			{
				neighbors.push(edge);
			}
			else {
				neighbors[edge_index] = edge;
			}
			
			//Add destination to vertex_list
			var destination:Vertex = edge.getDestination();
			var destination_index:int = getItemIndexByVertex(vertex_list, destination);
			
			if (destination_index == -1)
			{
				vertex_list.push(destination);
				neighbor_list.push([]);
			}
		}
		
		public function getNeighbors(v:Vertex):Array
		{
			var source_index:int = getItemIndexByVertex(vertex_list, v);	
			if (source_index != -1)
			{
				return neighbor_list[source_index].concat();
			}
			return null;
		}
		
		public function getVertices():Array 
		{
			return vertex_list.concat();
		}
		
		/**
		* Implements A-star on our graph with a Euclidean distance heuristic. We look for soughtVertex from the vertices
		* stored in the searchQueue
		*/
		private function findDestination(final_destination:Vertex, frontier:PriorityQueue, 
										  observed_vertices:Array,
										  follow_list:Array):Array
		{
			while (!frontier.isEmpty()) 
			{
				var vertex_edge_and_distance = frontier.removeSmallest();
				trace(vertex_edge_and_distance[0]);
				var destination_vertex = (Vertex) (vertex_edge_and_distance[0]);
				var edge = vertex_edge_and_distance[1];
				var distance:Number = vertex_edge_and_distance[2];
				
				if (getItemIndexByVertex(observed_vertices, destination_vertex) == -1) {
					follow_list.push(edge);
					observed_vertices.push(destination_vertex);
					
					if (final_destination.equals(destination_vertex)) {
						return [observed_vertices, follow_list];
					}
					else {
						var neighbor_edges:Array = this.getNeighbors(destination_vertex);
						var path_distance:Number = distance - final_destination.distanceTo(destination_vertex);
						
						for (var i:int = 0; i < neighbor_edges.length; i++) 
						{
							var neighbor_edge:DirectedEdge = (DirectedEdge) (neighbor_edges[i]);
							var new_destination_vertex = neighbor_edge.getDestination();
							var new_distance:Number = path_distance + neighbor_edge.getWeight() + final_destination.distanceTo(new_destination_vertex);
							
							frontier.addObject([new_destination_vertex, neighbor_edge, new_distance], new_distance);
						}
					}
				}
			}
			
			return [null, null];
		}
		
		private function getPathFromFollowList(observed_vertices:Array, follow_list:Array):Array
		{
			var source:Vertex;
			var check_index:int;
			var path = [];
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
		public function getShortestPath(a:Vertex, b:Vertex):Array
		{
			if (b.equals(a))
				return null;
			else 
			{
				var search_queue:PriorityQueue = new PriorityQueue();
				var distance = b.distanceTo(a);
				search_queue.addObject([a, null, distance], b.distanceTo(a));
				var result = findDestination(b, search_queue, [], []);
				
				var observed_vertices = result[0];
				var follow_list = result[1]
				
				if (follow_list != null) {
					return getPathFromFollowList(observed_vertices, follow_list);
				}
				else {
					return null;
				}
			}
		}
	}
}