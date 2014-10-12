package  
{
	public final class Parameters 
	{
		public static const TILE_WIDTH:int = 50;
		public static const TILE_HEIGHT:int = 50;
		public static const SCREEN_WIDTH:int = 600; 
		public static const SCREEN_HEIGHT:int = 600; 
		
		public static const DEADZONE_WIDTH:int = SCREEN_WIDTH * 0.875;
		public static const DEADZONE_HEIGHT:int = SCREEN_HEIGHT * 0.875;
		
		public static const LIGHT_GREEN:int = 0;
		public static const LIGHT_YELLOW:int = 1;
		public static const LIGHT_RED:int = 2;
		
		public static const LIGHT_YELLOW_TRANSITION_TIME:int = 15;	//This is 1/2 a second that the light lingers on yellow
		
		public static const DIRECTION_NORTH:int = 0;
		public static const DIRECTION_EAST:int = 1;
		public static const DIRECTION_SOUTH:int = 2;
		public static const DIRECTION_WEST:int = 3;
		
		//These specify how the traffic lights at an intersection are arranged
		public static const ARRANGEMENT_NESW:int = 0;
		public static const ARRANGEMENT_NES:int = 1;
		public static const ARRANGEMENT_ESW:int = 2;
		public static const ARRANGEMENT_SWN:int = 3;
		public static const ARRANGEMENT_WNE:int = 4;
	}
}