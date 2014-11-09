package States {
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	import Waves.PittWave1;

	public class MapSelectState extends FlxState
	{
		/*Embedding art assets for use */
		[Embed(source = "../../assets/UI/Menu-BG.png")] private var Background:Class;			//Background for the title screen

		[Embed(source = "../../assets/UI/Menu-PittBtn1.png")] private var PittButton:Class;
		[Embed(source = "../../assets/UI/Menu-NYBtn1.png")] private var NewYorkButton:Class;
		[Embed(source = "../../assets/UI/Menu-LondonBtn1.png")] private var LondonButton:Class;		
		[Embed(source = "../../assets/UI/Menu-ParisBtn1.png")] private var ParisButton:Class;	
		[Embed(source = "../../assets/UI/Menu-TokyoBtn1.png")] private var TokyoButton:Class;	
		[Embed(source = "../../assets/UI/Menu-BJBtn1.png")] private var BeijingButton:Class;

		[Embed(source = "../../assets/UI/Menu-PittBtn2.png")] private var PittButtonOn:Class;
		[Embed(source = "../../assets/UI/Menu-NYBtn2.png")] private var NewYorkButtonOn:Class;	
		[Embed(source = "../../assets/UI/Menu-LondonBtn2.png")] private var LondonButtonOn:Class;
		[Embed(source = "../../assets/UI/Menu-ParisBtn2.png")] private var ParisButtonOn:Class;	
		[Embed(source = "../../assets/UI/Menu-TokyoBtn2.png")] private var TokyoButtonOn:Class;	
		[Embed(source = "../../assets/UI/Menu-BJBtn2.png")] private var BeijingButtonOn:Class;	
		
		/*Buttons for the start menu*/
		private var pitt_button:FlxButton;	
		private var new_york_button:FlxButton;	
		private var london_button:FlxButton;	
		private var paris_button:FlxButton;	
		private var tokyo_button:FlxButton;	
		private var beijing_button:FlxButton;	

		/*Background for the start menu*/
		private var background_sprite:FlxSprite;
		
		override public function create():void
		{
			FlxG.mouse.show();							//Displays the mouse on the screen
			
			/*Initializes and adds the background to the game*/
			background_sprite = new FlxSprite(0, 0, Background);
			add(background_sprite);	
			
			/*Initializes the various map buttons and adds them to the game*/
			pitt_button = new FlxButton(50, 200, "", BeginGame);
			pitt_button.loadGraphic(PittButton);
			pitt_button.onOver = function() : void {pitt_button.loadGraphic(PittButtonOn)};
			pitt_button.onOut = function() : void {pitt_button.loadGraphic(PittButton)};
			add(pitt_button);
			
			new_york_button = new FlxButton(250, 200, "", BeginGame);
			new_york_button.loadGraphic(NewYorkButton);
			new_york_button.onOver = function() : void {new_york_button.loadGraphic(NewYorkButtonOn)}
			new_york_button.onOut = function() : void {new_york_button.loadGraphic(NewYorkButton)};
			add(new_york_button);
			
			london_button = new FlxButton(450, 200, "", BeginGame);
			london_button.loadGraphic(LondonButton);
			london_button.onOver = function() : void {london_button.loadGraphic(LondonButtonOn)}
			london_button.onOut = function() : void {london_button.loadGraphic(LondonButton)};
			add(london_button);
			
			paris_button = new FlxButton(50, 300, "", BeginGame);
			paris_button.loadGraphic(ParisButton);
			paris_button.onOver = function() : void {paris_button.loadGraphic(ParisButtonOn)}
			paris_button.onOut = function() : void {paris_button.loadGraphic(ParisButton)};
			add(paris_button);
			
			tokyo_button = new FlxButton(250, 300, "", BeginGame);
			tokyo_button.loadGraphic(TokyoButton);
			tokyo_button.onOver = function() : void {tokyo_button.loadGraphic(TokyoButtonOn)}
			tokyo_button.onOut = function() : void {tokyo_button.loadGraphic(TokyoButton)};
			add(tokyo_button);
			
			beijing_button = new FlxButton(450, 300, "", BeginGame);
			beijing_button.loadGraphic(BeijingButton);
			beijing_button.onOver = function() : void {beijing_button.loadGraphic(BeijingButtonOn)}
			beijing_button.onOut = function() : void {beijing_button.loadGraphic(BeijingButton)};
			add(beijing_button);
			
			super.create();	//super method that takes care of the rest
		}
		
		private function BeginGame(): void 
		{
			FlxG.switchState(new PittSetupState(new PittWave1));			//switches the current state to the overworld map.
		}
	}
}