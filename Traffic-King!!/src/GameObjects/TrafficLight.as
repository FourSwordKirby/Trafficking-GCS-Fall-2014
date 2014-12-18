package GameObjects
{
	import org.flixel.*;
	
	public class TrafficLight extends FlxSprite
	{
		/*Embedding art assets for use */
		[Embed(source = "/../assets/gfx/Traffic Lights.PNG")] private static var TrafficLightSprite:Class;
		
		private var light_state:int;
		private var direction:int;
		
		public function TrafficLight(X:int, Y:int,direction:int = Parameters.DIRECTION_NORTH)
		{
			super(X, Y);
			this.light_state = Parameters.LIGHT_GREEN;
			this.direction = direction;
			
			this.loadGraphic(TrafficLightSprite,true,true,22,16);
			
			addAnimation("Green", [2], 0);
			addAnimation("Yellow", [1], 0);
			addAnimation("Red", [0], 0);
			
			switch (light_state)
			{
				case Parameters.LIGHT_GREEN:
					play("Green");
					break;
				case Parameters.LIGHT_YELLOW:
					play("Yellow");
					break;
				case Parameters.LIGHT_RED:
					play("Red");
					break;
			}
			
			switch (direction)
			{
				case Parameters.DIRECTION_NORTH:
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
				
		public function getColor():int
		{
			return light_state;
		}		
		
		public function changeColor():void
		{
			switch (light_state)
			{
				case Parameters.LIGHT_GREEN:
					play("Yellow");
					this.light_state = Parameters.LIGHT_YELLOW;
					break;
				case Parameters.LIGHT_YELLOW:
					play("Red");
					this.light_state = Parameters.LIGHT_RED;
					break;
				case Parameters.LIGHT_RED:
					play("Green");
					this.light_state = Parameters.LIGHT_GREEN;
					break;
			}
		}
	}
}