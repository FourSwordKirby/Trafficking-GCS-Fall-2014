package States {
	import flash.display.ColorCorrection;
	import flash.display.NativeMenu;
	import GameObjects.*;
	import GUI.SetupMenu;
	import mx.core.FlexSprite;
	import org.flashdevelop.utils.TraceLevel;
	import org.flixel.*;
	import Maps.*;
	import PlayerInfo.Player;
	import Waves.PittWave1;
	import Waves.Wave;
	import mx.utils.*;
	
	public class SetupState extends FlxState
	{
		/*Important information about the current level*/
		public var current_wave:Wave;
		public var map:Map;
		public var map_group:FlxGroup;
		
		/*used to make the camera follow the mouse*/
		protected var MouseRectangle:FlxSprite;
		
		/*Components of the menu for the setup part of the game*/
		public var setup_menu:SetupMenu;
		protected var level_name:String;
		protected var wave_name:String;
		
		/*used to indicate whether we are setting up on the map or not*/
		public var in_setup:Boolean;
		
		/*The player that is progressing through the waves*/
		public var player:Player;
		
		public function SetupState(wave:Wave, player:Player)
		{
			this.current_wave = wave;
			this.map = current_wave.getMap();
			this.level_name = "Pitt";
			this.wave_name = "1";
			
			this.player = player;
			
			this.in_setup = false;
			this.setup_menu = new SetupMenu(this);
		}
		
		FlxG.debug;							//allows debug messages to appear
		
		override public function create():void 
		{
			FlxG.mouse.show();

			//Here we create the actual map and add the setup menu
			map_group = this.map.create();
			add(map_group);
			add(this.setup_menu);
			
			/*Initializes the rectangle that the camera will follow*/
			MouseRectangle = new FlxSprite(FlxG.mouse.x, FlxG.mouse.y)
			MouseRectangle.loadGraphic(mapSelectBoxSprite, false, false);
			MouseRectangle.width = 16;
			MouseRectangle.height = 16 * map.getMapHeight() / map.getMapWidth();

			MouseRectangle.visible = false;
			add(MouseRectangle);
			
			/*sets the camera to follow the mouse */
			FlxG.camera.setBounds(0, 0, map.getMapWidth(), map.getMapHeight());
			FlxG.camera.follow(MouseRectangle);
			FlxG.camera.deadzone = new FlxRect((Parameters.SCREEN_WIDTH - Parameters.DEADZONE_WIDTH) / 2, (Parameters.SCREEN_HEIGHT - Parameters.DEADZONE_HEIGHT) / 2,
												Parameters.DEADZONE_WIDTH, Parameters.DEADZONE_WIDTH);	
			
			
			super.create();
		}
		
		//Temporary for now, gonn put it in gamestate. Used to indicate whether we are fast accessing the map
				
		[Embed(source = "/../assets/gfx/mapSelectBox.PNG")] private static var mapSelectBoxSprite:Class;
		public var on_mini_map:Boolean = false;
		public var zoom:Number = 0.25;
		
		override public function update():void
		{
			if (in_setup)
			{
				/*updates the position of the mouse*/
				MouseRectangle.x = FlxG.mouse.x;
				MouseRectangle.y = FlxG.mouse.y;
				
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
							
							setup_menu.return_button.visible = true;
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
						setup_menu.return_button.visible = true;
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
						setup_menu.return_button.visible = false;
						FlxG.addCamera(new FlxCamera((Parameters.SCREEN_WIDTH - map.getMapWidth()* zoom)/2, 
													 (Parameters.SCREEN_HEIGHT - map.getMapHeight() * zoom) / 2 , 
													 map.game_map.width, map.game_map.height, zoom));
						FlxG.camera.color = 0x0044444B;
						on_mini_map = true;
					}
				}
			}
			
			setup_menu.update();
			//super.update();
		}
	}
}