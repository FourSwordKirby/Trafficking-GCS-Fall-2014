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
		
		public function distanceTo(v:Vertex):Number
		{
			return Math.sqrt(Math.pow(v.x - this.x, 2) + Math.pow(v.y - this.y, 2));
		}
		
		public function switchTerminal():void
		{
			this.is_terminal = !this.is_terminal;
		}
		
		public function isTerminal():Boolean
		{
			return this.is_terminal;
		}
		public function toString():String
		{
			return "[" + this.x + ", " + this.y + "]";
		}
	}
}