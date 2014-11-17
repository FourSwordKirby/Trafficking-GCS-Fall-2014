package Maps 
{
	import org.flixel.*;
	import GameObjects.*;
	import Graph.*;
	
	public class PittMap extends Map 
	{
		 /*Embedding outside text assets for use (this includes tilemaps etc.) */
		[Embed(source = '../../assets/maplayouts/Pittsburgh.csv', mimeType = 'application/octet-stream')] private var Pitt_MapData:Class;
		[Embed(source = "../../assets/tiles/Road Tiles No Edges.png")] private var Tiles:Class;

	
		public function PittMap() 
		{
			this.game_map = new FlxTilemap();
			this.game_map.loadMap(new Pitt_MapData, Tiles, Parameters.TILE_WIDTH, Parameters.TILE_HEIGHT);
			
			traffic_light_group.add(new TrafficLightCluster(200, 200, Parameters.ARRANGEMENT_NESW, 200));
			//Wbuilding_group.add(new Buildings(0, 245, "GateRight"));
			building_group.add(new Buildings(35, 610, "GateDown"));
			building_group.add(new Buildings(240, 170, "Tree"));
			building_group.add(new Buildings(300, 170, "Tree"));
			building_group.add(new Buildings(450, 165, "Tree"));
			building_group.add(new Buildings(450, 210, "Tree"));
			building_group.add(new Buildings(450, 255, "Tree"));
			building_group.add(new Buildings(550, 300, "Bush"));
			building_group.add(new Buildings(150, 265, "RectVerde"));
			building_group.add(new Buildings(250, 265, "RectCopp"));
			building_group.add(new Buildings(500, 165, "RectBeige"));
			building_group.add(new Buildings(500, 210, "Skinny"));
			building_group.add(new Buildings(700, 265, "RectCopp"));
			building_group.add(new Buildings(800, 265, "RectBeige"));
			
			building_group.add(new Buildings(662, 462, "BBLeft"));
			building_group.add(new Buildings(550, 462, "RectCopp"));
			building_group.add(new Buildings(450, 450, "Bush"));
			building_group.add(new Buildings(450, 520, "Tree"));
			building_group.add(new Buildings(450, 615, "RectBeige"));
			building_group.add(new Buildings(450, 665, "RectVerde"));
			building_group.add(new Buildings(550, 610, "SkinnyDoor"));
			building_group.add(new Buildings(600, 665, "RectBeige"));
			building_group.add(new Buildings(700, 665, "RectBeige"));
			building_group.add(new Buildings(850, 660, "Tree"));
			building_group.add(new Buildings(750, 850, "Bush"));
			building_group.add(new Buildings(460, 870, "BB"));
			
			building_group.add(new Buildings(120, 720, "BB"));
			building_group.add(new Buildings(65, 760, "Tree"));
			building_group.add(new Buildings(250, 460, "RectBeige"));
			building_group.add(new Buildings(250, 510, "RectBeige"));
			building_group.add(new Buildings(250, 560, "RectVerde"));
			building_group.add(new Buildings(250, 610, "RectBeige"));
			building_group.add(new Buildings(250, 660, "RectCopp"));
			building_group.add(new Buildings(250, 710, "RectVerde"));
			building_group.add(new Buildings(250, 760, "RectBeige"));
			
			this.graph = new Graph();
			graph.addDirectedEdge(new DirectedEdge(new Vertex(10, 10), new Vertex(60, 10), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(10, 10), new Vertex(10, 50), 40));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(60, 50), new Vertex(10, 50), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(60, 10), new Vertex(60, 50), 40));
		}
		
	}

}