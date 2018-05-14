package org.ypn.common.components
{
	import mx.controls.DataGrid;
	
	public class TotalDataGrid extends DataGrid
	{
		public function TotalDataGrid()
		{
			super();
		}
		
		protected var total:DataGridTotal;
		protected var footerHeight:int = 22;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			if (!total)
			{
				total = new DataGridTotal();
				total.styleName = this;
				addChild(total);
			}
		}
		
		override protected function adjustListContent(unscaledWidth:Number=-1, unscaledHeight:Number=-1):void
		{
			super.adjustListContent(unscaledWidth, unscaledHeight);
			
			listContent.setActualSize(listContent.width, listContent.height - footerHeight);
			total.setActualSize(listContent.width, footerHeight);
			total.move(listContent.x, listContent.y + listContent.height + 1);
		}
		
		override public function invalidateDisplayList():void
		{
			super.invalidateDisplayList();
			if (total)
				total.invalidateDisplayList();
		}
		
		
	}
}