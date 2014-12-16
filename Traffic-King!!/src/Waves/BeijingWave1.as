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
			spawn_schedule = new SpawnSchedule(0, 0, Parameters.DIRECTION_EAST, "Beijin", map);
			
			wave_map_name = "Beijing";
			wave_name = "Wave 1";
		}
	}

}