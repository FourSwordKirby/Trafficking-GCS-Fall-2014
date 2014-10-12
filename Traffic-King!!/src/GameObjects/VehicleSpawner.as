package GameObjects
{
	import org.flixel.*;
	import Vehicles.Car;

	public class VehicleSpawner extends FlxBasic
	{
		private var vehicles:Array;
		private var spawn_rate:int;
		private var position:FlxPoint;
		private var state:FlxState;
		
		//spawning variable is inherited active variable
		private var timer:int;
		private var to_spawn_index:int;

		public function VehicleSpawner(X:int, Y:int, state:FlxState) {
			this.vehicles = []; //Array of vehicles to spawn
			this.spawn_rate = 0; //Time between spawns
			this.position = new FlxPoint(X, Y); //Position of vehicle spawner
			this.state = state;
			
			this.active = false; //Whether vehicle spawner is going to spawn vehicles or not
			this.timer = 0; //Time left to spawn
			this.to_spawn_index = 0; //Next index to spawn in vehicles
		}
		
		public function getVehicles():Array {
			return this.vehicles;
		}
		
		public function getSpawnRate():int {
			return this.spawn_rate;
		}
		
		public function getPosition():FlxPoint {
			return this.position;
		}
		
		public function isSpawning():Boolean {
			return this.active;
		}
		
		public function getTimer():int {
			return this.timer;
		}
		
		public function getToSpawnIndex():int {
			return this.to_spawn_index;
		}
		
		//Sets the next wave's vehicles and spawn rates during setup phase
		//spawn_rate > 0
		public function reinitialize(vehicles:Array, spawn_rate:int):void {
			this.vehicles = vehicles;
			this.spawn_rate = spawn_rate;
			
			this.active = false;
			this.timer = this.spawn_rate - 1;
			this.to_spawn_index = 0;
		}
		
		//Starts the spawning of vehicles at beginning of wave
		public function startSpawning():void {
			this.active = true;
		}
		
		override public function update():void {
			if (this.timer == 0) {
				var car:Car = new Car(this.position.x, this.position.y + (this.to_spawn_index * 20));
				state.add(car);
				this.timer = this.spawn_rate - 1;
				this.to_spawn_index++;
				
				if (this.vehicles.length == this.to_spawn_index) {
					this.active = false;
				}
			}
			else {
				this.timer--;
			}
		}
		
	}

}