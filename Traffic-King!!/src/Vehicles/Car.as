package Vehicles {
	import flash.net.NetStreamMulticastInfo;
	import Graph.Vertex;
	import org.flixel.*;

	public class Car extends Vehicle
	{
		/*Embedding art assets for use */
		[Embed(source = "../../assets/gfx/Car Temporary Graphic.PNG")] private static var CarSprite:Class;
		
		public function Car(X:int,Y:int /*path:Array*/)//,destination:Vertex,game:GameState) 
		{
			/*
			super(X, Y, 20, new Vertex(20, 20),game);
			*/
			super(X, Y,/*path,*/400);
			loadRotatedGraphic(CarSprite, 16, -1, true, true);// Parameters.TILE_WIDTH, Parameters.TILE_HEIGHT);
//			loadGraphic(CarSprite, true, true, Parameters.TILE_WIDTH, Parameters.TILE_HEIGHT);
		}
		
		override public function update():void
		{
			super.update();
			
			switch (this.direction)
			{
				case Parameters.DIRECTION_NORTH:
					this.angle = 0;
					break;
				case Parameters.DIRECTION_EAST:
					this.angle = 90;
					break;
				case Parameters.DIRECTION_SOUTH:
					this.angle = 180;
					break;
				case Parameters.DIRECTION_WEST:
					this.angle = 270;
					break;
			}
		}
		//override public function 
		//implement a graph interface?
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
		*/
	}
}