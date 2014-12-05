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
		
		private var clock:FlxText;
		
		private var score:FlxText; 
		
		/*used to make the camera follow the mouse*/
		private var MouseRectangle:FlxObject;
		
		public function GameState(wave:Wave, player:Player) 
		{
			this.current_wave = wave;
			this.map = current_wave.getMap();
			this.player = player;
			
			this.active_vehicles = [];
			this.timer = 18000;
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
			
			this.clock = new FlxText(20, 20, 600, ("Time: " + toSeconds(this.timer)), true);
			this.clock.size = 14;
			this.clock.scrollFactor.x = 0;
			this.clock.scrollFactor.y = 0;
			add(clock);
			
			this.score = new FlxText(500, 20, 80, ("Score: " + player.getScore().toString()), true);
			this.score.size = 14;
			this.score.scrollFactor.x = 0;
			this.score.scrollFactor.y = 0;
			add(score);
			
			super.create();
		}
		
		
		public var on_mini_map:Boolean = false;
		public var zoom:Number = 0.25;
		override public function update():void
		{
			/*updates the position of the mouse*/
			MouseRectangle.x = FlxG.mouse.x;
			MouseRectangle.y = FlxG.mouse.y;
			
			this.clock.text = "Time: " + toSeconds(this.timer);
			this.score.text = ("Score: " + player.getScore().toString());
			
			if (on_mini_map)
			{	
				//Only move the mouse rechtangle if it is in the bounds of the minimap
				//KIND OF HACKY WTF
				if ((FlxG.mouse.x-FlxG.camera.scroll.x) > ((Parameters.SCREEN_WIDTH - map.getMapWidth() * zoom) / 2) && 
					(FlxG.mouse.x-FlxG.camera.scroll.x) < ((Parameters.SCREEN_WIDTH - map.getMapWidth() * zoom) / 2 + map.getMapWidth() * zoom) &&
					(FlxG.mouse.y-FlxG.camera.scroll.y) > ((Parameters.SCREEN_HEIGHT - map.getMapHeight() * zoom) / 2) && 
					(FlxG.mouse.y-FlxG.camera.scroll.y) < ((Parameters.SCREEN_HEIGHT - map.getMapHeight() * zoom) / 2 + map.getMapHeight() * zoom)
					)
				{
					if (FlxG.mouse.justPressed())
					{
						var mapLocationX:int = FlxG.mouse.x - FlxG.camera.scroll.x  - ((Parameters.SCREEN_WIDTH - map.getMapWidth() * zoom) / 2); 
						var mapLocationY:int = FlxG.mouse.y - FlxG.camera.scroll.y  - ((Parameters.SCREEN_HEIGHT - map.getMapHeight() * zoom) / 2); 

						MouseRectangle.x = mapLocationX / zoom;
						MouseRectangle.y = mapLocationY / zoom;
						
						FlxG.camera.color = 0x00FFFFFF;	//resets to normal
						FlxG.removeCamera(FlxG.cameras.pop());
						
						FlxG.camera.scroll.x = MouseRectangle.x - Parameters.SCREEN_WIDTH / 2;
						FlxG.camera.scroll.y = MouseRectangle.y - Parameters.SCREEN_HEIGHT / 2;

						/*FlxG.camera.follow(MouseRectangle);
						FlxG.camera.deadzone = new FlxRect((Parameters.SCREEN_WIDTH - Parameters.DEADZONE_WIDTH) / 2, (Parameters.SCREEN_HEIGHT - Parameters.DEADZONE_HEIGHT) / 2,
											Parameters.DEADZONE_WIDTH, Parameters.DEADZONE_WIDTH);	
						*/
											
						on_mini_map = false;
					}
				}
				
				if (FlxG.keys.justPressed("X"))
				{
					FlxG.camera.color = 0x00FFFFFF;	//resets to normal
					FlxG.removeCamera(FlxG.cameras.pop());
					
					on_mini_map = false;
				}
				
				//Here is where the code will go when we want to quick travel to a certain place on the map
				//if(MouseRectangle.x)
			}
			else
			{			
				if (FlxG.keys.justPressed("X"))
				{
					FlxG.addCamera(new FlxCamera((Parameters.SCREEN_WIDTH - map.getMapWidth()* zoom)/2, 
												 (Parameters.SCREEN_HEIGHT - map.getMapHeight() * zoom) / 2 , 
												 map.game_map.width, map.game_map.height, zoom));
					FlxG.camera.color = 0x0044444B;
					on_mini_map = true;
				}
			}
			
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
				FlxG.switchState(new GameOverState(this.player));
			}
			
			super.update();
		}
		
		public function checkSurroundings(this_vehicle:Vehicle)
		{
			var follow_distance = 200;
			
			//trace("myRoad: " + this_vehicle.current_road.toString());
			
			for (var i:int = 0; i < active_vehicles.length; i++)
			{
				var vehicle:Vehicle = active_vehicles[i];
				if (vehicle != this_vehicle)
				{
					if (this_vehicle.current_road != null && 
						vehicle.current_road != null && 
						(this_vehicle.current_road.equals(vehicle.current_road) ||
						this_vehicle.current_road.getDestination().equals(vehicle.current_road.getSource()))
						)
					{
				//		trace(this_vehicle.pathSpeed);
				//		trace(vehicle.pathSpeed);
						if (this_vehicle.pathSpeed > vehicle.pathSpeed 
							&& (Math.abs(this_vehicle.x - vehicle.x) < follow_distance || Math.abs(this_vehicle.y - vehicle.y) < follow_distance)
							)
						{
							trace("stop");
							this_vehicle.pathSpeed = vehicle.pathSpeed;
							trace(this_vehicle.pathSpeed);
						}
					}
				}
			}
		}
		
		public function getVehicles():Array
		{
			return active_vehicles;
		}
		
		public function getPlayer():void
		{
			
		}
		
		public function toSeconds(time:int):String
		{
			var i:int = time / 60;
			return i.toString();
		}
	}

}