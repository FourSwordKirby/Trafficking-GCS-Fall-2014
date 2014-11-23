package  
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	public class MapState extends FlxState
	{
		//*******************************Embedding things to use*********************************
		//*******************************These are all assets located in the asset folders*******
		[Embed(source = "../assets/backgrounds/MapBackground.png")] private var Background:Class;		//Background for the Overworld Map
		[Embed(source = "../assets/music/March.mp3")] private var MapBGM:Class;							//Background music for the overworld map		
		//*****************************************************************************************

		FlxG.debug;
		
		override public function create():void
		{
			FlxG.mouse.show();						//Displays the mouse on the screen
			add(new FlxSprite(0, 0, Background));	//Adds the background to the game itself

			FlxG.playMusic(MapBGM);					//This plays the overworld map's music
			
			super.create();				//super method that takes care of the rest
		}
		
		override public function update():void
		{
			if (FlxG.keys.justPressed("SPACE"))		//if the space bar is pressed, the music stops, and we initialize a level state and
			{										//the game switches to that state
				FlxG.music.stop();
				var level:LevelState = new LevelState;
				FlxG.switchState(level);
			}
		}
	}
}