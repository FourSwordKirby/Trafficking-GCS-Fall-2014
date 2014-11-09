package GameObjects
{
	import GameObjects.Buildings;
	import mx.collections.*;
	import org.flixel.*;
	
	public class Buildings extends FlxSprite
	{
		/*Embedding art assets for use */
		[Embed(source = "/../assets/gfx/Big Building.PNG")] private static var BB:Class;
		[Embed(source = "/../assets/gfx/Big Building Up.PNG")] private static var BBUp:Class;
		[Embed(source = "/../assets/gfx/Big Building Down.PNG")] private static var BBDown:Class;
		[Embed(source = "/../assets/gfx/Big Building Left.PNG")] private static var BBLeft:Class;
		[Embed(source = "/../assets/gfx/Big Building Right.PNG")] private static var BBRight:Class;
		[Embed(source = "/../assets/gfx/Gate Up.PNG")] private static var GateUp:Class;
		[Embed(source = "/../assets/gfx/Gate Down.PNG")] private static var GateDown:Class;
		[Embed(source = "/../assets/gfx/Gate Left.PNG")] private static var GateLeft:Class;
		[Embed(source = "/../assets/gfx/Gate Right.PNG")] private static var GateRight:Class;
		[Embed(source = "/../assets/gfx/Rectangular Building Beige.PNG")] private static var RectBeige:Class;
		[Embed(source = "/../assets/gfx/Rectangular Building Copper.PNG")] private static var RectCopp:Class;
		[Embed(source = "/../assets/gfx/Rectangular Building Verdigris.PNG")] private static var RectVerde:Class;
		[Embed(source = "/../assets/gfx/Skinny Building without Door.PNG")] private static var Skinny:Class;
		[Embed(source = "/../assets/gfx/Skinny Building with Door.PNG")] private static var SkinnyDoor:Class;
		
		//give Buildings it's x and y position, and a string representing the image you wanted loaded.
		public function Buildings(X:int, Y:int, str:String)
		{
			super(X, Y);
			switch (str)
			{
				case "BB":
					this.loadGraphic(BB);
					break;
				case "BBUp":
					this.loadGraphic(BBUp);
					break;	
				case "BBDown":
					this.loadGraphic(BBDown);
					break;
				case "BBLeft":
					this.loadGraphic(BBLeft);
					break;
				case "BBRight":
					this.loadGraphic(BBRight);
					break;
				case "GateUp":
					this.loadGraphic(GateUp);
					break;
				case "GateDown":
					this.loadGraphic(GateDown);
					break;
				case "GateLeft":
					this.loadGraphic(GateLeft);
					break;
				case "GateRight":
					this.loadGraphic(GateRight);
					break;
				case "RectBeige":
					this.loadGraphic(RectBeige);
					break;
				case "RectCopp":
					this.loadGraphic(RectCopp);
					break;
				case "RectVerde":
					this.loadGraphic(RectVerde);
					break;
				case "Skinny":
					this.loadGraphic(Skinny);
					break;	
				case "SkinnyDoor":
					this.loadGraphic(SkinnyDoor);
					break;		
			}
			
		}
	}
}