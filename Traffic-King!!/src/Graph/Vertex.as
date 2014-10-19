package Graph 
{
	import org.flixel.FlxPoint;

	public class Vertex extends FlxPoint
	{	
		private var is_terminal:Boolean;
		public function Vertex(X:int, Y:int)
		{
			super(X, Y);
			is_terminal = false;	//The points on our map are not initially terminal states
		}
		
		public function equals(v:Vertex):Boolean
		{
			return (this.x == v.x && this.y == v.y);
		}
	}

}