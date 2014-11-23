package GUI {
	import adobe.utils.CustomActions;
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
		
		[Embed(source = "../../assets/UI/LevelInfo-1Traffics1.png")] private var TrafficButton:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-2TimeLimit1.png")] private var TimeLimitButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-3Map1.png")] private var MapButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-4Money1.png")] private var MoneyButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-5Shop1.png")] private var ShopButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-6Info1.png")] private var InfoButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-BeginBtn1.png")] private var BeginButton:Class;
		
		[Embed(source = "../../assets/UI/LevelInfo-1Traffics2.png")] private var TrafficButtonOn:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-2TimeLimit2.png")] private var TimeLimitButtonOn:Class;
		[Embed(source = "../../assets/UI/LevelInfo-3Map2.png")] private var MapButtonOn:Class;
		[Embed(source = "../../assets/UI/LevelInfo-4Money2.png")] private var MoneyButtonOn:Class;
		[Embed(source = "../../assets/UI/LevelInfo-5Shop2.png")] private var ShopButtonOn:Class;
		[Embed(source = "../../assets/UI/LevelInfo-6Info2.png")] private var InfoButtonOn:Class;
		[Embed(source = "../../assets/UI/LevelInfo-BeginBtn2.png")] private var BeginButtonOn:Class;
		
		/*Embedded return button asset for us to use*/
		[Embed(source = "../../assets/UI/Back Button Small.png")] private var ReturnButton:Class;
		[Embed(source = "../../assets/UI/Back Button Big2.png")] private var ReturnButtonOn:Class;
		
		/*Buttons for the setup state menu*/
		private var traffic_button:FlxButton;	
		private var time_limit_button:FlxButton;	
		private var map_button:FlxButton;	
		private var money_button:FlxButton;	
		private var shop_button:FlxButton;	
		private var info_button:FlxButton;	
		private var begin_button:FlxButton;	
		
		//This button is used to go from our map state back to the menu setup state
		public var return_button:FlxButton;
		
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
				background_sprite.scrollFactor.x = 0;
				background_sprite.scrollFactor.y = 0;
				add(background_sprite);
				
				map_button = new FlxButton(215, 337, "", goToMap);
				map_button.scrollFactor.x = 0;
				map_button.scrollFactor.y = 0;
				map_button.loadGraphic(MapButton);
				map_button.onOver = function() : void { map_button.loadGraphic(MapButtonOn) };
				map_button.onOut = function() : void {map_button.loadGraphic(MapButton)};
				add(map_button);
			}
			
			/*Initializes the various menu buttons*/
			traffic_button = new FlxButton(35, 254, "", dummyfunction);
			traffic_button.scrollFactor.x = 0;
			traffic_button.scrollFactor.y = 0;
			traffic_button.loadGraphic(TrafficButton);
			traffic_button.onOver = function() : void { traffic_button.loadGraphic(TrafficButtonOn) };
			traffic_button.onOut = function() : void {traffic_button.loadGraphic(TrafficButton)};
			add(traffic_button);
			
			time_limit_button = new FlxButton(215, 254, "", dummyfunction);
			time_limit_button.scrollFactor.x = 0;
			time_limit_button.scrollFactor.y = 0;
			time_limit_button.loadGraphic(TimeLimitButton);
			time_limit_button.onOver = function() : void { time_limit_button.loadGraphic(TimeLimitButtonOn) };
			time_limit_button.onOut = function() : void {time_limit_button.loadGraphic(TimeLimitButton)};
			add(time_limit_button);
			
			money_button = new FlxButton(394, 254, "", dummyfunction);
			money_button.scrollFactor.x = 0;
			money_button.scrollFactor.y = 0;
			money_button.loadGraphic(MoneyButton);
			money_button.onOver = function() : void { money_button.loadGraphic(MoneyButtonOn) };
			money_button.onOut = function() : void { money_button.loadGraphic(MoneyButton) };
			
			var money_text:FlxText = new FlxText(money_button.x, money_button.y, money_button.width, setup_state.player.funds.toString());
			money_text.size *= 6;
			add(money_text);
			
			add(money_button);
			
			shop_button = new FlxButton(394, 340, "", dummyfunction);
			shop_button.scrollFactor.x = 0;
			shop_button.scrollFactor.y = 0;
			shop_button.loadGraphic(ShopButton);
			shop_button.onOver = function() : void { shop_button.loadGraphic(ShopButtonOn) };
			shop_button.onOut = function() : void {shop_button.loadGraphic(ShopButton)};
			add(shop_button);
			
			info_button = new FlxButton(394, 425, "", dummyfunction);
			info_button.scrollFactor.x = 0;
			info_button.scrollFactor.y = 0;
			info_button.loadGraphic(InfoButton);
			info_button.onOver = function() : void { info_button.loadGraphic(InfoButtonOn) };
			info_button.onOut = function() : void {info_button.loadGraphic(InfoButton)};
			add(info_button);
			
			begin_button = new FlxButton(250, 500, "", startGame);
			begin_button.scrollFactor.x = 0;
			begin_button.scrollFactor.y = 0;
			begin_button.loadGraphic(BeginButton);
			begin_button.onOver = function() : void { begin_button.loadGraphic(BeginButtonOn) };
			begin_button.onOut = function() : void {begin_button.loadGraphic(BeginButton)};
			add(begin_button);
			
			//Here is us creating a button that will let us return to the setup menu
			return_button = new FlxButton(0, 0, "", returnToMenu);
			return_button.scrollFactor.x = 0;
			return_button.scrollFactor.y = 0;
			return_button.loadGraphic(ReturnButton);
			return_button.onOver = function() : void { return_button.loadGraphic(ReturnButtonOn) };
			return_button.onOut = function() : void { return_button.loadGraphic(ReturnButton) };
			return_button.visible = false;
			add(return_button);
		}
		
		private function dummyfunction(): void 
		{
			trace("hi");
		}
		
		private function goToMap(): void 
		{
			background_sprite.visible = false;
			traffic_button.visible = false;
			time_limit_button.visible = false;
			map_button.visible = false;
			money_button.visible = false;
			shop_button.visible = false;
			info_button.visible = false;
			begin_button.visible = false;
			
			return_button.visible = true;
			setup_state.in_setup = true;
		}
		
		private function startGame():void
		{
			//Can't transfer the wave state between levels? Need to figure this out pretty badly
			FlxG.music.stop();
			FlxG.switchState(new TransitionState(new PittWave1, setup_state.player));	// have to make this load in the instance of the new wave
			return;
		}
		
		private function returnToMenu():void
		{
			background_sprite.visible = true;
			traffic_button.visible = true;
			time_limit_button.visible = true;
			map_button.visible = true;
			money_button.visible = true;
			shop_button.visible = true;
			info_button.visible = true;
			begin_button.visible = true;
			
			return_button.visible = false;
			setup_state.in_setup = false;
		}
	}

}