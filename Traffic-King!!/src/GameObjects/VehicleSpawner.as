package GameObjects
{
	import org.flixel.*;
	import Vehicles.Car;
	import Waves.SpawnSchedule;

	public class VehicleSpawner extends FlxBasic
	{
		private var location_name:String;	//used to assist with dictionaries
		
		private var vehicles:Array;
		private var position:FlxPoint;
		private var game_state:FlxState;
		
		private var spawn_schedule:SpawnSchedule;
		
		private var timer:int;

		public function VehicleSpawner(X:int, Y:int, location_name:String) 
		{
			this.location_name = location_name;
			
			this.vehicles = []; //Array of vehicles to spawn
			this.spawn_rate = 0; //Time between spawns
			this.position = new FlxPoint(X, Y); //Position of vehicle spawner
			
			this.active = false; //Whether vehicle spawner is going to spawn vehicles or not
			this.timer = 0; //Time left to spawn
			this.to_spawn_index = 0; //Next index to spawn in vehicles
		}
		
		/*This function MUST be called before starting the game because it starts spawning the cars*/
		public function initSpawner(game_state:FlxState):void
		{
			this.game_state = game_state;
			active = true;
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
				game_state.add(car);
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