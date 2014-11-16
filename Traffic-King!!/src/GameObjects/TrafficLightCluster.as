package GameObjects
{
	import org.flixel.*;
    import flash.events.MouseEvent;
	
	public class TrafficLightCluster extends FlxGroup
	{
		/*Embedding art assets for use */
		[Embed(source = "/../assets/gfx/invisible.PNG")] private static var invisiButton:Class;
		[Embed(source = "/../assets/gfx/dummy.PNG")] private static var dummy:Class
		
		private var NorthSouthLights:FlxGroup;
		private var EastWestLights:FlxGroup;

		private var frequency:int;		//This is used indicate how many seconds until the light changes from green to red
		private var position:FlxPoint;
		private var onCoolDown:Boolean;
		private var onYellow:Boolean; 
		
		private var arrangement:int;
		private var timer:int;
		private var traffic_button:FlxButton;
		
		public function TrafficLightCluster(X:int, Y:int, arrangement:int, frequency:int)
		{
			this.position = new FlxPoint(X, Y);
			this.arrangement = arrangement;
			
			this.frequency = frequency;
			this.timer = 0;
			this.onCoolDown = false;
			this.onYellow = false;
			this.traffic_button = new FlxButton(X - 12, Y - 15, "", onClick);
			traffic_button.loadGraphic(invisiButton);
			
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
			this.add (traffic_button); 
		}
		
		override public function update():void
		{
			/*if onYellow 
			{
				if (timer == Parameters.LIGHT_YELLOW_TRANSITION_TIME)
				else
			}
			else 
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
					onCoolDown = true;
				}
			}
			if (timer == (Parameters.LIGHT_YELLOW_TRANSITION_TIME + 1))
				onCoolDown = false;*/
			if (onYellow) 
			{
				if (timer == Parameters.LIGHT_YELLOW_TRANSITION_TIME)
				{
					NorthSouthLights.callAll("changeColor");
					EastWestLights.callAll("changeColor");
					timer = 0;
					onYellow = false;
					onCoolDown = true;
				}
			}
			else 
			{
				if (timer == frequency)
				{
					if ((TrafficLight) (NorthSouthLights.members[0]).getColor() == Parameters.LIGHT_GREEN)
						NorthSouthLights.callAll("changeColor");
					else
						EastWestLights.callAll("changeColor"); 
				onYellow = true; 
				timer = 0;
				}
				if (timer == 100) 
					onCoolDown = false;
			}
			timer++;
			super.update();
		}
		
		public function onClick():void 
		{
			if (!onCoolDown)
			{
				if ((TrafficLight) (NorthSouthLights.members[0]).getColor() == Parameters.LIGHT_GREEN)
					NorthSouthLights.callAll("changeColor");
				else
					EastWestLights.callAll("changeColor");
				timer = 0;
				onYellow = true;
				onCoolDown = true;
			}
		}
	}
}