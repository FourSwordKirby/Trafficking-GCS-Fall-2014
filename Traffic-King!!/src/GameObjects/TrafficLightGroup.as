package GameObjects
{
	import org.flixel.*;
	
	public class TrafficLightGroup extends FlxGroup
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
			
			this.NorthSouthLights = new FlxGroup();
			this.EastWestLights = new FlxGroup();
			
			var light:TrafficLight;
			switch (arrangement)
			{
				case Parameters.ARRANGEMENT_NESW:
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_NORTH);
					light.x = this.position.x;
					light.y = this.position.y - light.width  / 2;
					NorthSouthLights.add(light);
					
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_SOUTH);
					light.x = this.position.x;
					light.y = this.position.y + light.width  / 2;
					NorthSouthLights.add(light);
					
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_EAST);
					light.x = this.position.x + light.width / 2;
					light.y = this.position.y;
					EastWestLights.add(light);
					
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_WEST);
					light.x = this.position.x - light.width / 2;
					light.y = this.position.y;
					EastWestLights.add(light);
					break;
					
				case Parameters.ARRANGEMENT_NES:
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_NORTH);
					light.x = this.position.x;
					light.y = this.position.y - light.width  / 2;
					NorthSouthLights.add(light);
					
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_SOUTH);
					light.x = this.position.x;
					light.y = this.position.y + light.width / 2;
					NorthSouthLights.add(light);
					
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_EAST);
					light.x = this.position.x + light.width / 2;
					light.y = this.position.y;
					EastWestLights.add(light);
					break;
				
				case Parameters.ARRANGEMENT_ESW:
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_SOUTH);
					light.x = this.position.x;
					light.y = this.position.y + light.width / 2;
					NorthSouthLights.add(light);
					
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_EAST);
					light.x = this.position.x + light.width / 2;
					light.y = this.position.y;
					EastWestLights.add(light);
					
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_WEST);
					light.x = this.position.x - light.width / 2;
					light.y = this.position.y;
					EastWestLights.add(light);
					break;
					
				case Parameters.ARRANGEMENT_SWN:
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_NORTH);
					light.x = this.position.x;
					light.y = this.position.y - light.width / 2;
					NorthSouthLights.add(light);
					
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_SOUTH);
					light.x = this.position.x;
					light.y = this.position.y + light.width / 2;
					NorthSouthLights.add(light);
					
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_WEST);
					light.x = this.position.x - light.width / 2;
					light.y = this.position.y;
					EastWestLights.add(light);
					break;
					
				case Parameters.ARRANGEMENT_WNE:
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_NORTH);
					light.x = this.position.x;
					light.y = this.position.y - light.width / 2;
					NorthSouthLights.add(light);
					
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_EAST);
					light.x = this.position.x + light.width / 2;
					light.y = this.position.y;
					EastWestLights.add(light);
					
					light = new TrafficLight(this.position.x, this.position.y, Parameters.DIRECTION_WEST);
					light.x = this.position.x - light.width / 2;
					light.y = this.position.y;
					EastWestLights.add(light);
					break;
			}
			
			NorthSouthLights.callAll("changeColor");
			NorthSouthLights.callAll("changeColor");
			
			this.add(NorthSouthLights);
			this.add(EastWestLights);
		}
		
		override public function update():void
		{
			if (timer < frequency && timer == frequency - Parameters.LIGHT_YELLOW_TRANSITION_TIME)
			{
				if ((TrafficLight) (NorthSouthLights.members[0]).getColor() == Parameters.LIGHT_GREEN)
					NorthSouthLights.callAll("changeColor");
				else
					EastWestLights.callAll("changeColor");
			}
			
			if (timer == frequency)
			{
				NorthSouthLights.callAll("changeColor");
				EastWestLights.callAll("changeColor");
				timer = 0;
			}
			
			if (timer == frequency / 2)
				onCoolDown = false;
			
			trace(timer);

			timer++;
		}
		
		public function onClick():void 
		{
			if (!onCoolDown)
			{
				timer = frequency - Parameters.LIGHT_YELLOW_TRANSITION_TIME;
				onCoolDown = true;
			}
		}
	}
}