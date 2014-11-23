package PlayerInfo 
{
	/**
	 * ...
	 * @author Roger Liu (>'_')>
	 */
	public class Player 
	{
		public var score:int;
		public var funds:int;
		public var name:String;
		
		public function Player() 
		{
			this.score = 0;
			this.funds = 0;
			this.name = "GenericPlayer";
		}
		
		/*public function Player(Name:String)
		{
			this.score = 0;
			this.funds = 0;
			this.name = Name;
		} */
		
		public function getScore():int
		{
			return this.score;
		}
		
		public function getFunds():int
		{
			return this.funds;
		}
		
		public function getName():String
		{
			return this.name;
		}
		
		public function increaseScore(amount:int):void
		{
			this.score += amount;
		}
		
		public function changeFunds(amount:int):void
		{
			this.funds += amount;
		}
		
	}

}