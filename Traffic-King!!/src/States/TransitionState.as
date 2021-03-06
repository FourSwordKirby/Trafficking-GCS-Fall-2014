package States {
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.NativeMenu;
	import flash.net.URLRequest;
	import GameObjects.*;
	import GUI.SetupMenu;
	import org.flashdevelop.utils.TraceLevel;
	import org.flixel.*;
	import Maps.*;
	import PlayerInfo.Player;
	import Waves.PittWave1;
	import Waves.Wave;
	
	public class TransitionState extends FlxState
	{
		/*Embedding art assets for use */
		[Embed(source = "../../assets/UI/LevelInfo-1Trans1.png")] private var Background1:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-1Trans2.png")] private var Background2:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-1Trans3.png")] private var Background3:Class;	
		
		[Embed(source = "../../assets/UI/LevelInfo-1Traffics1.png")] private var TrafficButton:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-2TimeLimit1.png")] private var TimeLimitButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-3Map1.png")] private var MapButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-4Money1.png")] private var MoneyButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-5Shop1.png")] private var ShopButton:Class;
		[Embed(source = "../../assets/UI/LevelInfo-6Info1.png")] private var InfoButton:Class;

		[Embed(source = "../../assets/UI/LevelInfo-BeginBtn1.png")] private var BeginButton:Class;
		
		[Embed(source = "../../assets/UI/wave_pitt.png")] private var pittsburgh:Class;	
		
		[Embed(source = "../../assets/sfx/menu_button_click.mp3")] private var ClickSound:Class;
		
		protected var current_wave:Wave;
		private var background_sprite:FlxSprite;
		private var traffic:FlxSprite;
		private var time:FlxSprite;
		private var map:FlxSprite;
		private var money:FlxSprite;
		private var shop:FlxSprite;
		private var info:FlxSprite;
		private var begin:FlxSprite;
		private var pitt:FlxSprite; 
		private var timer:int; 
		
		private var temp_player:Player;
		
		private var movie_loader:Loader;
		
		public function TransitionState(wave:Wave, player:Player)
		{
			this.current_wave = wave;
			this.timer = 0;
			
			this.temp_player = player;
		}
		override public function create():void
		{
			FlxG.mouse.show();
			background_sprite = new FlxSprite(0, 0, Background1);
			add(background_sprite);
			traffic = new FlxSprite (35, 254, TrafficButton);
			add(traffic);
			time = new FlxSprite (215, 254, TimeLimitButton);
			add(time);
			map = new FlxSprite (215, 337, MapButton);
			add(map);
			money = new FlxSprite (394 ,254 , MoneyButton);
			add(money);
			shop = new FlxSprite ( 394, 340, ShopButton);
			add(shop);
			info = new FlxSprite ( 394, 425, InfoButton);
			add(info);
			begin = new FlxSprite ( 250, 500, BeginButton);
			add(begin);
			pitt = new FlxSprite ( 150, 135, pittsburgh);
			add(pitt);
			
			
			movie_loader = new Loader();
			var url:URLRequest = new URLRequest("../assets/transitions/transitionState.swf");
			movie_loader.load(url);
			FlxG.play(ClickSound);
		}
		
		override public function update():void
		{
			if (timer == 0)
		    {
				pitt.acceleration.y = -500;
				begin.acceleration.y = 500;
			}
			if (timer == 50)
			{
				traffic.acceleration.x = -500;
				time.acceleration.y = -500;
				map.acceleration.y = 500;
				money.acceleration.x = 500;
				shop.acceleration.x = 500;
				info.acceleration.x = 500;
			}
			if (timer == 150)
			{	
				FlxG.stage.addChild(movie_loader);
/*				
				var transition_clip:FlxMovieClip = new FlxMovieClip();
				transition_clip.loadMovieClip(myLoader, 800, 800);
				*/
			}
			/*
			if (timer == 150)
			{
				background_sprite = new FlxSprite(0, 0, Background2);
				add(background_sprite);
			}
			if (timer == 200)
			{
				background_sprite = new FlxSprite(0, 0, Background3);
				add(background_sprite);
			}
			*/
			if (timer == 250)
			{
				FlxG.stage.removeChild(movie_loader);
				FlxG.switchState(new GameState(current_wave, temp_player));
			}
			timer ++; 
			super.update();
		}
	}
}