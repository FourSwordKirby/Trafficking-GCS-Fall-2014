package Maps 
{
	import org.flixel.*;
	import GameObjects.*;
	
	public class PittMap extends Map 
	{
		 /*Embedding outside text assets for use (this includes tilemaps etc.) */
		[Embed(source = '../../assets/maplayouts/Pittsburgh.csv', mimeType = 'application/octet-stream')] private var Pitt_MapData:Class;
		[Embed(source = "../../assets/tiles/Road Tiles No Edges.png")] private var Tiles:Class;

	
		public function PittMap() 
		{
			this.game_map = new FlxTilemap();
			this.game_map.loadMap(new Pitt_MapData, Tiles, Parameters.TILE_WIDTH, Parameters.TILE_HEIGHT);
			
			traffic_light_group.add(new TrafficLightCluster(20, 20, Parameters.ARRANGEMENT_NESW, 200));
			
			/*
			 * 			var vehicleSpawner:VehicleSpawner = new VehicleSpawner(40, 20, this);
			vehicleSpawner.reinitialize(["car", "car", "car"], 100);
			vehicleSpawner.startSpawning();
			add(vehicleSpawner);
			*/
		}
		
	}

}