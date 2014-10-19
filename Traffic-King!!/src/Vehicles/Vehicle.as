package Vehicles 
{
	import adobe.utils.CustomActions;
	import Graph.DirectedEdge;
	import Graph.Vertex;
	import mx.collections.ArrayList;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author sophia
	 */ 
	public class Vehicle extends FlxSprite 
	{
		private var stopped:Boolean;
		private static var follow_distance:int;

		private var location:FlxPoint;
		private var direction:int;
		
		private var destination:FlxPoint;
		
		//this is an arraylist of edges that details the path the car is following to get to it's destination.
		private var planned_path:ArrayList;
		private var current_road:DirectedEdge;
		
		/* this is the game state that the car is in, used to make the car stop if cars in front
		 * of it are stopped etc.
		 */
		private var game:GameState;
		
		public function Vehicle(X:int, Y:int, maxSpeed:int,destination:Vertex, game:GameState) 
		{
			super(X, Y); 
			this.maxVelocity.x = maxSpeed;
			this.maxVelocity.y = maxSpeed;
			this.destination = destination;
			this.direction = Parameters.DIRECTION_SOUTH;
			
			/* the car upon initilization will generate the path it needs to travel?
			this.path = */
			this.game = game;
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
			switch (this.direction)
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
			}
			
			for each (var vehicle:Vehicle in game.getVehciles().members)
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
			}
			
			
		}
	}
}