package States {
	import flash.display.NativeMenu;
	import GameObjects.*;
	import org.flashdevelop.utils.TraceLevel;
	import org.flixel.*;
	import Maps.*;
	
	public class SetupState extends FlxState
	{
		/*Represents the map itself*/
		public var map:Map;

		/*used to make the camera follow the mouse*/
		protected var MouseRectangle:FlxObject;
		
		/*Components of the menu for the setup part of the game*/
//		private var menu:Menu;
		protected var level_name:String;
		protected var wave_name:String;
		
		/*used to indicate whether we are setting up on the map or not*/
		protected var in_setup:Boolean;
		
		public function SetupState(level_name:String, wave_name:String)
		{
			this.level_name = level_name;
			this.wave_name = wave_name;
		}
		
		FlxG.debug;							//allows debug messages to appear
		override public function create():void 
		{
			FlxG.mouse.show();
			
			/*Initializes the rectangle that the camera will follow*/
			MouseRectangle = new FlxObject(FlxG.mouse.x, FlxG.mouse.y, 16, 16);
			add(MouseRectangle);
			
			/*sets the camera to follow the mouse */
			FlxG.camera.setBounds(0, 0, map.game_map.width, map.game_map.height);
			FlxG.camera.follow(MouseRectangle);
			FlxG.camera.deadzone = new FlxRect((Parameters.SCREEN_WIDTH - Parameters.DEADZONE_WIDTH) / 2, (Parameters.SCREEN_HEIGHT - Parameters.DEADZONE_HEIGHT) / 2,
												Parameters.DEADZONE_WIDTH, Parameters.DEADZONE_WIDTH);				
			super.create();
		}
		
		override public function update():void
		{
			if (!in_setup)
			{
				/*updates the position of the mouse*/
				MouseRectangle.x = FlxG.mouse.x;
				MouseRectangle.y = FlxG.mouse.y;
			}
			super.update();
		}
	}
}