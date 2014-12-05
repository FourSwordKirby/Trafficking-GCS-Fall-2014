package Waves {
	import flash.display.LineScaleMode;
	import flash.utils.Dictionary;
	import Maps.PittMap;

	public class BeijingWave1 extends Wave
	{	
		public function BeijingWave1()
		{
			super();
			map = new PittMap();
			spawner_times = new Dictionary();
			
			spawner_times[Parameters.PITTSBURGH_BASE] = new SpawnSchedule(0, 0, Parameters.DIRECTION_EAST, "file name here", map);
			
			wave_map_name = "Beijing";
			wave_name = "Wave 1";
		}
	}

}