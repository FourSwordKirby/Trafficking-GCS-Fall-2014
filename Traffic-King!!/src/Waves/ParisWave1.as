package Waves {
	import flash.display.LineScaleMode;
	import flash.utils.Dictionary;
	import Maps.PittMap;

	public class ParisWave1 extends Wave
	{	
		public function ParisWave1()
		{
			super();
			map = new PittMap();
			
			spawn_schedule = new SpawnSchedule(0, 0, Parameters.DIRECTION_EAST, "Paris", map);
			
			wave_map_name = "Paris";
			wave_name = "Wave 1";
		}
	}

}