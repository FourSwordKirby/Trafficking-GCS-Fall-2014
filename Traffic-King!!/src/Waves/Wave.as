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
		protected var spawner_times:Dictionary;	//This is a dictionary of spawntime schedules
		
		protected var status:int;
		
		protected var wave_map_name:String;
		protected var wave_name:String;
		
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
		
		public function getMap():Map
		{
			return map;
		}
		
		public function getAllSpawnSchedules():Dictionary
		{
			return (this.spawner_times);
		}
		
		public function getWaveMapName():String
		{
			return this.wave_map_name;
		}
		
		public function getWaveName():String
		{
			return this.wave_name;
		}

	}
}