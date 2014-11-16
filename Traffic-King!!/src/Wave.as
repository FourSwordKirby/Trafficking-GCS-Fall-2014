package  
{
	import flash.display.LineScaleMode;
	/**
	 * ...
	 * @author Mountain Dew
	 */
	public class Wave extends FlxBasic
	{
		//private var objective_score:int;
		private var vehicles:Array; //Array of vehicle types
		private var spawn_rate:Array;
		private var time_limit:int;
		
		private var map:Map;
		
		private var timer:int;
		private var score:int;
		private var status:int; //0: Not started, 1: In progress, 2: Finished, 3: Failed
		
		public function Wave(vehicles, spawn_rate, time_limit)
		{
			this.vehicles = vehicles;
			this.spawn_rate = spawn_rate;
			this.time_limit = time_limit;
			
			//Create or put in map here
			
			this.timer = time_limit;
			this.vehicles_left = this.vehicles.length;
			this.score = 0;
			this.status = -1;	
		}
		
		public function startWave() {
			this.status = 0;
		}
		
		/*override public function update()
		{
			if (this.vehicles_left == 0)
			{
				this.status = 2;
			}
			else if (timer == 0) {
				this.status = 3;
			}
			else {
				this.timer--;
			}
		}*/
		
	}

}