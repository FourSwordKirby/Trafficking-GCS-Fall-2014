package GameObjects
{
	import org.flixel.*;
	
	public class TrafficLightGroup 
	{
		private var NorthSouthLights:FlxGroup;
		private var EastWestLights:FlxGroup;

		private var frequency:int;		//This is used indicate how many seconds until the light changes from green to red
		private var position:FlxPoint;
		private var onCoolDown:Boolean;
		
		private var arrangement:int;
		private var timer:int;
		
		public function TrafficLightGroup(X:int, Y:int, arrangement:int, frequency:int)
		{
			this.position = new FlxPoint(X, Y);
			this.arrangement = arrangement;
			
			this.frequency = frequency;
			this.timer = 0;
			this.onCoolDown = false;
			
			switch (arrangement)
			{
				case Parameters.ARRANGEMENT_NESW:
					NorthSouthLights.add(new TrafficLight(this.x,this.y,
			}
		}
		
	}

}