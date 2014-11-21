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
			
			/* 1st row */
			graph.addDirectedEdge(new DirectedEdge(new Vertex(1000, 75), new Vertex(700, 75), 300));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(700, 125), new Vertex(1000, 125), 300));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(625, 0), new Vertex(625, 50), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(675, 50), new Vertex(675, 0), 50));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(600, 75), new Vertex(450, 75), 150));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(450, 125), new Vertex(600, 125), 150));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(0, 125), new Vertex(350, 125), 350));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(350, 75), new Vertex(0, 75), 350));
			
			
			/* 1st row 1st col */
			graph.addDirectedEdge(new DirectedEdge(new Vertex(450, 75), new Vertex(425, 75), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 125), new Vertex(425, 75), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 125), new Vertex(450, 125), 25));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 75), new Vertex(375, 75), 50));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(350, 125), new Vertex(375, 125), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 75), new Vertex(375, 125), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 75), new Vertex(350, 75), 25));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 150), new Vertex(375, 125), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 125), new Vertex(425, 125), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 125), new Vertex(375, 150), 25));
			
			
			/* 1st row 2nd col */
			graph.addDirectedEdge(new DirectedEdge(new Vertex(700, 75), new Vertex(675, 75), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(675, 125), new Vertex(675, 75), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(675, 125), new Vertex(700, 125), 25));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(625, 50), new Vertex(625, 75), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(675, 75), new Vertex(625, 75), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(675, 75), new Vertex(675, 50), 25));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(600, 125), new Vertex(625, 125), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(625, 75), new Vertex(625, 125), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(625, 75), new Vertex(600, 75), 25));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(675, 150), new Vertex(675, 125), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(625, 125), new Vertex(675, 125), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(625, 125), new Vertex(625, 150), 25));
			
			
			/* 2nd row */
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 150), new Vertex(375, 350), 200));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 350), new Vertex(425, 150), 200));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(625, 150), new Vertex(625, 350), 200));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(675, 350), new Vertex(675, 150), 200));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(350, 375), new Vertex(0, 375), 350));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(0, 425), new Vertex(350, 425), 350));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(600, 375), new Vertex(450, 375), 150));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(450, 425), new Vertex(600, 425), 150));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(1000, 375), new Vertex(700, 375), 300));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(700, 425), new Vertex(1000, 425), 300));
			
			
			/* 2nd row 1st col */
			graph.addDirectedEdge(new DirectedEdge(new Vertex(450, 375), new Vertex(425, 375), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 425), new Vertex(425, 375), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 425), new Vertex(450, 425), 25));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 350), new Vertex(375, 375), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 375), new Vertex(375, 375), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 375), new Vertex(425, 350), 25));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(350, 425), new Vertex(375, 425), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 375), new Vertex(375, 425), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 375), new Vertex(350, 375), 25));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 450), new Vertex(375, 425), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 425), new Vertex(425, 425), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 425), new Vertex(375, 450), 25));
			
			
			/* 2nd row 2nd col */
			graph.addDirectedEdge(new DirectedEdge(new Vertex(700, 375), new Vertex(675, 375), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(675, 425), new Vertex(675, 375), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(675, 425), new Vertex(700, 425), 25));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(625, 350), new Vertex(625, 375), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(675, 375), new Vertex(625, 375), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(675, 375), new Vertex(675, 350), 25));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(600, 425), new Vertex(625, 425), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(625, 375), new Vertex(625, 425), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(625, 375), new Vertex(600, 375), 25));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(625, 425), new Vertex(675, 425), 50));
			
			
			/*graph.addDirectedEdge(new DirectedEdge(new Vertex(0, 125), new Vertex(350, 125), 350));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(350, 125), new Vertex(375, 125), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 125), new Vertex(375, 150), 25));*/
			
			/*graph.addDirectedEdge(new DirectedEdge(new Vertex(0, 75), new Vertex(375, 75), 375));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 75), new Vertex(425, 75), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 75), new Vertex(425, 125), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 125), new Vertex(425, 375), 250));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 375), new Vertex(425, 425), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 425), new Vertex(375, 425), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 425), new Vertex(0, 425), 375));*/
		}
		
	}

}