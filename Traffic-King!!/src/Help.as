/*
I don't know precisely what I'm doing. D:
*/
package  
{
	import mx.core.FlexSprite;
	import org.flixel.*;

	public class Help extends FlxState
	{
		/*Embedding art assets for use */

		[Embed(source = "../assets/UI/Help.png")] private var Background:Class;	
		[Embed(source = "../assets/UI/Help-BackBtn1.png")] private var HelpButton:Class;
		[Embed(source = "../assets/UI/Help-BackBtn2.png")] private var HelpButtonOn:Class;

	
		private var help_button:FlxButton;

		/*Background for the start menu*/
		private var background_sprite:FlxSprite;
		
		override public function create():void
		{
			FlxG.mouse.show();							//Displays the mouse on the screen
			
			/*Initializes and adds the background to the game*/
			background_sprite = new FlxSprite(0, 0, Background);
			add(background_sprite);	
			
			/*Initializes the various map buttons and adds them to the game*/
			help_button = new FlxButton(48, 570, "", BeginGame);
			help_button.loadGraphic(HelpButton);
			help_button.onOver = function() : void {help_button.loadGraphic(HelpButtonOn)};
			help_button.onOut = function() : void {help_button.loadGraphic(HelpButton)};
			add(help_button);
			super.create();	//super method that takes care of the rest
		}
		
		private function ???(): void 
		{
			FlxG.switchState(new ???);
		}
	}
}