package Waves {
	import flash.display.LineScaleMode;
	import Maps.PittMap;
	/**
	 * ...
	 * @author Mountain Dew
	 */
	public class PittWave1 extends Wave
	{	
		public function PittWave1()
		{
			map = new PittMap();
			//spawner_times[map.vehicle_spawner_group] = new SpawnSchedule(0,0,Parameters.DIRECTION_EAST,"file name here");
			super();
		}
	}

}