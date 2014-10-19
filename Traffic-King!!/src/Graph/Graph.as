package Graph 
{
	import mx.collections.ArrayList;
	/**
	 * ...
	 * @author Mountain Dew
	 */
	public class Graph 
	{
		private var vertexList:ArrayList;
		private var neighborList:ArrayList;
		private var edgeList:ArrayList;
		
		public function Graph() 
		{
			vertexList = new ArrayList();
			neighborList = new ArrayList();
			edgeList = new ArrayList();
		}
		
		public function addVertex(Vertex v)
		{
			vertexList.addItem(v);
			neighborList.addItem(new ArrayList());
		}
		
		public function addEdge(d:DirectedEdge)
		{
			
		}
		
	}

}