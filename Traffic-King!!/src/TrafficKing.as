package  {
	import org.flixel.FlxGame;
	/**
	 * ...
	 * @author Roger Liu
	 */
	
	public class TrafficKing extends FlxGame
	{
		public function TrafficKing() 
		{
			//initiates the game state		
			super(Parameters.GAME_WIDTH, Parameters.GAME_HEIGHT, StartState, 1);
		}
	}

}