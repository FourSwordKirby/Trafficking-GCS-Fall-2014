package States {
	import flash.display.NativeMenu;
	import GameObjects.*;
	import GUI.SetupMenu;
	import org.flashdevelop.utils.TraceLevel;
	import org.flixel.*;
	import Maps.*;
	import Waves.PittWave1;
	import Waves.Wave;
	import mx.utils.*;
	
	public class SetupState extends FlxState
	{
		/*Important information about the current level*/
		public var current_wave:Wave;
		public var map:Map;
		
		/*used to make the camera follow the mouse*/
		protected var MouseRectangle:FlxObject;
		
		/*Components of the menu for the setup part of the game*/
		public var setup_menu:SetupMenu;
		protected var level_name:String;
		protected var wave_name:String;
		
		/*used to indicate whether we are setting up on the map or not*/
		public var in_setup:Boolean;
		
		public function SetupState(wave:Wave)
		{
			this.current_wave = wave;
			this.map = current_wave.getMap();
			this.level_name = "Pitt";
			this.wave_name = "1";
			
			this.in_setup = false;
			this.setup_menu = new SetupMenu(this);
		}
		
		FlxG.debug;							//allows debug messages to appear
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
			
			//Need to crease the menu for the setup state
			
			//Here we create the actual map
			add(this.map.create());
			add(this.setup_menu);
			
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