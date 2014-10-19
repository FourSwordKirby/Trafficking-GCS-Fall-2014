package Graph 
{
	/**
	 * ...
	 * @author Mountain Dew
	 */
	public class DirectedEdge 
	{
		private var source:Vertex;
		private var destination:Vertex;
		private var weight:int;

		public function DirectedEdge(source:Vertex, destination:Vertex) 
		{
			this.source = source;
			this.destination = destination;
		}
		
		public function equals(edge:DirectedEdge):Boolean
		{
			return (this.source.equals(edge.source) && this.destination.equals(edge.destination));
		}
		
		public function getSource():Vertex
		{
			return source;
		}
		
		public function getDestination():Vertex
		{
			return destination;
		}
		
		public function getWeight():int
		{
			return weight;
		}
	}

}