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
		[Embed(source = "../../assets/UI/LevelInfo-1Trans1.png")] private var Background:Class;	
		
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
			background_sprite = new FlxSprite(0, 0, Background);
			add(background_sprite);	
			//FlxG.switchState(new GameState(current_wave));
		}
		
		override public function update():void
		{
			if (timer == 200)
				FlxG.switchState(new GameState(current_wave));
			timer ++; 
			super.update();
		}
	}
}