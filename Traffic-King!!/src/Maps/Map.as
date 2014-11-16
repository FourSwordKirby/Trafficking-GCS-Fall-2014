package Maps {
	import Graph.DirectedEdge;
	import org.flixel.*;
	import GameObjects.*;
	import Graph.Graph;
	
	public class Map
	{
		public var game_map:FlxTilemap;
		public var building_group:FlxGroup;	//group of buildings
		public var traffic_light_group:FlxGroup; //group of TrafficLightClusters
		public var graph:Graph; //directed graph representation of map
		
		public function Map()
		{
			this.game_map = new FlxTilemap();
			this.building_group  = new FlxGroup();
			this.traffic_light_group = new FlxGroup();
		}
		
		/*This creates a map that must be added into the game by the game state*/
		public function create():FlxGroup 
		{
			var map_group:FlxGroup = new FlxGroup();
			map_group.add(game_map);
			map_group.add(building_group);
			map_group.add(traffic_light_group);
			
			return map_group;
		}
		
		public function getMapWidth():int
		{
			return this.game_map.width;
		}
		
		public function getMapHeight():int
		{
			return this.game_map.width;
		}
	}

}