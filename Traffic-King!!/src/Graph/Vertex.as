package Graph 
{
	import org.flixel.FlxPoint;

	public class Vertex extends FlxPoint
	{	
		private var isTerminal:Boolean;
		public function Vertex(X:int, Y:int)
		{
			super(X, Y);
			isTerminal = false;	//The points on our map are not initially terminal states
		}
	}

}