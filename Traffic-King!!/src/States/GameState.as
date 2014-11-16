package States {
	import org.flixel.*;
	import Waves.*;
	import Maps.Map;
	
	public class GameState extends FlxState 
	{	
		/*Important information about the current level*/
		protected var current_wave:Wave;
		public var map:Map;
		
		private var active_vehicles:FlxGroup;
		
		/*used to make the camera follow the mouse*/
		private var MouseRectangle:FlxObject;
		
		public function GameState(wave:Wave) 
		{
			this.current_wave = wave;
			this.map = current_wave.getMap();
		}
		
		FlxG.debug;	//allows debug messages to appear	
		override public function create():void 
		{
			FlxG.mouse.show();
			
			/*Initializes the rectangle that the camera will follow*/
			MouseRectangle = new FlxObject(FlxG.mouse.x, FlxG.mouse.y, 16, 16);
			add(MouseRectangle);
			
			/*sets the camera to follow the mouse */
			FlxG.camera.setBounds(0, 0, map.getMapWidth(), map.getMapHeight());
			FlxG.camera.follow(MouseRectangle);
			FlxG.camera.deadzone = new FlxRect((Parameters.SCREEN_WIDTH - Parameters.DEADZONE_WIDTH) / 2, (Parameters.SCREEN_HEIGHT - Parameters.DEADZONE_HEIGHT) / 2,
												Parameters.DEADZONE_WIDTH, Parameters.DEADZONE_WIDTH);				

			for (var k in current_wave.getAllSpawnSchedules()) 
			{
				(SpawnSchedule)(current_wave.getAllSpawnSchedules()[k]).initSpawnSchedule(this);
			}

			add(this.map.create());
			super.create();
		}
		
		override public function update():void
		{
			/*updates the position of the mouse*/
			MouseRectangle.x = FlxG.mouse.x;
			MouseRectangle.y = FlxG.mouse.y;
			
			/*Zoomin zoom out is bussteeeed*/
			/*
			if (FlxG.keys.justPressed("Z"))
			{
				FlxG.camera.zoom *= 2;
			}
			if (FlxG.keys.justPressed("X"))
			{
				FlxG.camera.zoom *= 0.5;
			}
			*/
			
			for (var k in current_wave.getAllSpawnSchedules()) 
			{
				(SpawnSchedule)(current_wave.getAllSpawnSchedules()[k]).update();
			}

			super.update();
		}
		
		public function getVehicles():FlxGroup
		{
			return active_vehicles;
		}
		
	}

}