package Graph 
{
	/**
	 * ...
	 * @author Mountain Dew
	 */
	//Very basic array-based implementation of priority queue because AS3's builtins suck
	//Every element of queue is an array of length 2 where the first element is an object and the second element is its priority
	public class PriorityQueue 
	{
		private var queue:Array;
		
		public function PriorityQueue()
		{
			this.queue = [];
		}
		
		public function isEmpty():Boolean
		{
			return (this.queue.length == 0);
		}
		
		public function addObject(object:Object, priority:Number):void
		{
			var minIndex = -1;
			var maxIndex = this.queue.length;
			var midIndex;
			
			while (minIndex + 1 < maxIndex)
			{
				midIndex = int((minIndex + maxIndex) / 2);
				
				if (this.queue[midIndex][1] >= priority)
				{
					maxIndex = midIndex;
				}
				else
				{
					minIndex = midIndex;
				}
			}
			
			this.queue.splice(minIndex + 1, 0, [object, priority]);
		}
		
		public function removeSmallest():Object
		{
			if (queue.length > 0)
			{
				var result = this.queue.splice(0, 1)[0][0];
				return result;
			}
			else {
				return null;
			}
		}
	}
}