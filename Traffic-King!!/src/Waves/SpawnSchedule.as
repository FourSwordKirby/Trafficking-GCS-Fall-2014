package Waves 
{
	import flash.utils.Dictionary;
	import Graph.Graph;
	import Graph.Vertex;
	import org.flixel.FlxPoint;
	import org.flixel.FlxPath;
	import org.flixel.FlxState;
	import States.GameState;
	import Vehicles.Car;
	import Maps.Map;
	
	public class SpawnSchedule 
	{
		private var spawn_times:Dictionary;	//This is a collection of spawns
		private var active:Boolean;
		private var timer:int;
		private var game_state:GameState;
		
		//Eventually we want the schedule file name be such so that we can easily adjust when vehicles spawn
		public function SpawnSchedule(X:int, Y:int, direction:int, scheduleFileName:String, map:Map)
		{
			spawn_times = new Dictionary();
			
			var vertices:Array = map.graph.getVertices();
			
			
			//This is hella hardcoded at the moment and shouldn't be, 1 hours = 1 minute
			//var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(1000, 425));// vertices[0], vertices[vertices.length-1]);
			//var path2:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(75, 575));
			//spawn_times[150] = new Car(path1, map.graph.getVertexPathFromEdgePath(path1));
			//spawn_times[1050] = new Car(path1, map.graph.getVertexPathFromEdgePath(path1));
			//spawn_times[3050] = new Car(path1, map.graph.getVertexPathFromEdgePath(path1));
			//spawn_times[550] = new Car(path2, map.graph.getVertexPathFromEdgePath(path2));
			/*
			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 375));// vertices[0], vertices[vertices.length-1]);
			spawn_times[3000] = new Car(path1, map.graph.getVertexPathFromEdgePath(path1));
			
			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 125));// vertices[0], vertices[vertices.length-1]);
			spawn_times[3000] = new Car(path1, map.graph.getVertexPathFromEdgePath(path1));
			*/
			
			//spawn_times[0] = new Car(10, 10);
			//spawn_times[20] = new Car(20, 10);
			//spawn_times[40] = new Car(40, 10);
			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(675, 0));
			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(575, 275));
			if (path1) {
			   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(625, 1000));
			if (path1) {
			   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(575, 275));
			if (path1) {
			   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(575, 275));
			if (path1) {
			   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(575, 275));
			if (path1) {
			   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(625, 1000));
			if (path1) {
			   spawn_times[300] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(575, 725));
			if (path1) {
			   spawn_times[300] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(625, 575));
			if (path1) {
			   spawn_times[300] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(575, 275));
			if (path1) {
			   spawn_times[300] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(625, 575));
			if (path1) {
			   spawn_times[300] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(0, 75));
			if (path1) {
			   spawn_times[600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(675, 0));
			if (path1) {
			   spawn_times[600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(625, 575));
			if (path1) {
			   spawn_times[600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(0, 875));
			if (path1) {
			   spawn_times[600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 125));
			if (path1) {
			   spawn_times[600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(375, 1000));
			if (path1) {
			   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(675, 0));
			if (path1) {
			   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 825));
			if (path1) {
			   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(75, 575));
			if (path1) {
			   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(675, 0));
			if (path1) {
			   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(625, 575));
			if (path1) {
			   spawn_times[1200] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 925));
			if (path1) {
			   spawn_times[1200] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(0, 875));
			if (path1) {
			   spawn_times[1200] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(625, 575));
			if (path1) {
			   spawn_times[1200] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 825));
			if (path1) {
			   spawn_times[1200] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(0, 875));
			if (path1) {
			   spawn_times[1500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(625, 575));
			if (path1) {
			   spawn_times[1500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 425));
			if (path1) {
			   spawn_times[1500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(675, 0));
			if (path1) {
			   spawn_times[1500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(0, 375));
			if (path1) {
			   spawn_times[1500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(1000, 125));
			if (path1) {
			   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 825));
			if (path1) {
			   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(675, 0));
			if (path1) {
			   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(0, 375));
			if (path1) {
			   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 925));
			if (path1) {
			   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(575, 275));
			if (path1) {
			   spawn_times[2100] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 875));
			if (path1) {
			   spawn_times[2100] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 425));
			if (path1) {
			   spawn_times[2100] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(1000, 925));
			if (path1) {
			   spawn_times[2100] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(625, 575));
			if (path1) {
			   spawn_times[2100] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(0, 75));
			if (path1) {
			   spawn_times[2400] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(825, 1000));
			if (path1) {
			   spawn_times[2400] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 375));
			if (path1) {
			   spawn_times[2400] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(825, 1000));
			if (path1) {
			   spawn_times[2400] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(625, 1000));
			if (path1) {
			   spawn_times[2400] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(0, 75));
			if (path1) {
			   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 425));
			if (path1) {
			   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(575, 275));
			if (path1) {
			   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 425));
			if (path1) {
			   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(75, 575));
			if (path1) {
			   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(0, 375));
			if (path1) {
			   spawn_times[3000] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 875));
			if (path1) {
			   spawn_times[3000] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(75, 575));
			if (path1) {
			   spawn_times[3000] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 925));
			if (path1) {
			   spawn_times[3000] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(575, 275));
			if (path1) {
			   spawn_times[3000] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(625, 1000));
			if (path1) {
			   spawn_times[3300] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(825, 1000));
			if (path1) {
			   spawn_times[3300] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 125));
			if (path1) {
			   spawn_times[3300] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(375, 1000));
			if (path1) {
			   spawn_times[3300] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(0, 375));
			if (path1) {
			   spawn_times[3300] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(0, 375));
			if (path1) {
			   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 425));
			if (path1) {
			   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(375, 1000));
			if (path1) {
			   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 825));
			if (path1) {
			   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(625, 575));
			if (path1) {
			   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(575, 275));
			if (path1) {
			   spawn_times[3900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 875));
			if (path1) {
			   spawn_times[3900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(575, 725));
			if (path1) {
			   spawn_times[3900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(1000, 925));
			if (path1) {
			   spawn_times[3900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 125));
			if (path1) {
			   spawn_times[3900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(825, 1000));
			if (path1) {
			   spawn_times[4200] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(1000, 425));
			if (path1) {
			   spawn_times[4200] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(75, 575));
			if (path1) {
			   spawn_times[4200] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(625, 575));
			if (path1) {
			   spawn_times[4200] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(75, 575));
			if (path1) {
			   spawn_times[4200] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(375, 1000));
			if (path1) {
			   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 425));
			if (path1) {
			   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 925));
			if (path1) {
			   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(625, 575));
			if (path1) {
			   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(75, 575));
			if (path1) {
			   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(675, 0));
			if (path1) {
			   spawn_times[4800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(375, 1000));
			if (path1) {
			   spawn_times[4800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(675, 0));
			if (path1) {
			   spawn_times[4800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 825));
			if (path1) {
			   spawn_times[4800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(1000, 825));
			if (path1) {
			   spawn_times[4800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 425));
			if (path1) {
			   spawn_times[5100] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(375, 1000));
			if (path1) {
			   spawn_times[5100] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(0, 875));
			if (path1) {
			   spawn_times[5100] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(1000, 425));
			if (path1) {
			   spawn_times[5100] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}

			var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 875));
			if (path1) {
			   spawn_times[5100] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
			}




		}
		
		//This needs to be run before we start spawning any cars
		public function initSpawnSchedule(game_state:GameState):void
		{
			this.game_state = game_state;
			for (var k in spawn_times)
			{
				(Car)(spawn_times[k]).setGameState(game_state);
			}
			active = true;
		}
		
		/*Want to change it later to return the vehicle to be spawned? (pushes responsibility to game state*/
		public function update():void
		{
			if (spawn_times[timer] != null)
			{
				game_state.add(spawn_times[timer]);
				game_state.active_vehicles.push(spawn_times[timer]);
			}
			
			timer++;
			//trace(timer);
		}
	}
}