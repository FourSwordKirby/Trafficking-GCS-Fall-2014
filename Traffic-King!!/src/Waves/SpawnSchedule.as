package Waves 
{
	import GameObjects.VehicleSpawner;
	import flash.utils.Dictionary;
	import org.flixel.FlxState;
	import Vehicles.Car;
	
	public class SpawnSchedule 
	{
		private var spawn_times:Dictionary;	//This is a collection of spawns
		private var game_state:FlxState;	//This needs to be initialized before we can start spawning cars
		private var active:Boolean;
		private var timer:int;
		
		//Eventually we want the schedule file name be such so that we can easily adjust when vehicles spawn
		public function SpawnSchedule(X:int, Y:int, direction:int, scheduleFileName:String)
		{
			spawn_times = new Dictionary();
			
			spawn_times[0] = new Car(10, 10);
			spawn_times[20] = new Car(20, 10);
			spawn_times[40] = new Car(40, 10);
		}
		
		public function initSpawnSchedule(game_state:FlxState):void
		{
			this.game_state = game_state;
			active = true;
		}
		
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