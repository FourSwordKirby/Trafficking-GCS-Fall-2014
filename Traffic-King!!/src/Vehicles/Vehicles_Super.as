package Vehicles 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author sophia
	 */ 
	public class Vehicles_Super extends FlxSprite 
	{
		public static var maxspeed:int;
		public var speed:int;
		public var stopped:Boolean;
		public static var followdist:int;
		public static var destination_x:int;
		public static var destination_y:int;
		public var location_x:int;
		public var location_y:int;
		
		public function Vehicles_Super(X:int, Y:int) 
		{
			super(X, Y); 
			//load sprites, animation, etc; potentially set velocity/acceleration?
			//child classes set certain specifics in regards to variables?
		}
		
		public function getSpeed():int
		{
			return speed;
		}
		
		public function isStopped():Boolean
		{
			return stopped;
		}
		
		public function getLocation_x():int
		{
			return location_x;
		}
		
		public function getLocation_y():int
		{
			return location_y;
		}
		
		public function getNextDir(D:String):void
		{
			//takes current direction, looks at map, updates direction and location.
		}
		
		public override function update():void
		{
		// The vehicle follows 
		// if the vehicle in front of us is within follow_distance, set speed to their speed.
		//if vehicle in front of us is stopped, we stop as well (isn't stopping the same thing as speed = 0?).
		//if the light in front of us is red, then we stop; if it turns green, accelerate to maxspeed.
		// If the vehicle reaches its destination, it'll remove itself from the screen, increment points?
		super.update();
		}
		
	}

}