package Vehicles {
	import flash.net.NetStreamMulticastInfo;
	import Graph.*;
	import org.flixel.*;

	public class Car extends Vehicle
	{
		/*Embedding art assets for use */
		[Embed(source = "../../assets/gfx/Car Temporary Graphic.PNG")] private static var CarSprite:Class;
		
		public function Car(edge_path:Array,vertex_path:Array) 
		{
			super((DirectedEdge)(edge_path[0]).getSource().x - 25, (DirectedEdge)(edge_path[0]).getSource().y - 25, 400);
			this.planned_path = edge_path;
			
			this.followPath(new FlxPath(vertex_path), 100, PATH_FORWARD,true);
			
			loadRotatedGraphic(CarSprite, 16, -1, true, true);// Parameters.TILE_WIDTH, Parameters.TILE_HEIGHT);
			//loadGraphic(CarSprite, true, true, Parameters.TILE_WIDTH, Parameters.TILE_HEIGHT);
		}
		
		override public function update():void
		{
			super.update();
			
			if (this.current_road != null && this.current_road.getDestination().isTerminal())
			{
				trace(this.current_road.getDestination());
				trace(this.current_road.getDestination().isTerminal());
				
				this.stopFollowingPath();
			}
			
			if (this.pathSpeed == 0)
			{
				this.velocity.x = 0;
				this.velocity.y = 0;
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