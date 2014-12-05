package Vehicles {
	import flash.net.NetStreamMulticastInfo;
	import Graph.*;
	import org.flixel.*;
	import States.GameState;

	public class Car extends Vehicle
	{
		/*Embedding art assets for use */
		[Embed(source = "../../assets/gfx/Red Car.PNG")] private static var RedCarSprite:Class;
		[Embed(source = "../../assets/gfx/Gray Car.PNG")] private static var BlueCarSprite:Class;
		[Embed(source = "../../assets/gfx/Black Car.PNG")] private static var BlackCarSprite:Class;
		[Embed(source = "../../assets/gfx/White Car.PNG")] private static var WhiteCarSprite:Class;
		[Embed(source = "../../assets/gfx/Gray Car.PNG")] private static var GreyCarSprite:Class;
		[Embed(source = "../../assets/gfx/Yellow Car.PNG")] private static var YellowCarSprite:Class;
		
		public function Car(edge_path:Array,vertex_path:Array) 
		{
			var speed:int = 45 + Math.floor(Math.random() * 100);
			super((DirectedEdge)(edge_path[0]).getSource().x - 25, (DirectedEdge)(edge_path[0]).getSource().y - 25, speed);
			this.planned_path = edge_path;
			
			this.followPath(new FlxPath(vertex_path), 100, PATH_FORWARD,true);
			
			var rgraphic:int = Math.floor(Math.random() * 6);
			
			switch(rgraphic) 
			{
				case 0:
					loadRotatedGraphic(RedCarSprite, 16, -1, true, true);
					break;
				case 1:
					loadRotatedGraphic(WhiteCarSprite, 16, -1, true, true);
					break;
				case 2:
					loadRotatedGraphic(BlackCarSprite, 16, -1, true, true);
					break;
				case 3:
					loadRotatedGraphic(BlueCarSprite, 16, -1, true, true);
					break;
				case 4:
					loadRotatedGraphic(YellowCarSprite, 16, -1, true, true);
					break;
				case 5:
					loadRotatedGraphic(GreyCarSprite, 16, -1, true, true);
					break;
			}
			// Parameters.TILE_WIDTH, Parameters.TILE_HEIGHT);
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
			
			if (this.current_road != null && !this.current_road.getDestination().isTerminal() && (this._pathNodeIndex < this.planned_path.length))
			{
				if(!(DirectedEdge)(this.planned_path[this._pathNodeIndex]).getDestination().isTerminal())
					this.pathSpeed = 100;
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