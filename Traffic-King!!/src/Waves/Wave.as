package Waves {
	import flash.utils.Dictionary;
	import Maps.Map;
	
	/**
	 * ...
	 * @author Mountain Dew
	 */
	public class Wave
	{
		protected var time_limit:int;
		
		protected var map:Map;
		protected var timer:int;
		protected var score:int;		
		public var spawner_times:Dictionary;	//This is a dictionary of spawntime schedules
		
		protected var status:int;
		
		public function Wave()
		{
			this.timer = 0;
			this.score = 0;
			this.spawner_times = new Dictionary();
			
			this.status = Parameters.WAVE_NOT_STARTED;
		}
		
		public function startWave():void
		{
			this.status = Parameters.WAVE_IN_PROGRESS;
		}
		
		/*
		public function update()
		{
			if (this.vehicles_left == 0)
			{
				this.status = Parameters.WAVE_COMPLETED;
			}
			else if (timer == 0) {
				this.status = Parameters.WAVE_FAILED;
			}
			else {
				this.timer--;
			}
		}
		*/
		
		public function getMap():Map
		{
			return map;
		}
		
	}

}