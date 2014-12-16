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
			spawn_schedule = new SpawnSchedule(0, 0, Parameters.DIRECTION_EAST, "New York", map);
			
			wave_map_name = "New York";
			wave_name = "Wave 1";
		}
	}

}