package Waves {
	import flash.display.LineScaleMode;
	import flash.utils.Dictionary;
	import Maps.PittMap;

	public class TokyoWave1 extends Wave
	{	
		public function TokyoWave1()
		{
			super();
			map = new PittMap();
			spawn_schedule = new SpawnSchedule(0, 0, Parameters.DIRECTION_EAST, "Tokyo", map);
			
			wave_map_name = "Tokyo";
			wave_name = "Wave 1";
		}
	}

}