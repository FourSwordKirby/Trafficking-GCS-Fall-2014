package GameObjects
{
	import Graph.Vertex;
	import org.flixel.*;
    import flash.events.MouseEvent;
	
	public class TrafficLightCluster extends FlxGroup
	{
		/*Embedding art assets for use */
		[Embed(source = "/../assets/gfx/invisible.PNG")] private static var invisiButton:Class;
		[Embed(source = "/../assets/gfx/cooldown circle1.PNG")] private static var cdcircle1:Class;
		[Embed(source = "/../assets/gfx/cooldown circle2.PNG")] private static var cdcircle2:Class;
		[Embed(source = "/../assets/gfx/cooldown circle3.PNG")] private static var cdcircle3:Class;
		[Embed(source = "/../assets/gfx/cooldown circle4.PNG")] private static var cdcircle4:Class;
		[Embed(source = "/../assets/gfx/cooldown circle5.PNG")] private static var cdcircle5:Class;
		[Embed(source = "/../assets/gfx/cooldown circle6.PNG")] private static var cdcircle6:Class;
		[Embed(source = "/../assets/gfx/cooldown circle7.PNG")] private static var cdcircle7:Class;
		[Embed(source = "/../assets/gfx/cooldown circle8.PNG")] private static var cdcircle8:Class;
		[Embed(source = "/../assets/gfx/cooldown circle9.PNG")] private static var cdcircle9:Class;
		[Embed(source = "/../assets/gfx/cooldown circle10.PNG")] private static var cdcircle10:Class;
		[Embed(source = "/../assets/gfx/cooldown circle11.PNG")] private static var cdcircle11:Class;
		[Embed(source = "/../assets/gfx/cooldown circle12.PNG")] private static var cdcircle12:Class;
		[Embed(source = "/../assets/gfx/cooldown circle13.PNG")] private static var cdcircle13:Class;
		[Embed(source = "/../assets/gfx/cooldown circle14.PNG")] private static var cdcircle14:Class;
		[Embed(source = "/../assets/gfx/cooldown circle15.PNG")] private static var cdcircle15:Class;
		[Embed(source = "/../assets/gfx/cooldown circle16.PNG")] private static var cdcircle16:Class;
		[Embed(source = "/../assets/gfx/cooldown circle.PNG")] private static var cdcircle:Class;
		
		private var NorthSouthLights:FlxGroup;
		private var EastWestLights:FlxGroup;

		private var cooldownBubble:FlxSprite;
		
		private var frequency:int;		//This is used indicate how many seconds until the light changes from green to red
		private var position:FlxPoint;
		private var onCoolDown:Boolean;
		private var onYellow:Boolean; 
		
		private var arrangement:int;
		private var timer:int;
		private var traffic_button:FlxButton;
		private var NSvertices:Array; //North/South vertices that our TrafficLightCluster effects
		private var EWvertices:Array; //East/West ""
		
		public function TrafficLightCluster(X:int, Y:int, arrangement:int, frequency:int)
		{
			var light:TrafficLight;
			light = new TrafficLight(0, 0);	//dummy traffic light to help us initialize position.
			
			this.position = new FlxPoint(X-light.width/2, Y-light.height/2);
			this.arrangement = arrangement;
			
			this.frequency = frequency;
			this.timer = 0;
			this.onCoolDown = false;
			this.onYellow = false;
			this.traffic_button = new FlxButton(X - 12, Y - 15, "", onClick);
			traffic_button.loadGraphic(invisiButton);
			
			this.cooldownBubble = new FlxSprite(X-light.width-3, Y-light.width-3, invisiButton);
			cooldownBubble.loadGraphic(cdcircle, true, false, 50, 60);
			cooldownBubble.addAnimation("cooldown", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 0], 8, false);
			
			this.NorthSouthLights = new FlxGroup();
			this.EastWestLights = new FlxGroup();
			this.NSvertices = [];
			this.EWvertices = [];
			
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
			this.add(cooldownBubble);
		}
		
		override public function update():void
		{
			if (onYellow) 
			{
				if (timer == Parameters.LIGHT_YELLOW_TRANSITION_TIME)
				{
					NorthSouthLights.callAll("changeColor");
					EastWestLights.callAll("changeColor");
					toggleVertices();
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
				if (timer == 120) 
					onCoolDown = false;
			}
			timer++;
			super.update();
		}
		
		public function onClick():void 
		{
			if (!onCoolDown && !onYellow)
			{
				if ((TrafficLight) (NorthSouthLights.members[0]).getColor() == Parameters.LIGHT_GREEN)
					NorthSouthLights.callAll("changeColor");
				else
					EastWestLights.callAll("changeColor");
				timer = 0;
				onYellow = true;
				onCoolDown = true;
				this.cooldownBubble.play("cooldown");
			}
		}
		
		public function getNSvertices():Array
		{
			return NSvertices;
		}
		
		public function addNSvertices(v:Vertex):void
		{
			this.NSvertices.push(v);
		}
		
		public function getEWvertices():Array
		{
			return EWvertices;
		}
		
		public function addEWvertices(v:Vertex):void
		{
			this.EWvertices.push(v);
		}
		
		public function toggleVertices():void
		{
			for (var i:int = 0; i < this.NSvertices.length; i++)
			{
				this.NSvertices[i].switchTerminal(); 
			}
			for (var j:int = 0; j < this.EWvertices.length; j++)
			{
				this.EWvertices[j].switchTerminal();	
			}
		}
	}
}