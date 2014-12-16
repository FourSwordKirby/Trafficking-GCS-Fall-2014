package Waves {
	import flash.display.LineScaleMode;
	import flash.utils.Dictionary;
	import Maps.PittMap;

	public class LondonWave1 extends Wave
	{	
		public function LondonWave1()
		{
			super();
			map = new PittMap();
			spawn_schedule = new SpawnSchedule(0, 0, Parameters.DIRECTION_EAST, "London", map);
			
			wave_map_name = "London";
			wave_name = "Wave 1";
		}
	}

}