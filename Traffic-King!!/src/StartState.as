package  
{
	import mx.core.FlexSprite;
	import org.flixel.*;

	public class StartState extends FlxState
	{
		FlxG.debug;
		private var StartButton:FlxButton;				//This button is used to enter the overworld map state
		
		override public function create():void
		{
			FlxG.mouse.show();							//Displays the mouse on the screen
			
			StartButton = new FlxButton(320, 500, "LAUNCH CAMPAIGN", BeginGame);	//This creates the button which will let us actuall start the game
			add(StartButton);											//This adds the button to the game world
			
			super.create();	//super method that takes care of the rest
		}
		
		private function BeginGame(): void 
		{
			trace("helllo");
		}
	}
}