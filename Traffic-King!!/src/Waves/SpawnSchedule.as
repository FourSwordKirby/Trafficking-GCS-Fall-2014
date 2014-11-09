package Waves 
{
	import GameObjects.VehicleSpawner;
	import mx.collections.ArrayList;
	import Vehicles.Car;
	
	public class SpawnSchedule 
	{
		private var spawn_times:Dictionary;	//This is a collection of spawns
		private var spawn_source:VehicleSpawner;
		
		public function SpawnSchedule(X:int, Y:int, direction:int, scheduleFileName:String)
		{
			spawn_times[0] = new Car(10, 10);
			spawn_times[20] = new Car(10, 10);
			spawn_times[40] = new Car(10, 10);
		}
		
		public function getNextTime()
		{
			return (Spawn)(spawn_times.getItemAt(0)).getTime();
		}
		
		public function spawnVehicle()
		{
			return (Spawn)(spawn_times.getItemAt(0)).getVehicle();
		}
	}
}