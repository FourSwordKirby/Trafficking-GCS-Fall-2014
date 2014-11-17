package States {
	import flash.display.NativeMenu;
	import GameObjects.*;
	import GUI.SetupMenu;
	import org.flashdevelop.utils.TraceLevel;
	import org.flixel.*;
	import Maps.*;
	import Waves.PittWave1;
	import Waves.Wave;
	import mx.utils.*;
	
	public class TransitionState extends FlxState
	{
		/*Embedding art assets for use */
		[Embed(source = "../../assets/UI/LevelInfo-1Trans1.png")] private var Background1:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-1Trans2.png")] private var Background2:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-1Trans3.png")] private var Background3:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-1Trans4.png")] private var Background4:Class;	
		[Embed(source = "../../assets/UI/LevelInfo-1Trans5.png")] private var Background5:Class;	
		
		protected var current_wave:Wave;
		private var background_sprite:FlxSprite;
		private var timer:int; 
		
		public function TransitionState(wave:Wave)
		{
			this.current_wave = wave;
			this.timer = 0; 
		}
		override public function create():void
		{
			FlxG.mouse.show();
			background_sprite = new FlxSprite(0, 0, Background1);
			add(background_sprite);	
			//FlxG.switchState(new GameState(current_wave));
		}
		
		override public function update():void
		{
			if (timer == 50)
			{
				background_sprite = new FlxSprite(0, 0, Background2);
				add(background_sprite);
			}
			if (timer == 100)
			{
				background_sprite = new FlxSprite(0, 0, Background3);
				add(background_sprite);
			}
			if (timer == 150)
			{
				background_sprite = new FlxSprite(0, 0, Background4);
				add(background_sprite);
			}
			if (timer == 200)
			{
				background_sprite = new FlxSprite(0, 0, Background5);
				add(background_sprite);
			}
			if (timer == 250)
				FlxG.switchState(new GameState(current_wave));
			timer ++; 
			super.update();
		}
	}
}