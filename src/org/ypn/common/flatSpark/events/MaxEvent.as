package org.ypn.common.flatSpark.events
{
	import flash.events.Event;
	
	public class MaxEvent extends Event
	{
		public static const MAX:String = "max";
		public var detail:int;
		
		
		public function MaxEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false ,detail:int = -3)
		{
			super(type, bubbles, cancelable);
			this.detail = detail;
		}
		
		
		override public function clone():Event
		{
			return new MaxEvent(type, bubbles, cancelable, detail);
		}
		
		
		
	}
}