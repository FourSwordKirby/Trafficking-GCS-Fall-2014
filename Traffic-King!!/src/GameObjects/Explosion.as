package GameObjects 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Roger Liu (>'_')>
	 */
	public class Explosion extends FlxSprite 
	{
		[Embed(source = "/../assets/gfx/explosion.PNG")] private static var explodes:Class;
		public function Explosion(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);	
			loadGraphic(explodes, true, false, 100, 100);
			addAnimation("boom", [1, 2, 3, 4, 0], 8, false);		
			play("boom");
		}
		
		public var boomTimer:int = 0;
/*		public override function create():void 
		{
		}
*/		
		public override function update():void 
		{
			boomTimer++;
			if (boomTimer > 10)
				this.kill();
		}
		
	}

}