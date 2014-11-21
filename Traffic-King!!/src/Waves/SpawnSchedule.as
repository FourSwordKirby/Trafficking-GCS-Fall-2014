package Waves 
{
	import flash.utils.Dictionary;
	import org.flixel.FlxPoint;
	import org.flixel.FlxPath;
	import org.flixel.FlxState;
	import Vehicles.Car;
	import Maps.Map;
	
	public class SpawnSchedule 
	{
		private var spawn_times:Dictionary;	//This is a collection of spawns
		private var game_state:FlxState;	//This needs to be initialized before we can start spawning cars
		private var active:Boolean;
		private var timer:int;
		
		//Eventually we want the schedule file name be such so that we can easily adjust when vehicles spawn
		public function SpawnSchedule(X:int, Y:int, direction:int, scheduleFileName:String, map:Map)
		{
			spawn_times = new Dictionary();
			
			var vertices:Array = map.graph.getVertices();
			
			var path1:Array = map.graph.getShortestPath(vertices[0], vertices[vertices.length-1]);
			spawn_times[0] = new Car(path1[0].getSource().x - 25, path1[0].getSource().y - 25);
			
			var path1node:Array = [new FlxPoint(path1[0].getSource().x, path1[0].getSource().y)];
			for (var i:int = 0; i < path1.length; i++)
			{
				path1node.push(new FlxPoint(path1[i].getDestination().x, path1[i].getDestination().y));
			}
			spawn_times[0].followPath(new FlxPath(path1node));
			
			//spawn_times[0] = new Car(10, 10);
			//spawn_times[20] = new Car(20, 10);
			//spawn_times[40] = new Car(40, 10);
		}
		
		public function initSpawnSchedule(game_state:FlxState):void
		{
			this.game_state = game_state;
			active = true;
		}
		
		/*Want to change it later to return the vehicle to be spawned? (pushes responsibility to game state*/
		public function update():void
		{
			if (spawn_times[timer] != null)
			{
				game_state.add(spawn_times[timer]);
			}
			
			timer++;
			trace(timer);
		}
	}
}