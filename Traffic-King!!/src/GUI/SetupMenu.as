package GUI {
	import org.flixel.*;
	import Waves.*;
	import States.*;
	/**
	 * ...
	 * @author Roger Liu (>'_')>
	 */
	public class SetupMenu extends FlxGroup
	{
		[Embed(source = "../../assets/UI/LevelInfo-1PghBG.png")] private var PittBackground:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-2NYBG.png")] private var NewYorkBackground:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-3LdnBG.png")] private var LondonBackground:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-4ParisBG.png")] private var ParisBackground:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-5TokyoBG.png")] private var TokyoBackground:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-6BeijingBG.png")] private var BeijingBackground:Class;	
		
		[Embed(source = "../../assets/UI/LevelInfo-1Traffics2.png")] private var TrafficButton:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-2TimeLimit2.png")] private var TimeLimitButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-3Map2.png")] private var MapButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-4Money2.png")] private var MoneyButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-5Shop2.png")] private var ShopButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-6Info2.png")] private var InfoButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-BeginBtn2.png")] private var BeginButton:Class;
		
		[Embed(source = "../../assets/UI/LevelInfo-1Traffics1.png")] private var TrafficButtonOn:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-2TimeLimit1.png")] private var TimeLimitButtonOn:Class;
		[Embed(source = "../../assets/UI/LevelInfo-3Map1.png")] private var MapButtonOn:Class;
		[Embed(source = "../../assets/UI/LevelInfo-4Money1.png")] private var MoneyButtonOn:Class;
		[Embed(source = "../../assets/UI/LevelInfo-5Shop1.png")] private var ShopButtonOn:Class;
		[Embed(source = "../../assets/UI/LevelInfo-6Info1.png")] private var InfoButtonOn:Class;
		[Embed(source = "../../assets/UI/LevelInfo-BeginBtn1.png")] private var BeginButtonOn:Class;
		
		
		/*Buttons for the setup state menu*/
		private var traffic_button:FlxButton;	
		private var time_limit_button:FlxButton;	
		private var map_button:FlxButton;	
		private var money_button:FlxButton;	
		private var shop_button:FlxButton;	
		private var info_button:FlxButton;	
		private var begin_button:FlxButton;	

		/*Background for the start menu*/
		private var background_sprite:FlxSprite;
		
		/*the setup state that this menu represents*/
		private var setup_state:SetupState;
		
		public function SetupMenu(setup_state:SetupState) 
		{
			this.setup_state = setup_state;
			if (setup_state.current_wave.getWaveMapName() == "Pittsburgh")
			{
				/*Initializes and adds the background to the game*/
				background_sprite = new FlxSprite(0, 0, PittBackground);
				add(background_sprite);
				
				map_button = new FlxButton(215, 337, "", goToMap);
				map_button.loadGraphic(MapButton);
				map_button.onOver = function() : void { map_button.loadGraphic(MapButtonOn) };
				map_button.onOut = function() : void {map_button.loadGraphic(MapButton)};
				add(map_button);
			}
			
			/*Initializes the various menu buttons*/
			traffic_button = new FlxButton(35, 254, "", dummyfunction);
			traffic_button.loadGraphic(TrafficButton);
			traffic_button.onOver = function() : void { traffic_button.loadGraphic(TrafficButtonOn) };
			traffic_button.onOut = function() : void {traffic_button.loadGraphic(TrafficButton)};
			add(traffic_button);
			
			time_limit_button = new FlxButton(215, 254, "", dummyfunction);
			time_limit_button.loadGraphic(TimeLimitButton);
			time_limit_button.onOver = function() : void { time_limit_button.loadGraphic(TimeLimitButtonOn) };
			time_limit_button.onOut = function() : void {time_limit_button.loadGraphic(TimeLimitButton)};
			add(time_limit_button);
			
			money_button = new FlxButton(394, 254, "", dummyfunction);
			money_button.loadGraphic(MoneyButton);
			money_button.onOver = function() : void { money_button.loadGraphic(MoneyButtonOn) };
			money_button.onOut = function() : void {money_button.loadGraphic(MoneyButton)};
			add(money_button);
			
			shop_button = new FlxButton(394, 340, "", dummyfunction);
			shop_button.loadGraphic(ShopButton);
			shop_button.onOver = function() : void { shop_button.loadGraphic(ShopButtonOn) };
			shop_button.onOut = function() : void {shop_button.loadGraphic(ShopButton)};
			add(shop_button);
			
			info_button = new FlxButton(394, 425, "", dummyfunction);
			info_button.loadGraphic(InfoButton);
			info_button.onOver = function() : void { info_button.loadGraphic(InfoButtonOn) };
			info_button.onOut = function() : void {info_button.loadGraphic(InfoButton)};
			add(info_button);
			
			begin_button = new FlxButton(250, 500, "", startGame);
			begin_button.loadGraphic(BeginButton);
			begin_button.onOver = function() : void { begin_button.loadGraphic(BeginButtonOn) };
			begin_button.onOut = function() : void {begin_button.loadGraphic(BeginButton)};
			add(begin_button);
		}
		
		private function dummyfunction(): void 
		{
			trace("hi");
		}
		
		private function goToMap(): void 
		{
			trace("hello");
			this.visible = false;
			setup_state.in_setup = true;
		}
		
		private function startGame():void
		{
			FlxG.switchState(new GameState(new PittWave1));	// have to make this load in the instance of the new wave
			return;
		}
	}

}