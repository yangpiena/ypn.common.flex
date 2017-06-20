package org.ypn.common.flatSpark.components
{
	import org.ypn.common.flatSpark.events.MaxEvent;
	import org.ypn.common.flatSpark.events.MinEvent;
	import org.ypn.common.flatSpark.skins.ResizeTitleWindowSkin;
	
	import flash.events.MouseEvent;
	
	import org.ypn.common.flatSpark.skins.ResizeTitleWindowSkin;
	
	import mx.core.FlexGlobals;
	import mx.utils.BitFlagUtil;
	
	import spark.components.Button;
	import spark.components.TitleWindow;
	
	[Event(name="min", type="mx.events.MinEvent")]
	
	[Event(name="max", type="mx.events.MaxEvent")]
	
	public class ResizeTitleWindow extends TitleWindow
	{
		
		[SkinPart(required="false")] 
		public var minButton:Button;
		
		[SkinPart(required="false")] 
		public var maxButton:Button;
		
		//存储本组件当前的坐标（x、y）和大小（w，h）
		private var currentX:Number ;
		private var currentY:Number ;
		
		private var currentW:Number ;
		private var currentH:Number ;
		
		
		//存储本组件正常的坐标（x、y）和大小（w，h）
		private var normalX:Number ;
		private var normalY:Number ;
		
		private var normalW:Number ;
		private var normalH:Number ;
		
		//存储本组件上当前的窗口状态是否是最小化，
		//为了便于判断最大化窗口的操作(为了业务逻辑添加的辅助标识)
		
		//初始状态
		private var currentWinState:String="NORMAL";
		
		private var isWinExpanded:Boolean = true;
		
		public function ResizeTitleWindow()
		{
			super();  
		}
		
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName, instance);
			
			if (instance == minButton)
			{
				minButton.addEventListener(MouseEvent.MOUSE_DOWN, minButton_clickHandler);
			}
			else if (instance == maxButton)
			{
				maxButton.focusEnabled = false;
				maxButton.addEventListener(MouseEvent.CLICK, maxButton_clickHandler);  
			}
		}
		
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			
			if (instance == minButton)
				minButton.removeEventListener(MouseEvent.MOUSE_DOWN, minButton_clickHandler);
				
			else if (instance == maxButton)
				maxButton.removeEventListener(MouseEvent.CLICK, maxButton_clickHandler);
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			setStyle("skinClass", Class(org.ypn.common.flatSpark.skins.ResizeTitleWindowSkin));
		}
		
		protected function minButton_clickHandler(event:MouseEvent):void
		{
			currentX = this.x ;
			currentY = this.y ;
			currentW = this.width ;
			currentH = this.height;
			trace("最小化："+currentX+"|"+currentY+"|"+currentW+"|"+currentH)
			
			//flex4获取浏览器窗口高度：FlexGlobals.topLevelApplication.stage.stageHeight;
			
			//flex4获取浏览器窗口宽度：FlexGlobals.topLevelApplication.stage.stageHeight;
			var stageHeight:int = FlexGlobals.topLevelApplication.stage.stageHeight
			this.x = 50;
			this.y = stageHeight-35;
			this.height = 35;//this.titleDisplay.height ;
			this.width = 200;
			isWinExpanded = false;
			//this.minButton.visible = false ;
			this.minButton.enabled = false;
			trace("内容区：:"+this.contentGroup);
			if(this.contentGroup!=null){
				this.contentGroup.visible = false;
			}
			if(this.controlBarGroup!=null){
				this.controlBarVisible = false;
			}
			dispatchEvent(new MinEvent(MinEvent.MIN));
		}
		
		protected function maxButton_clickHandler(event:MouseEvent):void
		{
			
			this.minButton.enabled = true;
			trace("内容区："+this.contentGroup);
			if(this.contentGroup!=null){
				this.contentGroup.visible = true;
			}
			if(this.controlBarGroup!=null){
				this.controlBarVisible = true;
			}
			if(!isWinExpanded){
				
				
				this.x = currentX ;
				this.y = currentY ;
				this.width = currentW ;
				this.height = currentH ;
				isWinExpanded = true ;
				
				dispatchEvent(new MaxEvent(MaxEvent.MAX));
				return ;
				
			}else {
				if(currentWinState=="NORMAL"){
					normalX = this.x ;
					normalY = this.y ;
					normalW = this.width ;
					normalH = this.height;
					
					this.x = 0 ;
					this.y = 0;
					
					this.width = this.parent.width ;
					this.height = this.parent.height ;
					
					
					currentWinState = "MAX";
					isWinExpanded = true ;
					this.maxButton.setStyle("skinClass" ,Class(org.ypn.common.flatSpark.skins.ResizeTitleWindowRestoreButtonSkin));
					trace("MAX："+currentX+"|"+currentY+"|"+currentW+"|"+currentH);
					trace("MAX："+this.x+"|"+this.y+"|"+this.width+"|"+this.height+"|"+this.percentWidth+"|"+this.percentHeight);
					dispatchEvent(new MaxEvent(MaxEvent.MAX));
					return ;
				}else if(currentWinState=="MAX"){
					this.x = normalX ;
					this.y = normalY ;
					this.width = normalW ;
					this.height = normalH ;
								
					currentWinState = "NORMAL";
					isWinExpanded = true;
					this.maxButton.setStyle("skinClass" ,Class(org.ypn.common.flatSpark.skins.ResizeTitleWindowRestoreButtonSkin));
					trace("NORMAL"+currentX+"|"+currentY+"|"+currentW+"|"+currentH);
					dispatchEvent(new MaxEvent(MaxEvent.MAX));
					return ;
				}
				
			}
		}
		
	}
}