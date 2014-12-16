package Waves 
{
	import flash.utils.Dictionary;
	import Graph.Graph;
	import Graph.Vertex;
	import mx.collections.ArrayList;
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
			
			//1 hours = 1 minute
			//Randomly generate a set of cars to spawn for the given map. Credit to Yijing Chen
			
			var entrances:ArrayList = new ArrayList();
			var exits:ArrayList  = new ArrayList();
			
			entrances.addItem(new Vertex(625, 0));
			entrances.addItem(new Vertex(0, 125));
			entrances.addItem(new Vertex(1000, 75));
			entrances.addItem(new Vertex(0, 425));
			entrances.addItem(new Vertex(1000, 375));
			entrances.addItem(new Vertex(0, 925));
			entrances.addItem(new Vertex(1000, 775));
			entrances.addItem(new Vertex(425, 1000));
			
			exits.addItem(new Vertex(675, 0));
			exits.addItem(new Vertex(0, 75));
			exits.addItem(new Vertex(1000, 125));
			exits.addItem(new Vertex(0, 375));
			exits.addItem(new Vertex(1000, 425));
			exits.addItem(new Vertex(0, 875));
			exits.addItem(new Vertex(1000, 825));
			exits.addItem(new Vertex(375, 1000));
			exits.addItem(new Vertex(575, 275));
			exits.addItem(new Vertex(75, 575));
			exits.addItem(new Vertex(625, 575));
			exits.addItem(new Vertex(575, 725));
			exits.addItem(new Vertex(625, 1000));
			exits.addItem(new Vertex(825, 1000));
			exits.addItem(new Vertex(1000, 925));
			
			var timeLimit:int = 180;	//number of seconds
			var fps:int = 30;			//frames per second
			var interval:int = 6;		//seconds before next set of cars spawn
			var density:int = 1;		//number of cars per second
			
			for (var i:int = 0; i < timeLimit*fps; i += 6*fps)
			{
				for (var j:int = 0; j < density; j++)
				{
					var start:Vertex = (Vertex)(entrances.getItemAt(Math.random() * entrances.length));
					var end:Vertex = (Vertex)(exits.getItemAt(Math.random() * exits.length));
					var path:Array = map.graph.getShortestEdgePath(start, end);
					
					if (path)
					{
						if (spawn_times[i] == null)
							spawn_times[i] = new ArrayList();
						(ArrayList)(spawn_times[i]).addItem(new Car(path, map.graph.getVertexPathFromEdgePath(path)));
					}
				}
			}
			
			/*TEST CODE TO PUT IN LATER, SHOWS THE INCONSISTENCIES IN CAR AI
			var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(675, 0));
if (path1) {
   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(675, 0));
if (path1) {
   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 125));
if (path1) {
   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(825, 1000));
if (path1) {
   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(575, 725));
if (path1) {
   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(0, 375));
if (path1) {
   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(375, 1000));
if (path1) {
   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(1000, 125));
if (path1) {
   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 825));
if (path1) {
   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(625, 1000));
if (path1) {
   spawn_times[0] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(575, 725));
if (path1) {
   spawn_times[180] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(575, 275));
if (path1) {
   spawn_times[180] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(625, 575));
if (path1) {
   spawn_times[180] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(675, 0));
if (path1) {
   spawn_times[180] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 125));
if (path1) {
   spawn_times[180] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(75, 575));
if (path1) {
   spawn_times[180] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(575, 275));
if (path1) {
   spawn_times[180] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(75, 575));
if (path1) {
   spawn_times[180] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 825));
if (path1) {
   spawn_times[180] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 825));
if (path1) {
   spawn_times[180] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 425));
if (path1) {
   spawn_times[360] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 125));
if (path1) {
   spawn_times[360] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(575, 275));
if (path1) {
   spawn_times[360] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(625, 1000));
if (path1) {
   spawn_times[360] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(375, 1000));
if (path1) {
   spawn_times[360] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 925));
if (path1) {
   spawn_times[360] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(575, 275));
if (path1) {
   spawn_times[360] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 75));
if (path1) {
   spawn_times[360] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(575, 725));
if (path1) {
   spawn_times[360] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(1000, 925));
if (path1) {
   spawn_times[360] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(625, 1000));
if (path1) {
   spawn_times[540] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(1000, 425));
if (path1) {
   spawn_times[540] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 875));
if (path1) {
   spawn_times[540] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(825, 1000));
if (path1) {
   spawn_times[540] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(375, 1000));
if (path1) {
   spawn_times[540] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(575, 725));
if (path1) {
   spawn_times[540] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(625, 575));
if (path1) {
   spawn_times[540] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(625, 1000));
if (path1) {
   spawn_times[540] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(575, 725));
if (path1) {
   spawn_times[540] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 125));
if (path1) {
   spawn_times[540] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(675, 0));
if (path1) {
   spawn_times[720] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 425));
if (path1) {
   spawn_times[720] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 925));
if (path1) {
   spawn_times[720] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(1000, 825));
if (path1) {
   spawn_times[720] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 125));
if (path1) {
   spawn_times[720] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 425));
if (path1) {
   spawn_times[720] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(625, 1000));
if (path1) {
   spawn_times[720] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 825));
if (path1) {
   spawn_times[720] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(575, 275));
if (path1) {
   spawn_times[720] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(825, 1000));
if (path1) {
   spawn_times[720] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(1000, 925));
if (path1) {
   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 925));
if (path1) {
   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(575, 275));
if (path1) {
   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 425));
if (path1) {
   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(375, 1000));
if (path1) {
   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(1000, 125));
if (path1) {
   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(0, 875));
if (path1) {
   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(575, 275));
if (path1) {
   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 125));
if (path1) {
   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 375));
if (path1) {
   spawn_times[900] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(1000, 925));
if (path1) {
   spawn_times[1080] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(0, 375));
if (path1) {
   spawn_times[1080] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(625, 575));
if (path1) {
   spawn_times[1080] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(625, 575));
if (path1) {
   spawn_times[1080] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(625, 575));
if (path1) {
   spawn_times[1080] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(675, 0));
if (path1) {
   spawn_times[1080] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(75, 575));
if (path1) {
   spawn_times[1080] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 125));
if (path1) {
   spawn_times[1080] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(0, 375));
if (path1) {
   spawn_times[1080] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(75, 575));
if (path1) {
   spawn_times[1080] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(575, 725));
if (path1) {
   spawn_times[1260] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 125));
if (path1) {
   spawn_times[1260] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(0, 375));
if (path1) {
   spawn_times[1260] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(625, 575));
if (path1) {
   spawn_times[1260] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(375, 1000));
if (path1) {
   spawn_times[1260] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(675, 0));
if (path1) {
   spawn_times[1260] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(1000, 925));
if (path1) {
   spawn_times[1260] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(75, 575));
if (path1) {
   spawn_times[1260] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 125));
if (path1) {
   spawn_times[1260] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(625, 1000));
if (path1) {
   spawn_times[1260] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 425));
if (path1) {
   spawn_times[1440] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(0, 875));
if (path1) {
   spawn_times[1440] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(575, 275));
if (path1) {
   spawn_times[1440] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(675, 0));
if (path1) {
   spawn_times[1440] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 425));
if (path1) {
   spawn_times[1440] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(75, 575));
if (path1) {
   spawn_times[1440] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(1000, 125));
if (path1) {
   spawn_times[1440] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(625, 1000));
if (path1) {
   spawn_times[1440] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(375, 1000));
if (path1) {
   spawn_times[1440] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(0, 75));
if (path1) {
   spawn_times[1440] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(625, 575));
if (path1) {
   spawn_times[1620] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(625, 575));
if (path1) {
   spawn_times[1620] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(0, 875));
if (path1) {
   spawn_times[1620] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(575, 275));
if (path1) {
   spawn_times[1620] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(1000, 125));
if (path1) {
   spawn_times[1620] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(75, 575));
if (path1) {
   spawn_times[1620] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(0, 875));
if (path1) {
   spawn_times[1620] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(825, 1000));
if (path1) {
   spawn_times[1620] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(75, 575));
if (path1) {
   spawn_times[1620] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(825, 1000));
if (path1) {
   spawn_times[1620] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(575, 725));
if (path1) {
   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(1000, 425));
if (path1) {
   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 825));
if (path1) {
   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(575, 275));
if (path1) {
   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(625, 1000));
if (path1) {
   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(1000, 925));
if (path1) {
   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(0, 375));
if (path1) {
   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(0, 875));
if (path1) {
   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 425));
if (path1) {
   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(75, 575));
if (path1) {
   spawn_times[1800] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(0, 875));
if (path1) {
   spawn_times[1980] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(575, 275));
if (path1) {
   spawn_times[1980] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(375, 1000));
if (path1) {
   spawn_times[1980] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(625, 575));
if (path1) {
   spawn_times[1980] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(625, 575));
if (path1) {
   spawn_times[1980] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(375, 1000));
if (path1) {
   spawn_times[1980] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(75, 575));
if (path1) {
   spawn_times[1980] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(0, 75));
if (path1) {
   spawn_times[1980] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(575, 725));
if (path1) {
   spawn_times[1980] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(675, 0));
if (path1) {
   spawn_times[1980] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(575, 275));
if (path1) {
   spawn_times[2160] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(575, 725));
if (path1) {
   spawn_times[2160] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(1000, 825));
if (path1) {
   spawn_times[2160] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 75));
if (path1) {
   spawn_times[2160] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(375, 1000));
if (path1) {
   spawn_times[2160] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 925));
if (path1) {
   spawn_times[2160] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(1000, 825));
if (path1) {
   spawn_times[2160] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(0, 875));
if (path1) {
   spawn_times[2160] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(675, 0));
if (path1) {
   spawn_times[2160] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(675, 0));
if (path1) {
   spawn_times[2160] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(0, 375));
if (path1) {
   spawn_times[2340] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 825));
if (path1) {
   spawn_times[2340] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(0, 75));
if (path1) {
   spawn_times[2340] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 125));
if (path1) {
   spawn_times[2340] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(0, 875));
if (path1) {
   spawn_times[2340] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(575, 275));
if (path1) {
   spawn_times[2340] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(375, 1000));
if (path1) {
   spawn_times[2340] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(825, 1000));
if (path1) {
   spawn_times[2340] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(75, 575));
if (path1) {
   spawn_times[2340] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(575, 275));
if (path1) {
   spawn_times[2340] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(675, 0));
if (path1) {
   spawn_times[2520] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 825));
if (path1) {
   spawn_times[2520] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(0, 875));
if (path1) {
   spawn_times[2520] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(1000, 425));
if (path1) {
   spawn_times[2520] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 825));
if (path1) {
   spawn_times[2520] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(825, 1000));
if (path1) {
   spawn_times[2520] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(825, 1000));
if (path1) {
   spawn_times[2520] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(0, 375));
if (path1) {
   spawn_times[2520] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(0, 875));
if (path1) {
   spawn_times[2520] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 125));
if (path1) {
   spawn_times[2520] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(575, 725));
if (path1) {
   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(0, 375));
if (path1) {
   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(375, 1000));
if (path1) {
   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 825));
if (path1) {
   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(0, 875));
if (path1) {
   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(825, 1000));
if (path1) {
   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(75, 575));
if (path1) {
   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(625, 575));
if (path1) {
   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(625, 1000));
if (path1) {
   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(1000, 425));
if (path1) {
   spawn_times[2700] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(0, 75));
if (path1) {
   spawn_times[2880] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(0, 875));
if (path1) {
   spawn_times[2880] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(575, 725));
if (path1) {
   spawn_times[2880] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(675, 0));
if (path1) {
   spawn_times[2880] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 825));
if (path1) {
   spawn_times[2880] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(1000, 425));
if (path1) {
   spawn_times[2880] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(825, 1000));
if (path1) {
   spawn_times[2880] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(375, 1000));
if (path1) {
   spawn_times[2880] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(1000, 925));
if (path1) {
   spawn_times[2880] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(675, 0));
if (path1) {
   spawn_times[2880] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(75, 575));
if (path1) {
   spawn_times[3060] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 125));
if (path1) {
   spawn_times[3060] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(625, 1000));
if (path1) {
   spawn_times[3060] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 825));
if (path1) {
   spawn_times[3060] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(0, 375));
if (path1) {
   spawn_times[3060] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(0, 375));
if (path1) {
   spawn_times[3060] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 875));
if (path1) {
   spawn_times[3060] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(375, 1000));
if (path1) {
   spawn_times[3060] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 425));
if (path1) {
   spawn_times[3060] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(625, 1000));
if (path1) {
   spawn_times[3060] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(0, 375));
if (path1) {
   spawn_times[3240] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(625, 575));
if (path1) {
   spawn_times[3240] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(675, 0));
if (path1) {
   spawn_times[3240] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(625, 1000));
if (path1) {
   spawn_times[3240] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(675, 0));
if (path1) {
   spawn_times[3240] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(575, 275));
if (path1) {
   spawn_times[3240] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(0, 375));
if (path1) {
   spawn_times[3240] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 375));
if (path1) {
   spawn_times[3240] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(825, 1000));
if (path1) {
   spawn_times[3240] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(375, 1000));
if (path1) {
   spawn_times[3240] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 125));
if (path1) {
   spawn_times[3420] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(825, 1000));
if (path1) {
   spawn_times[3420] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 925));
if (path1) {
   spawn_times[3420] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(825, 1000));
if (path1) {
   spawn_times[3420] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 925));
if (path1) {
   spawn_times[3420] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(0, 875));
if (path1) {
   spawn_times[3420] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(675, 0));
if (path1) {
   spawn_times[3420] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(825, 1000));
if (path1) {
   spawn_times[3420] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(75, 575));
if (path1) {
   spawn_times[3420] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(675, 0));
if (path1) {
   spawn_times[3420] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 925));
if (path1) {
   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(625, 575));
if (path1) {
   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(0, 875));
if (path1) {
   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(825, 1000));
if (path1) {
   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(625, 575));
if (path1) {
   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(625, 1000));
if (path1) {
   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(1000, 425));
if (path1) {
   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(0, 875));
if (path1) {
   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 825));
if (path1) {
   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(825, 1000));
if (path1) {
   spawn_times[3600] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(625, 575));
if (path1) {
   spawn_times[3780] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(675, 0));
if (path1) {
   spawn_times[3780] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(625, 575));
if (path1) {
   spawn_times[3780] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(75, 575));
if (path1) {
   spawn_times[3780] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 75));
if (path1) {
   spawn_times[3780] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(0, 375));
if (path1) {
   spawn_times[3780] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(575, 725));
if (path1) {
   spawn_times[3780] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 375));
if (path1) {
   spawn_times[3780] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(625, 575));
if (path1) {
   spawn_times[3780] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(1000, 425));
if (path1) {
   spawn_times[3780] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(0, 75));
if (path1) {
   spawn_times[3960] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(0, 75));
if (path1) {
   spawn_times[3960] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 425));
if (path1) {
   spawn_times[3960] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(1000, 425));
if (path1) {
   spawn_times[3960] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 825));
if (path1) {
   spawn_times[3960] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 925));
if (path1) {
   spawn_times[3960] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(75, 575));
if (path1) {
   spawn_times[3960] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(675, 0));
if (path1) {
   spawn_times[3960] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(1000, 125));
if (path1) {
   spawn_times[3960] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(75, 575));
if (path1) {
   spawn_times[3960] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 825));
if (path1) {
   spawn_times[4140] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(675, 0));
if (path1) {
   spawn_times[4140] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(1000, 825));
if (path1) {
   spawn_times[4140] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(675, 0));
if (path1) {
   spawn_times[4140] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(625, 575));
if (path1) {
   spawn_times[4140] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 125));
if (path1) {
   spawn_times[4140] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 425));
if (path1) {
   spawn_times[4140] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(575, 725));
if (path1) {
   spawn_times[4140] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(825, 1000));
if (path1) {
   spawn_times[4140] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(0, 375));
if (path1) {
   spawn_times[4140] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(75, 575));
if (path1) {
   spawn_times[4320] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(825, 1000));
if (path1) {
   spawn_times[4320] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(625, 1000));
if (path1) {
   spawn_times[4320] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(1000, 825));
if (path1) {
   spawn_times[4320] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(625, 575));
if (path1) {
   spawn_times[4320] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(675, 0));
if (path1) {
   spawn_times[4320] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 125));
if (path1) {
   spawn_times[4320] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(825, 1000));
if (path1) {
   spawn_times[4320] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 375));
if (path1) {
   spawn_times[4320] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(0, 875));
if (path1) {
   spawn_times[4320] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 825));
if (path1) {
   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(1000, 925));
if (path1) {
   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(675, 0));
if (path1) {
   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(625, 575));
if (path1) {
   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(1000, 425));
if (path1) {
   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(1000, 825));
if (path1) {
   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(375, 1000));
if (path1) {
   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(625, 575));
if (path1) {
   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(375, 1000));
if (path1) {
   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(375, 1000));
if (path1) {
   spawn_times[4500] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(1000, 925));
if (path1) {
   spawn_times[4680] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(575, 725));
if (path1) {
   spawn_times[4680] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(625, 575));
if (path1) {
   spawn_times[4680] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(0, 75));
if (path1) {
   spawn_times[4680] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 125));
if (path1) {
   spawn_times[4680] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(0, 75));
if (path1) {
   spawn_times[4680] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(0, 375));
if (path1) {
   spawn_times[4680] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 375), new Vertex(375, 1000));
if (path1) {
   spawn_times[4680] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(575, 275));
if (path1) {
   spawn_times[4680] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(575, 275));
if (path1) {
   spawn_times[4680] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(0, 75));
if (path1) {
   spawn_times[4860] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(1000, 125));
if (path1) {
   spawn_times[4860] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(1000, 425));
if (path1) {
   spawn_times[4860] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(1000, 125));
if (path1) {
   spawn_times[4860] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(575, 725));
if (path1) {
   spawn_times[4860] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(575, 725));
if (path1) {
   spawn_times[4860] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(1000, 825));
if (path1) {
   spawn_times[4860] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(825, 1000));
if (path1) {
   spawn_times[4860] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(625, 575));
if (path1) {
   spawn_times[4860] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(0, 875));
if (path1) {
   spawn_times[4860] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(625, 575));
if (path1) {
   spawn_times[5040] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(375, 1000));
if (path1) {
   spawn_times[5040] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(0, 875));
if (path1) {
   spawn_times[5040] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(675, 0));
if (path1) {
   spawn_times[5040] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 125));
if (path1) {
   spawn_times[5040] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(375, 1000));
if (path1) {
   spawn_times[5040] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(0, 875));
if (path1) {
   spawn_times[5040] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(375, 1000));
if (path1) {
   spawn_times[5040] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(375, 1000));
if (path1) {
   spawn_times[5040] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 125), new Vertex(1000, 425));
if (path1) {
   spawn_times[5040] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 775), new Vertex(825, 1000));
if (path1) {
   spawn_times[5220] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(625, 1000));
if (path1) {
   spawn_times[5220] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(625, 0), new Vertex(625, 575));
if (path1) {
   spawn_times[5220] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(1000, 75), new Vertex(675, 0));
if (path1) {
   spawn_times[5220] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(575, 275));
if (path1) {
   spawn_times[5220] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(1000, 925));
if (path1) {
   spawn_times[5220] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 425), new Vertex(1000, 425));
if (path1) {
   spawn_times[5220] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(0, 875));
if (path1) {
   spawn_times[5220] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(0, 925), new Vertex(825, 1000));
if (path1) {
   spawn_times[5220] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}

var path1:Array = map.graph.getShortestEdgePath(new Vertex(425, 1000), new Vertex(675, 0));
if (path1) {
   spawn_times[5220] = new Car (path1, map.graph.getVertexPathFromEdgePath(path1));
}
*/
		}
		
		//This needs to be run before we start spawning any cars
		public function initSpawnSchedule(game_state:GameState):void
		{
			this.game_state = game_state;
			for (var k in spawn_times)
			{
				
				for (var i:int = 0; i < (ArrayList)(spawn_times[k]).length; i++)
				{
					var car:Car =  (ArrayList)(spawn_times[k]).getItemAt(i);
					car.setGameState(game_state);
				}
			}
			active = true;
		}
		
		/*Want to change it later to return the vehicle to be spawned? (pushes responsibility to game state*/
		public function update():void
		{
			if (spawn_times[timer] != null)
			{
				for (var i:int = 0; i < (ArrayList)(spawn_times[timer]).length; i++)
				{
					var car:Car =  (ArrayList)(spawn_times[timer]).getItemAt(i);
					game_state.add(car);
					game_state.active_vehicles.push(car);
				}
			}
			
			timer++;
			//trace(timer);
		}
	}
}