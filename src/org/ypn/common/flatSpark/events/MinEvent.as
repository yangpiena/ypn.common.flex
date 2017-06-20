package org.ypn.common.flatSpark.events
{
	import flash.events.Event;
	
	public class MinEvent extends Event
	{
		
		public static const MIN:String = "min";
		public var detail:int;
		
		public function MinEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false ,detail:int = -2)
		{
			super(type, bubbles, cancelable);
			this.detail = detail;
		}
		
		override public function clone():Event
		{
			return new MinEvent(type, bubbles, cancelable, detail);
		}
	}
}