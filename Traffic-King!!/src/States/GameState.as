package States {
	import GUI.PauseMenu;
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
		
		[Embed(source = "../../assets/sfx/pause_chime.mp3")] private var PauseSound:Class;

		/*Important information about the current level*/
		protected var current_wave:Wave;
		public var map:Map;
		public var active_vehicles:Array;		
		public var player:Player;		
		private var timer:int;		
		private var clock:FlxText;
		private var score:FlxText; 
		
		/*Our pause menu*/
		private var pause_menu:PauseMenu;
		
		/*used to make the camera follow the mouse*/
		private var MouseRectangle:FlxObject;
		
		public function GameState(wave:Wave, player:Player) 
		{
			this.current_wave = wave;
			this.map = current_wave.getMap();
			this.player = player;
			
			this.active_vehicles = [];
			this.timer = 6000;
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
			
			//Initializes the spawner
			current_wave.getSpawnScedule().initSpawnSchedule(this);
			
			switch (this.current_wave.getMapName())
			{
				case "Pittsburgh":
				    FlxG.playMusic(PittMusic);
					tint = 0x00FFFFFF;
					break;
				
			    case "New York":
					FlxG.playMusic(NYMusic);
					tint = 0x00808080;
					break;
					
				case "London":
					FlxG.playMusic(LondonMusic);
					tint = 0x00800080;
					break;
					
				case "Paris":
					FlxG.playMusic(ParisMusic);
					tint = 0x00FF0000;
					break;
					
				case "Tokyo":
					FlxG.playMusic(TokyoMusic);
					tint = 0x00F0A804;
					break;
				case "Beijing":
					FlxG.playMusic(BeijingMusic);
					tint = 0x00FFF000;
					break;
			}
			FlxG.camera.color = tint
			
			//adds the map and all of its components to the game
			add(this.map.create());
			
			this.clock = new FlxText(20, 20, 600, ("Time: " + toSeconds(this.timer)), true);
			this.clock.size = 14;
			this.clock.scrollFactor.x = 0;
			this.clock.scrollFactor.y = 0;
			add(clock);
			
			this.score = new FlxText(450, 20, 140, ("Score: " + player.getScore().toString()), true);
			this.score.size = 14;
			this.score.scrollFactor.x = 0;
			this.score.scrollFactor.y = 0;
			add(score);
			
			//Initializes our pause menu
			this.pause_menu = new PauseMenu(this);
			add(pause_menu);
			
			paused = true;
			
			super.create();
		}
		
		public var tint:int;
		
		public var on_mini_map:Boolean = false;
		public var zoom:Number = 0.25;
		public var paused:Boolean = false;
		
		override public function update():void
		{
			//Pause code is just these two if statements
			if (FlxG.keys.justPressed("P"))
			{
				FlxG.play(PauseSound);
				if (paused)
					pause_menu.close();
				else
				{
					pause_menu.open();
					pause_menu.visible = false;
				}
					
				paused = !paused;
			}
			if (paused)
			{
				pause_menu.update(); //update() finishes here if paused
				return;
			}
			
			/*updates the position of the mouse*/
			MouseRectangle.x = FlxG.mouse.x;
			MouseRectangle.y = FlxG.mouse.y;
			
			this.clock.text = "Time: " + toSeconds(this.timer);
			this.score.text = ("Score: " + player.getScore().toString());
			
			/*Handles interations involving the minimap*/
			if (on_mini_map)
			{	
				//Only move the mouse rechtangle if it is in the bounds of the minimap
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
						
						FlxG.camera.color = tint;
						FlxG.removeCamera(FlxG.cameras.pop());
						
						FlxG.camera.scroll.x = MouseRectangle.x - Parameters.SCREEN_WIDTH / 2;
						FlxG.camera.scroll.y = MouseRectangle.y - Parameters.SCREEN_HEIGHT / 2;
						
						on_mini_map = false;
					}
				}
				
				if (FlxG.keys.justPressed("X"))
				{
					FlxG.camera.color = tint;	//resets to normal
					FlxG.removeCamera(FlxG.cameras.pop());
					
					on_mini_map = false;
				}
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
			
			//Each cars individual AI kicks in
			for (var i:int = 0; i < active_vehicles.length; i++)
			{
				checkSurroundings(active_vehicles[i]);
			}
			
			//Lets our spawners add in new cars
			current_wave.getSpawnScedule().update();
			
			/*Checks if cars crash*/
			for (var i:int = 0; i < active_vehicles.length; i++)
			{
				for (var j:int = 0; j < active_vehicles.length; j++)
				{
					if (FlxG.overlap(active_vehicles[i], active_vehicles[j]))
					{
						((Vehicle) (active_vehicles[i])).crash();
						((Vehicle) (active_vehicles[j])).crash();
					}
				}
			}
			
			this.timer--;
			
			if (this.timer == 0)
			{
				FlxG.switchState(new RestartState(this.player));
			}
			
			super.update();
		}
		
		public function checkSurroundings(this_vehicle:Vehicle)
		{
			var follow_distance = this_vehicle.height +85;	//This really should be the larger of height and width
			
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
						if (this_vehicle.pathSpeed > vehicle.pathSpeed )
						{
							if (((Math.abs(this_vehicle.x - vehicle.x) < follow_distance) && this_vehicle.y == vehicle.y)
							|| ((Math.abs(this_vehicle.y - vehicle.y) < follow_distance) && this_vehicle.x == vehicle.x))
							{
								this_vehicle.pathSpeed = vehicle.pathSpeed;
							}
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