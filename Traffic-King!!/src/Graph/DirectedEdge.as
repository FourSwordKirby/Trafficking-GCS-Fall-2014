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
		
		public function getSource():Vertex;
		{
			return this.source;
		}
		
		public function getDestination():Vertex;
		{
			return this.destination;
		}
		
		public function getWeight():int;
		{
			return this.weight;
		}
	}

}