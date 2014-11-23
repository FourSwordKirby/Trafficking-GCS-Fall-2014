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
		protected var game:GameState;
		
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
		
		public function getCurrentRoad():DirectedEdge 
		{
			return this.current_road;
		}
		
		public override function update():void
		{	
			
			if(this.current_road != this.planned_path[this._pathNodeIndex])
				this.current_road = this.planned_path[this._pathNodeIndex];
				
				
			/*
			if (this.velocity.x > 0)
				this.direction = Parameters.DIRECTION_EAST;
			if (this.velocity.y > 0)
				this.direction = Parameters.DIRECTION_SOUTH;
			if (this.velocity.x < 0)
				this.direction = Parameters.DIRECTION_WEST;
			if (this.velocity.y < 0)
				this.direction = Parameters.DIRECTION_NORTH;
			*/
			/*switch (this.direction)
			{
				case Parameters.DIRECTION_NORTH:
					this.acceleration.y = -2;
					break;	
				case Parameters.DIRECTION_EAST:
					this.acceleration.x = 2;
					break;
				case Parameters.DIRECTION_SOUTH:
					this.acceleration.y = 2;
					break;
				case Parameters.DIRECTION_WEST:
					this.acceleration.x = -2;
					break;
			}*/
			
			/*for each (var vehicle:Vehicle in game.getVehicles().members)
			{
				if (current_road.equals(vehicle.current_road))
				{
					switch (this.direction)
					{
						case Parameters.DIRECTION_NORTH:
							if (vehicle.y - this.y >= 0 && vehicle.y - this.y <= follow_distance)
								this.velocity.y = vehicle.velocity.y;
							break;	
						case Parameters.DIRECTION_EAST:
							if (vehicle.x - this.x >= 0 && vehicle.x - this.x <= follow_distance)
								this.velocity.x = vehicle.velocity.x;
							break;
						case Parameters.DIRECTION_SOUTH:
							if (this.y - vehicle.y >= 0 && this.y-vehicle.y <= follow_distance)
								this.velocity.y = vehicle.velocity.y;
							break;
						case Parameters.DIRECTION_WEST:
							if (this.x - vehicle.x >= 0 && this.x-vehicle.x <= follow_distance)
								this.velocity.x = vehicle.velocity.x;
							break;
					}
				}
			}*/
		}
	}
}