package Maps {
	import org.flixel.*;
	import GameObjects.*;
	import Graph.Graph;
	
	public class Map
	{
		public var game_map:FlxTilemap;
		public var buildings:FlxGroup;	//group of buildings
		public var traffic_light_group:FlxGroup; //group of TrafficLightClu
		public var vehicle_spawner_group:FlxGroup; //group of vehicle spawners
		//public var map_graph:Graph;
		
		public function Map()
		{
			this.game_map = new FlxTilemap();
			this.buildings  = new FlxGroup();
			this.traffic_light_group = new FlxGroup();
			this.vehicle_spawner_group = new FlxGroup();
		}
		
		/*This creates a map that must be added into the game by the game state*/
		public function create():FlxGroup {
			var map_group:FlxGroup = new FlxGroup();
			map_group.add(game_map);
			map_group.add(buildings);
			map_group.add(traffic_light_group);
			map_group.add(vehicle_spawner_group);
			
			return map_group;
		}
	}

}