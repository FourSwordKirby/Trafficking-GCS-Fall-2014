package Waves {
	import flash.display.LineScaleMode;
	import flash.utils.Dictionary;
	import Maps.PittMap;

	public class NYWave1 extends Wave
	{	
		public function NYWave1()
		{
			super();
			map = new PittMap();
			spawner_times = new Dictionary();
			
			spawner_times[Parameters.PITTSBURGH_BASE] = new SpawnSchedule(0, 0, Parameters.DIRECTION_EAST, "file name here", map);
			
			wave_map_name = "New York";
			wave_name = "Wave 1";
		}
	}

}