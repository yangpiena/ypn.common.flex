package org.ypn.common.components
{
import flash.display.DisplayObject;
import flash.display.Shape;

import mx.controls.DataGrid;
import mx.controls.dataGridClasses.DataGridColumn;
import mx.controls.dataGridClasses.DataGridListData;
import mx.controls.listClasses.IDropInListItemRenderer;
import mx.controls.listClasses.IListItemRenderer;
import mx.core.EdgeMetrics;
import mx.core.UIComponent;
import mx.core.mx_internal;
use namespace mx_internal;

public class DataGridTotal extends UIComponent
{

	public function DataGridTotal()
	{
		super();
	}

	protected var overlay:Shape;
	protected var dataGrid:DataGrid;

	/**
	 *  create the actual border here
	 */
	override protected function createChildren():void
	{
		dataGrid = parent as DataGrid;
		overlay  = new Shape();
		
		addChild(overlay);
	}

	/**
	 *	lay it out
	 */
	override protected function updateDisplayList(w:Number, h:Number):void
	{
		overlay.graphics.clear();

		// destroy the old children
		while (numChildren > 1)
			removeChildAt(1);

		// make new ones
		var cols:Array = dataGrid.columns;
		var firstCol:int = dataGrid.horizontalScrollPosition;
		var colIndex:int = 0;
		var n:int = cols.length;
		var i:int = 0;
		
		while (colIndex < firstCol)
		{
			// find first visible column;
			if (cols[i++].visible)
				colIndex ++;
		}
		
		var vm:EdgeMetrics = dataGrid.viewMetrics;
        var lineCol:uint = dataGrid.getStyle("verticalGridLineColor");
        var vlines:Boolean = dataGrid.getStyle("verticalGridLines");
		
		overlay.graphics.lineStyle(1, lineCol);

		var xx:Number = 0;
		var yy:Number = 0;
		
		while (xx < w)
		{
			var col:DataGridColumn = cols[i++];

			if (col is TotalDataGridColumn)
			{
				var fdgc:TotalDataGridColumn = col as TotalDataGridColumn;
				fdgc.totalColumn.owner = fdgc.owner;
				var renderer:IListItemRenderer = (fdgc.totalColumn.itemRenderer) ? 
					                              fdgc.totalColumn.itemRenderer.newInstance() : 
												  dataGrid.itemRenderer.newInstance();
				renderer.styleName = fdgc.totalColumn;
				if (renderer is IDropInListItemRenderer)
				{
					IDropInListItemRenderer(renderer).listData = new DataGridListData((fdgc.totalColumn.labelFunction != null) ? fdgc.totalColumn.labelFunction(col) 
																						: fdgc.totalColumn.headerText, 
															fdgc.dataField, i - 1, null, 
															dataGrid, -1);
				}
				renderer.data = fdgc;
				addChild(DisplayObject(renderer));
				renderer.x = xx;
				renderer.y = yy;
				renderer.setActualSize(col.width - 1, dataGrid.rowHeight);
				if (vlines)
				{
					overlay.graphics.moveTo(xx + col.width, yy);
					overlay.graphics.lineTo(xx + col.width, h);
				}
			}
			xx += col.width;
		}
        lineCol = dataGrid.getStyle("horizontalGridLineColor");
        if (dataGrid.getStyle("horizontalGridLines"))
		{
			overlay.graphics.lineStyle(1, lineCol);
			overlay.graphics.moveTo(0, yy);
			overlay.graphics.lineTo(w, yy);
		}

		// draw separator at top of footer
        lineCol = dataGrid.getStyle("borderColor");
		overlay.graphics.lineStyle(1, lineCol);
		overlay.graphics.moveTo(0, 0);
		overlay.graphics.lineTo(w, 0);

	}

}

}