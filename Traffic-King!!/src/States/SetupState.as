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
	
	public class SetupState extends FlxState
	{
		/*Important information about the current level*/
		public var current_wave:Wave;
		public var map:Map;
		public var map_group:FlxGroup;
		
		/*used to make the camera follow the mouse*/
		protected var MouseRectangle:FlxObject;
		
		/*Components of the menu for the setup part of the game*/
		public var setup_menu:SetupMenu;
		
		/*used to indicate whether we are setting up on the map or not*/
		public var in_setup:Boolean;
		
		/*The player that is progressing through the waves*/
		public var player:Player;
		
		public function SetupState(wave:Wave, player:Player)
		{
			this.current_wave = wave;
			this.map = current_wave.getMap();
			
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
			MouseRectangle = new FlxObject(FlxG.mouse.x, FlxG.mouse.y, 16, 16 * map.getMapHeight() / map.getMapWidth())

			MouseRectangle.visible = false;
			add(MouseRectangle);
			
			/*sets the camera to follow the mouse */
			FlxG.camera.setBounds(0, 0, map.getMapWidth(), map.getMapHeight());
			FlxG.camera.follow(MouseRectangle);
			FlxG.camera.deadzone = new FlxRect((Parameters.SCREEN_WIDTH - Parameters.DEADZONE_WIDTH) / 2, 
												(Parameters.SCREEN_HEIGHT - Parameters.DEADZONE_HEIGHT) / 2,
												Parameters.DEADZONE_WIDTH, Parameters.DEADZONE_WIDTH);	
			
			super.create();
		}
		
		override public function update():void
		{
			if (in_setup)
			{
				/*updates the position of the mouse*/
				MouseRectangle.x = FlxG.mouse.x;
				MouseRectangle.y = FlxG.mouse.y;
			}
			
			setup_menu.update();
			//super.update();
		}
	}
}