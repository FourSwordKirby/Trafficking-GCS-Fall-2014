package States {
	import flash.display.NativeMenu;
	import GameObjects.TrafficLight;
	import GameObjects.TrafficLightGroup;
	import GameObjects.VehicleSpawner;
	import mx.core.FlexSprite;
	import org.flashdevelop.utils.TraceLevel;
	import org.flixel.*;
	public class PittSetupState extends SetupState
	{
		/*Embedding outside text assets for use (this includes tilemaps etc.) */
		[Embed(source = '../../assets/maplayouts/map1.csv', mimeType = 'application/octet-stream')] private var Map1_MapData:Class;	//data for the map layout
		
		/*Embedding art assets for use */
		[Embed(source = "../../assets/gfx/Car Temporary Graphic.PNG")] private static var CarSprite:Class;
		[Embed(source = "../../assets/tiles/Road Tiles No Edges.png")] private var Tiles:Class;
		
		FlxG.debug;							//allows debug messages to appear
		
		public function PittSetupState()
		{
			super("Pitt", "1");
		}
		
		override public function create():void 
		{
			FlxG.mouse.show();
			
			/*Generates the level*/
			map = new FlxTilemap();
			map.loadMap(new Map1_MapData, Tiles, Parameters.TILE_WIDTH, Parameters.TILE_HEIGHT);
			add(map);
			
			super.create();
			
			var trafficLights:TrafficLightGroup = new TrafficLightGroup(20, 20, Parameters.ARRANGEMENT_NESW, 200);
			add(trafficLights);
			
			var vehicleSpawner:VehicleSpawner = new VehicleSpawner(40, 20, this);
			vehicleSpawner.reinitialize(["car", "car", "car"], 100);
			vehicleSpawner.startSpawning();
			add(vehicleSpawner);
		}
		
		override public function update():void
		{	
			super.update();
		}
		/*
		private var cursor:Cursor;			//a generic cursor. This will be used thoughout the game to select things
		private var menu:Menu;				//a generic menu. This will be used throughout the game to display selectable menu's
		*/
		//Typical function that will create the in game map
		/*override public function create():void
		{
			FlxG.mouse.show();				//Shows the mouse on the map
			
			FlxG.playMusic(LevelBGM);		//start playing music
			
			map = new FlxTilemap();												//instantiates the an instance of the map, using the data in 
			map.loadMap(new Level1_mapdata, Tiles, TILEWIDTH, TILEHEIGHT);		//Level1_mapdata and the tileset in tiles, then adds it to the game
			add(map);
			
			playerGroup = new FlxGroup();
			playerGroup.add(new Character(0, 0, "Bob"));			//adds and then initializes the player's team on the map.
			playerGroup.add(new Character(320, 320, "Charlie"));
			add(playerGroup);
			
			enemyGroup = new FlxGroup();							//adds and then initializes the enemy team on the map
			enemyGroup.add(new Character(640, 960, "EnemyDog"));
			enemyGroup.add(new Character(768, 896, "EnemyCat"));
			add(enemyGroup);
			
			cursor = new Cursor(0, 0,TILEWIDTH,TILEHEIGHT,map.width-TILEWIDTH,map.height-TILEHEIGHT); //adds our cursor to the map, starting at position (0,0)
			add(cursor);
			
			menu = new Menu(0,0,0,0,""); 	//instantiates a dummy menu
			
			FlxG.camera.setBounds(0, 0, map.width, map.height); //Sets up the camera to not scroll past world bounds and to follow the cursor
			FlxG.camera.follow(cursor);
			
			inPlanning = true;		//These declarations tell us what state the game is in (moving, attacking, in menu, etc).
			inMenu = false;
			inMovement = false;
			inTransition = false;
			
			super.create();
		}
		*/
		
		//function that mainly will keep track of which cursor needs to be moved at the moment. 
		/*override public function update():void 
		{
			if (FlxG.keys.RIGHT)
			{
				if (cursor.move("RIGHT"));
					//trace("Player:RIGHT ");
			}
			if (FlxG.keys.DOWN)
			{
				if (cursor.move("DOWN"));
					//trace("Player:DOWN ");
			}
			if (FlxG.keys.LEFT)
			{
				if (cursor.move("LEFT"));
					//trace("Player:LEFT ");
			}
			if (FlxG.keys.UP)
			{
				if (cursor.move("UP"));
					//trace("Player:UP ");
			}
			if (FlxG.keys.justPressed("SPACE"))
			{
		}
		*/
	}
}