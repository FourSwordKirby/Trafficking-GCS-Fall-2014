package  
{
	import mx.core.FlexSprite;
	import org.flixel.*;

	public class StartState extends FlxState
	{
		/*Embedding art assets for use */
		[Embed(source = "../assets/backgrounds/Main-Style1.png")] private var Background:Class;			//Background for the title screen
		[Embed(source = "../assets/gfx/Main-StartBtn1.png")] private var StartButton:Class;			//Background for the title screen
		
		FlxG.debug;
		
		/*Buttons for the start menu*/
		private var start_button:FlxButton;				
		
		/*Background for the start menu*/
		private var background_sprite:FlxSprite;
		
		override public function create():void
		{
			FlxG.mouse.show();							//Displays the mouse on the screen
			
			/*Initializes and adds the background to the game*/
			background_sprite = new FlxSprite(0, 0, Background);
			add(background_sprite);	
			
			/*Initializes and adds the start button to the game*/
			start_button = new FlxButton(100, 400, "", BeginGame);
			start_button.loadGraphic(StartButton);
			add(start_button);											//This adds the button to the game world
			
			super.create();	//super method that takes care of the rest
		}
		
		private function BeginGame(): void 
		{
			FlxG.switchState(new SetupState);			//switches the current state to the overworld map.
		}
	}
}