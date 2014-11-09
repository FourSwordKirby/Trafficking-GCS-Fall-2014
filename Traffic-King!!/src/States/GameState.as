import Waves.Wave;
import Maps.Map;
package States {
	import org.flixel.*;
	
	public class GameState extends FlxState 
	{	
		/*Represents the map itself*/
		public var map:Map;

		private var vehicles:FlxGroup;
		

		/*used to make the camera follow the mouse*/
		private var MouseRectangle:FlxObject;
		
		FlxG.debug;	//allows debug messages to appear
		
		public function GameState(map:Map,wave:Wave) 
		{
			this.map = map;
		}
		
		public function getVehicles():FlxGroup
		{
			return vehicles;
		}
		
	}

}