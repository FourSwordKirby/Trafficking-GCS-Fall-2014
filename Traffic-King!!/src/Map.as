package  
{
	
	
	public class Map 
	{
		
		public function Map() 
		{
			
		}
		
	}

}


package  
{
	import flash.net.NetStreamMulticastInfo;
	import org.flixel.*;

	public class Car extends FlxSprite 
	{
		/*Embedding art assets for use */
		[Embed(source = "../assets/gfx/Car Temporary Graphic.PNG")] private static var CarSprite:Class;
		
		//variables to control player movement
		public var direction:String = "";
		public var moving:Boolean;
		
		//these set the bounds for where the player can move
		public var xfloor:int;			//This is how far to the left the cursor can go
		public var xceiling:int;		//This is how far to the right the cursor can go
		
		public var yfloor:int;			//This is how far up the cursor can go
		public var yceiling:int;		//This is how far down the cursor can go
		
		public function Car(X:int,Y:int) 
		{
			super(X, Y);
			loadGraphic(CarSprite, true, true, Parameters.TILE_WIDTH, Parameters.TILE_HEIGHT);
		}
/*		
		//REQUIRES: A string direction indicating what direction to move in
		//ENSURES: The character moves 1 space in said direction.
		public function move(go:String):Boolean
		{
			if (this.x % width == 0 && this.y % height == 0)
			{
				if (go == "RIGHT")
				{
					this.x += 8;
					direction = go;
				}
				if (go == "LEFT")
				{
					this.x -= 8;
					direction = go;
				}
				if (go == "UP")
				{
					this.y -= 8;
					direction = go;
				}
				if (go == "DOWN")
				{
					this.y += 8;
					direction = go;
				}
				return true;
			}
			else	
				return false;
		}
		
		//This tells us if we ran out of movement (ie, moved the max distance)
		public function outOfMovement():Boolean
		{
			var x_displacement:int = Math.abs(this.x+this.width/2 - this.origin.x)/this.width;
			var y_displacement:int = Math.abs(this.y+this.height/2 - this.origin.y)/this.height;
			return (x_displacement + y_displacement >= movement);
		}
	}
*/
}