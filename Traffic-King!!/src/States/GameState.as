package States {
	import org.flixel.*;
	import PlayerInfo.Player;
	import Vehicles.Car;
	import Vehicles.Vehicle;
	import Waves.*;
	import Maps.Map;
	
	public class GameState extends FlxState 
	{	
		[Embed(source = "../../assets/music/DayAndNight.mp3")] private var PittMusic:Class;
		[Embed(source = "../../assets/music/Dancing on the Street NES.mp3")] private var NYMusic:Class;
		[Embed(source = "../../assets/music/Investigating a crime at night midi.mp3")] private var LondonMusic:Class;
		[Embed(source = "../../assets/music/On the way to work.mp3")] private var ParisMusic:Class;
		[Embed(source = "../../assets/music/i++.mp3")] private var TokyoMusic:Class;
		[Embed(source = "../../assets/music/It's my world.mp3")] private var BeijingMusic:Class;

		/*Important information about the current level*/
		protected var current_wave:Wave;
		public var map:Map;
		
		public var active_vehicles:Array;
		
		public var player:Player;
		
		private var timer:int;
		
		/*used to make the camera follow the mouse*/
		private var MouseRectangle:FlxObject;
		
		public function GameState(wave:Wave, player:Player) 
		{
			this.current_wave = wave;
			this.map = current_wave.getMap();
			
			this.active_vehicles = [];
			this.timer = 1000;
		}
		
		FlxG.debug;	//allows debug messages to appear	
		override public function create():void 
		{
			FlxG.mouse.show();
			
			/*Initializes the rectangle that the camera will follow said rectangle*/
			MouseRectangle = new FlxObject(FlxG.mouse.x, FlxG.mouse.y, 16, 16);
			add(MouseRectangle);
			
			/*sets the camera to follow the mouse */
			FlxG.camera.setBounds(0, 0, map.getMapWidth(), map.getMapHeight());
			FlxG.camera.follow(MouseRectangle);
			FlxG.camera.deadzone = new FlxRect((Parameters.SCREEN_WIDTH - Parameters.DEADZONE_WIDTH) / 2, (Parameters.SCREEN_HEIGHT - Parameters.DEADZONE_HEIGHT) / 2,
												Parameters.DEADZONE_WIDTH, Parameters.DEADZONE_WIDTH);				
			
			
			//Initializes all of our spawners
			for (var k in current_wave.getAllSpawnSchedules()) 
			{
				(SpawnSchedule)(current_wave.getAllSpawnSchedules()[k]).initSpawnSchedule(this);
			}
			
						switch (this.current_wave.getWaveMapName())
			{
				case "Pittsburgh":
				    FlxG.playMusic(PittMusic);
					break;
				
			    case "New York":
					FlxG.playMusic(NYMusic);
					break;
					
				case "London":
					FlxG.playMusic(LondonMusic);
					break;
					
				case "Paris":
					FlxG.playMusic(ParisMusic);
					break;
					
				case "Tokyo":
					FlxG.playMusic(TokyoMusic);
					break;
				case "Beijing":
					FlxG.playMusic(BeijingMusic);
					break;
			}
			
			//adds the map and all of its components to the game
			add(this.map.create());
			super.create();
		}
		
		override public function update():void
		{
			/*updates the position of the mouse*/
			MouseRectangle.x = FlxG.mouse.x;
			MouseRectangle.y = FlxG.mouse.y;
			
			/*Zoom in zoom out is bussteeeed*/
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
			
			for (var i:int = 0; i < active_vehicles.length; i++)
			{
				checkSurroundings(active_vehicles[i]);
			}
			
			for (var k in current_wave.getAllSpawnSchedules()) 
			{
				(SpawnSchedule)(current_wave.getAllSpawnSchedules()[k]).update();
			}
			
			this.timer--;
			
			if (this.timer == 0)
			{
				FlxG.resetGame();
			}
			
			
			super.update();
		}
		
		public function checkSurroundings(this_vehicle:Vehicle)
		{
			//var follow_distance = 20;
			
			//trace("myRoad: " + this_vehicle.current_road.toString());
			
			for (var i:int = 0; i < active_vehicles.length; i++)
			{
				var vehicle:Vehicle = active_vehicles[i];
				if (vehicle != this_vehicle)
				{
					if (this_vehicle.current_road != null && 
						vehicle.current_road != null && 
						this_vehicle.current_road.equals(vehicle.current_road))
					{
						if(this_vehicle.pathSpeed > vehicle.pathSpeed)
							this_vehicle.pathSpeed = vehicle.pathSpeed;
					}
				}
			}
		}
		
		public function getVehicles():Array
		{
			return active_vehicles;
		}
	}

}