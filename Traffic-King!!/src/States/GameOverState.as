package States {
	import flash.utils.Dictionary;
	import mx.core.FlexSprite;
	import org.flixel.*;
	import Waves.PittWave1;
	import PlayerInfo.Player;

	public class GameOverState extends FlxState
	{
		/*Embedding art assets for use */
		[Embed(source = "../../assets/UI/GameOver.png")] private var Background:Class;	
		[Embed(source = "../../assets/UI/restart1.png")] private var restartButton:Class;			//Button Graphic
		[Embed(source = "../../assets/UI/restart2.png")] private var restartButtonon:Class;
		FlxG.debug;
		
		private var restart_button:FlxButton;				
		
		private var background_sprite:FlxSprite;
		private var player:Player;
		
		private var playerName:FlxText;
		private var playerScore:FlxText;
		
		public function GameOverState(ourplayer:Player)  
		{
			this.player = ourplayer;
		}
		
		override public function create():void
		{
			FlxG.flash(0xff000000);
			FlxG.mouse.show();							//Displays the mouse on the screen
			
			/*Initializes and adds the background to the game*/
			background_sprite = new FlxSprite(0, 0, Background);
			add(background_sprite);	
			
			/*Initializes and adds the restart button to the game*/
			restart_button = new FlxButton(270, 500, "", restartGame);
			restart_button.loadGraphic(restartButton);
			restart_button.onOver = function() : void {restart_button.loadGraphic(restartButtonon)};
			restart_button.onOut = function() : void {restart_button.loadGraphic(restartButton)};
			add(restart_button);											//This adds the button to the game world
			
			/*Initializes and adds the player score info*/
			///this.name = this.player.name;
			var nameinfo:String = "Player: " + this.player.getName(); //make second string playername after the thing is fixed
			this.playerName = new FlxText(100, 100, 400, nameinfo, true);
			this.playerName.size = 36;
			add (playerName);
			var scoreinfo:String = "Score: " + (this.player.getScore()).toString(); //ditto here
			this.playerScore = new FlxText(100, 300, 400, scoreinfo, true);
			this.playerScore.size = 36;
			add (playerScore);
			
			super.create();	//super method that takes care of the rest
		}
		
		private function restartGame(): void 
		{
			FlxG.resetGame();
		}
	}
}