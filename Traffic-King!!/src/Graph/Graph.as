package Graph 
{
	import mx.collections.ArrayList;
	import mx.utils.ArrayUtil;
	import org.flixel.*;
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
		
		public function addVertex(v:Vertex):void
		{
			vertex_list.push(v);
			neighbor_list.push([]);
		}
		
		private function getItemIndexByVertex(list:Array, v:Vertex):int {
			for (var i:int = 0; i < list.length; i++) {
				if (v.equals(list[i])) {
					return i;
				}
			}
			
			return -1;
		}
		
		private function getItemIndexByEdge(list:Array, e:DirectedEdge):int {
			for (var i:int = 0; i < list.length; i++) {
				if (e.equals(list[i])) {
					return i;
				}
			}
			
			return -1;
		}
		
		public function addDirectedEdge(edge:DirectedEdge):void
		{
			//Add source to vertex_list
			var source:Vertex = edge.getSource();
			var source_index:int = getItemIndexByVertex(vertex_list, source);
			
			var neighbors:Array;
			
			if (source_index != -1)
			{
				neighbors = neighbor_list[source_index];
			}
			else {
				vertex_list.push(source);
				neighbors = [];
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
		
		public function getVertex(X:int, Y:int):Vertex
		{
			var checkVertex:Vertex = new Vertex(X, Y);
			
			for (var i:int = 0; i < vertex_list.length; i++)
			{
				if (checkVertex.equals(vertex_list[i]))
				{
					return vertex_list[i];
				}
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
		* 
		* Returns a tuple with the observed vertices as the 1st element and the follow list as the 2nd.
		*/
		private function findDestination(final_destination:Vertex, frontier:PriorityQueue, 
										  observed_vertices:Array,
										  follow_list:Array):Array
		{
			while (!frontier.isEmpty()) 
			{
				var vertex_edge_and_distance = frontier.removeSmallest();
				var destination_vertex:Vertex = (Vertex) (vertex_edge_and_distance[0]);
				var edge:DirectedEdge = vertex_edge_and_distance[1];
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
							var new_destination_vertex:Vertex = neighbor_edge.getDestination();
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
			var path:Array = [];
			var edge:DirectedEdge = follow_list[follow_list.length - 1];
			
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
		public function getShortestEdgePath(a:Vertex, b:Vertex):Array
		{
			if (b.equals(a))
				return null;
			else 
			{
				var search_queue:PriorityQueue = new PriorityQueue();
				var distance:Number = b.distanceTo(a);
				search_queue.addObject([a, null, distance], b.distanceTo(a));
				var result:Array = findDestination(b, search_queue, [], []);
				
				var observed_vertices:Array = result[0];
				var follow_list:Array = result[1]
				
				if (follow_list != null) {
					return getPathFromFollowList(observed_vertices, follow_list);
				}
				else {
					return null;
				}
			}
		}
		
		public function getVertexPathFromEdgePath(edge_path:Array):Array
		{
			if (edge_path) {
				var vertex_path:Array = [new FlxPoint((DirectedEdge)(edge_path[0]).getSource().x, (DirectedEdge)(edge_path[0]).getSource().y)];
				for (var i:int = 0; i < edge_path.length; i++)
				{
					vertex_path.push(new FlxPoint((DirectedEdge)(edge_path[i]).getDestination().x, (DirectedEdge)(edge_path[i]).getDestination().y));
				}
				return vertex_path;
			}
			else {
				return null;
			}
		}
	}
}