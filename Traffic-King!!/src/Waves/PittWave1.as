package Waves {
	import flash.display.LineScaleMode;
	import flash.utils.Dictionary;
	import Maps.PittMap;

	public class PittWave1 extends Wave
	{	
		public function PittWave1()
		{
			super();
			map = new PittMap();
			spawn_schedule = new SpawnSchedule(0, 0, Parameters.DIRECTION_EAST, "Pittsburgh", map);
			
			wave_map_name = "Pittsburgh";
			wave_name = "Wave 1";
		}
	}

}