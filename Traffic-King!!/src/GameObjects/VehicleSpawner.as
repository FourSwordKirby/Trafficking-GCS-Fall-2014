package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;

	public class VehicleSpawner 
	{
		private var vehicles:Array;
		private var spawn_rate:int;
		private var position:FlxPoint;
		
		private var active:Boolean;
		private var timer:int;
		private var to_spawn_index:int;

		public function VehicleSpawner(X:int, Y:int) {
			this.vehicles = []; //Array of vehicles to spawn
			this.spawn_rate = 0; //Time between spawns
			this.position = FlxPoint(X, Y); //Position of vehicle spawner
			
			this.active = false; //Whether vehicle spawner is going to spawn vehicles or not
			this.timer = 0; //Time left to spawn
			this.to_spawn_index = 0; //Next index to spawn in vehicles
		}
		
		//Sets the next wave's vehicles and spawn rates during setup phase
		public function reinitialize(vehicles:Array, spawn_rate:int) {
			this.vehicles = vehicles;
			this.spawn_rate = spawn_rate;
			
			this.active = false;
			this.timer = spawn_rate;
			this.to_spawn_index = 0;
		}
		
		//Starts the spawning of vehicles at beginning of wave
		public function startSpawn() {
			this.active = true;
		}
		
		override public function update() {
			if (this.active) {
				this.timer--;
				
				if (this.timer == 0) {
					//spawn vehicle
					this.timer = this.spawn_rate;
					this.to_spawn_index++;
					
					if (this.vehicles.length = this.to_spawn_index) {
						this.active = false;
					}
				}
			}
		}
		
	}

}