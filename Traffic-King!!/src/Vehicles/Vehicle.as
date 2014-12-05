package Vehicles 
{
	import adobe.utils.CustomActions;
	import Graph.DirectedEdge;
	import Graph.Vertex;
	import mx.collections.ArrayList;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	import States.GameState;
	/**
	 * ...
	 * @author sophia
	 */ 
	public class Vehicle extends FlxSprite 
	{
		private var stopped:Boolean;
		private static var follow_distance:int;

		protected var location:FlxPoint;
		public var direction:int;
		public var destination:Vertex;
		
		//this is an arraylist of edges that details the path the car is following to get to its destination.
		protected var planned_path:Array;
		public var current_road:DirectedEdge;
		
		/* this is the game state that the car is in, used to make the car stop if cars in front
		 * of it are stopped etc.
		 */
		protected var game_state:GameState;
		
		public function Vehicle(X:int, Y:int,/*path:Array,*/maxSpeed:int)//destination:Vertex) 
		{
			super(X, Y); 
			this.maxVelocity.x = maxSpeed;
			this.maxVelocity.y = maxSpeed;
			//this.destination = destination;
			this.direction = Parameters.DIRECTION_SOUTH;
			
			/* the car upon initilization will generate the path it needs to travel?
			this.path = */
		}
		
		public function isStopped():Boolean
		{
			return stopped;
		}
		
		public function getLocation():FlxPoint
		{
			return location;
		}
		
		public function getNextDir(direction:int):void
		{
			
		}
		
		public function setGameState(game_state:GameState):void 
		{
			this.game_state = game_state;
		}
		
		public function getCurrentRoad():DirectedEdge 
		{
			return this.current_road;
		}
		
		public override function update():void
		{	
			if(this.current_road != this.planned_path[this._pathNodeIndex-1])
				this.current_road = this.planned_path[this._pathNodeIndex-1];
		}
	}
}