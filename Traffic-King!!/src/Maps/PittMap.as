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
			super();
			//this.game_map = new FlxTilemap();
			this.game_map.loadMap(new Pitt_MapData, Tiles, Parameters.TILE_WIDTH, Parameters.TILE_HEIGHT);
			
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
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(0, 125), new Vertex(325, 125), 350));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(325, 75), new Vertex(0, 75), 350));
			
			/* 1st row 1st col */
			/*graph.addDirectedEdge(new DirectedEdge(new Vertex(450, 75), new Vertex(425, 75), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 125), new Vertex(425, 75), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 125), new Vertex(450, 125), 25));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 75), new Vertex(375, 75), 50));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(350, 125), new Vertex(375, 125), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 75), new Vertex(375, 125), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 75), new Vertex(350, 75), 25));
			
			graph.addDirectedEdge(new DirectedEdge(new Vertex(425, 150), new Vertex(375, 125), 25));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 125), new Vertex(425, 125), 50));
			graph.addDirectedEdge(new DirectedEdge(new Vertex(375, 125), new Vertex(375, 150), 25));
			*/
			
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
			
			addTrafficLight(400, 100, Parameters.ARRANGEMENT_NESW, 100);
			
			var light_cluster:TrafficLightCluster = new TrafficLightCluster(650, 100, Parameters.ARRANGEMENT_NESW, 200);
			light_cluster.addNSvertices(graph.getVertex(625, 75));
			light_cluster.addEWvertices(graph.getVertex(625, 125));
			light_cluster.addEWvertices(graph.getVertex(675, 75));
			light_cluster.addNSvertices(graph.getVertex(675, 125));
			traffic_light_group.add(light_cluster);
			
			var light_cluster:TrafficLightCluster = new TrafficLightCluster(400, 400, Parameters.ARRANGEMENT_NESW, 200);
			light_cluster.addNSvertices(graph.getVertex(375, 375));
			light_cluster.addEWvertices(graph.getVertex(375, 425));
			light_cluster.addEWvertices(graph.getVertex(425, 375));
			light_cluster.addNSvertices(graph.getVertex(425, 425));
			traffic_light_group.add(light_cluster);
			
			var light_cluster:TrafficLightCluster = new TrafficLightCluster(650, 400, Parameters.ARRANGEMENT_WNE, 200);
			light_cluster.addNSvertices(graph.getVertex(625, 375));
			light_cluster.addEWvertices(graph.getVertex(625, 425));
			light_cluster.addEWvertices(graph.getVertex(675, 375));
			light_cluster.addNSvertices(graph.getVertex(675, 425));
			traffic_light_group.add(light_cluster);
			
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
		
		private function addTrafficLight(x:int, y:int, arrangement:int, frequency:int):void
		{
			var x1:int = x - 75;
			var x2:int = x - 50;
			var x3:int = x - 25;
			var x4:int = x + 25
			var x5:int = x + 50;
			var x6:int = x + 75;
			
			var y1:int = y - 75;
			var y2:int = y - 50;
			var y3:int = y - 25;
			var y4:int = y + 25
			var y5:int = y + 50;
			var y6:int = y + 75;
	
			switch (arrangement)
			{
				case Parameters.ARRANGEMENT_NESW:
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x1, y4), new Vertex(x2, y4), 25));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x2, y4), new Vertex(x3, y4), 25));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x3, y4), new Vertex(x4, y4), 50));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x4, y4), new Vertex(x5, y4), 25));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x5, y4), new Vertex(x6, y4), 25));
					
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x6, y3), new Vertex(x5, y3), 25));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x5, y3), new Vertex(x4, y3), 25));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x4, y3), new Vertex(x3, y3), 50));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x3, y3), new Vertex(x2, y3), 25));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x2, y3), new Vertex(x1, y3), 25));
					
					
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x3, y1), new Vertex(x3, y2), 25));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x3, y2), new Vertex(x3, y3), 25));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x3, y3), new Vertex(x3, y4), 50));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x3, y4), new Vertex(x3, y5), 25));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x3, y5), new Vertex(x3, y6), 25));
					
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x4, y6), new Vertex(x4, y5), 25));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x4, y5), new Vertex(x4, y4), 25));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x4, y4), new Vertex(x4, y3), 50));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x4, y3), new Vertex(x4, y2), 25));
					graph.addDirectedEdge(new DirectedEdge(new Vertex(x4, y2), new Vertex(x4, y1), 25));
					
					var light_cluster:TrafficLightCluster = new TrafficLightCluster(x, y, Parameters.ARRANGEMENT_NESW, frequency);
					light_cluster.addEWvertices(graph.getVertex(x2, y4));
					light_cluster.addEWvertices(graph.getVertex(x5, y3));
					
					light_cluster.addNSvertices(graph.getVertex(x3, y2));
					light_cluster.addNSvertices(graph.getVertex(x4, y5));
					traffic_light_group.add(light_cluster);
					
					break;
				case Parameters.ARRANGEMENT_NES:
					break;
				case Parameters.ARRANGEMENT_ESW:
					break;
				case Parameters.ARRANGEMENT_SWN:	
					break;
				case Parameters.ARRANGEMENT_WNE:
					break;
			}
		}
	}
}