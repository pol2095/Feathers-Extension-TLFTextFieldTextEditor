/*
Copyright 2017 pol2095. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package fl.extensions.text
{
	import flash.geom.Point;
	import flashx.textLayout.compose.IFlowComposer;
	import flashx.textLayout.compose.TextFlowLine;
	import fl.text.TLFTextField;
	
	public class TLFTextField extends fl.text.TLFTextField
	{
		public function TLFTextField()
		{
			super();
		}
		
		override public function getCharIndexAtPoint(x:Number, y:Number) : int
		{
			var globalPoint:Point = this.localToGlobal(new Point(x, y));

			var flowComposer:IFlowComposer = this.textFlow.flowComposer;

			for (var i:int = 0; i < flowComposer.numLines; i++){ 

				var textFlowLine:TextFlowLine = flowComposer.getLineAt(i);

				if (y >= textFlowLine.y && y < textFlowLine.height + textFlowLine.y)
				{
					return textFlowLine.absoluteStart 
						 + textFlowLine.getTextLine(true)
							 .getAtomIndexAtPoint(globalPoint.x, globalPoint.y);
				}
			}

			return -1;
		}
		
		override public function getLineIndexAtPoint(pointX:Number, pointY:Number) : int 
		{

			var globalPoint:Point = this.localToGlobal(new Point(pointX, pointY));

			var flowComposer:IFlowComposer = this.textFlow.flowComposer;

			for (var i:int = 0; i < flowComposer.numLines; i++){ 

				var textFlowLine:TextFlowLine = flowComposer.getLineAt(i);

				if (pointY >= textFlowLine.y && pointY < textFlowLine.height + textFlowLine.y)
				{
					return i;
				}
			}
			return -1;
		}
	}
}