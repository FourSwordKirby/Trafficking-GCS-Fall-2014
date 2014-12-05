package States {
	import flash.utils.Dictionary;
	import mx.core.FlexSprite;
	import org.flixel.*;
	import Waves.PittWave1;
	import PlayerInfo.Player;

	public class RestartState extends FlxState
	{
		/*Embedding art assets for use */
		[Embed(source = "../../assets/UI/Game-Lost-BG.png")] private var LostBG:Class;	
		[Embed(source = "../../assets/UI/Game-Win-BG.png")] private var winBG:Class;			//Button Graphic
		[Embed(source = "../../assets/UI/Game-Lost-MenuBtn1.png")] private var menuoff:Class;
		[Embed(source = "../../assets/UI/Game-Lost-MenuBtn2.png")] private var menuon:Class;
		[Embed(source = "../../assets/UI/Game-Lost-RestartBtn1.png")] private var restartoff:Class;
		[Embed(source = "../../assets/UI/Game-Lost-RestartBtn2.png")] private var restarton:Class;
		FlxG.debug;
		
		private var menu_button:FlxButton;
		private var restart_button:FlxButton;				
		
		private var background_sprite:FlxSprite;
		private var player:Player;
		
		//private var playerName:FlxText;
		private var playerScore:FlxText;
		
		public function RestartState(ourplayer:Player)  
		{
			this.player = ourplayer;
		}
		
		override public function create():void
		{
			FlxG.flash(0xff000000);
			FlxG.mouse.show();							//Displays the mouse on the screen
			
			/*Initializes and adds the background to the game*/
			if (this.player.getScore() >= 250) {
				background_sprite = new FlxSprite(0, 0, winBG);
			}
			else {
				background_sprite = new FlxSprite(0, 0, LostBG); 
			}
			add(background_sprite);	
			
			/*Initializes and adds the restart button to the game*/
			restart_button = new FlxButton(450, 500, "", restartGame);
			restart_button.loadGraphic(restartoff);
			restart_button.onOver = function() : void {restart_button.loadGraphic(restarton)};
			restart_button.onOut = function() : void {restart_button.loadGraphic(restartoff)};
			add(restart_button);
			
			menu_button = new FlxButton(50, 500, "", toMenu);
			menu_button.loadGraphic(menuoff);
			menu_button.onOver = function() : void {menu_button.loadGraphic(menuon)};
			menu_button.onOut = function() : void {menu_button.loadGraphic(menuoff)};
			add(menu_button);											//This adds the button to the game world
			
			/*Initializes and adds the player score info*/
			///this.name = this.player.name;
			/*var nameinfo:String = "Player: " + this.player.getName(); //make second string playername after the thing is fixed
			this.playerName = new FlxText(100, 100, 400, nameinfo, true);
			this.playerName.size = 36;
			add (playerName);*/
			var scoreinfo:String = "Score: " + (this.player.getScore()).toString(); //ditto here
			this.playerScore = new FlxText(200, 250, 400, scoreinfo, true);
			this.playerScore.size = 20;
			add (playerScore);
			
			super.create();	//super method that takes care of the rest
		}
		
		private function toMenu(): void 
		{
			FlxG.switchState(new MapSelectState);
		}
		
		private function restartGame(): void 
		{
			FlxG.resetGame();
		}
	}
}