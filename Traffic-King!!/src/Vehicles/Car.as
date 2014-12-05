package Vehicles {
	import flash.net.NetStreamMulticastInfo;
	import Graph.*;
	import org.flixel.*;
	import States.GameState;

	public class Car extends Vehicle
	{
		/*Embedding art assets for use */
		[Embed(source = "../../assets/gfx/Red Car.PNG")] private static var CarSprite:Class;
		
		public function Car(edge_path:Array,vertex_path:Array) 
		{
			super((DirectedEdge)(edge_path[0]).getSource().x - 25, (DirectedEdge)(edge_path[0]).getSource().y - 25, 40);
			this.planned_path = edge_path;
			
			this.followPath(new FlxPath(vertex_path), 100, PATH_FORWARD,true);
			
			loadRotatedGraphic(CarSprite, 16, -1, true, true);// Parameters.TILE_WIDTH, Parameters.TILE_HEIGHT);
			//loadGraphic(CarSprite, true, true, Parameters.TILE_WIDTH, Parameters.TILE_HEIGHT);
		}
		
		FlxG.debug;
		override public function update():void
		{	
			super.update();

			//trace("Source" + this.current_road.getSource().toString());
			//trace(this.current_road.getDestination().toString());
			if (this.current_road != null && this.current_road.getDestination().isTerminal())
			{	
				this.stopFollowingPath();
			}
			
			if (this.current_road != null && !this.current_road.getDestination().isTerminal())
			{	
				this.pathSpeed = 100;	//Note 100 is a magic number at the moment
			}
			
			if (this.pathSpeed == 0)
			{
				this.velocity.x = 0;
				this.velocity.y = 0;
			}
			
			if (this.x+this.width/2 == this.path.tail().x && this.y+this.height/2 == this.path.tail().y)
			{
				this.visible = false;
				trace("hello");
//				trace (this.game_state == null);
				this.game_state.player.increaseScore(10);
				this.kill();
			}
		}
	}
}