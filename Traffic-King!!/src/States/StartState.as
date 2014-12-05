package States {
	import flash.utils.Dictionary;
	import mx.core.FlexSprite;
	import org.flixel.*;
	import Waves.PittWave1;

	public class StartState extends FlxState
	{
		/*Embedding art assets for use */
		[Embed(source = "../../assets/UI/Main-Style2BG.png")] private var Background:Class;			//Background for the title screen
		//[Embed(source = "../../assets/UI/Main-Title.png")] private var Title:Class;			//Title
		//[Embed(source = "../../assets/UI/Main-Circle1.png")] private var BGCircle:Class;			//Background rotating wheel
		//[Embed(source = "../../assets/UI/Main-Circle2.png")] private var FGCircle:Class;			//Foreground rotating wheel
		
		[Embed(source = "../../assets/UI/Main-StartBtn1.png")] private var StartButton:Class;			//Button Graphic
		[Embed(source = "../../assets/music/The Village MSX_mp3.mp3")] private var StartMusic:Class;
		FlxG.debug;
		
		/*Buttons for the start menu*/
		private var start_button:FlxButton;
		
		/*Background for the start menu*/
		private var background_sprite:FlxSprite;
		private var BGCircle_sprite:FlxSprite;
		private var FGCircle_sprite:FlxSprite;
		
		override public function create():void
		{
			FlxG.mouse.show();							//Displays the mouse on the screen
			
			/*Initializes and adds the background to the game*/
			background_sprite = new FlxSprite(0, 0, Background);
			add(background_sprite);	
			
/*			BGCircle_sprite = new FlxSprite();
			BGCircle_sprite.loadRotatedGraphic(BGCircle, 64);
			BGCircle_sprite.angularVelocity = 40;
			add(BGCircle_sprite);
*/			
//			background_sprite = new FlxSprite(0, 0, Background);
//			add(background_sprite);	
			
			/*Initializes and adds the start button to the game*/
			start_button = new FlxButton(400, 500, "", SelectMap);
			start_button.loadGraphic(StartButton);
			add(start_button);											//This adds the button to the game world
			FlxG.playMusic(StartMusic);
			super.create();	//super method that takes care of the rest
		}
		
		private function SelectMap(): void 
		{
			FlxG.music.stop();
			FlxG.switchState(new MapSelectState)//switches the current state to the map select screen
		}
	}
}