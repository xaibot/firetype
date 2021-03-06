/* 
'firetype' is an ActionScript 3 library which loads font files and renders characters via the GPU. 
Copyright �2013 Max Knoblich 
www.maxdid.it 
me@maxdid.it 
 
This file is part of 'firetype' by Max Did It. 
  
'firetype' is free software: you can redistribute it and/or modify 
it under the terms of the GNU Lesser General Public License as published by 
the Free Software Foundation, either version 3 of the License, or 
(at your option) any later version. 
  
'firetype' is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
GNU Lesser General Public License for more details. 
 
You should have received a copy of the GNU Lesser General Public License 
along with 'firetype'.  If not, see <http://www.gnu.org/licenses/>. 
*/ 
 
package de.maxdidit.hardware.font.data.tables.advanced.gpos.shared  
{ 
	import de.maxdidit.hardware.font.data.tables.common.device.DeviceTableData; 
	/** 
	 * ... 
	 * @author Max Knoblich 
	 */ 
	public class ValueRecord  
	{ 
		/////////////////////// 
		// Member Fields 
		/////////////////////// 
		 
		private var _xPlacement:int = 0; 
		private var _yPlacement:int = 0; 
		 
		private var _xAdvance:int = 0; 
		private var _yAdvance:int = 0; 
		 
		private var _xPlacementDeviceOffset:uint = 0; 
		private var _yPlacementDeviceOffset:uint = 0; 
		 
		private var _xAdvanceDeviceOffset:uint = 0; 
		private var _yAdvanceDeviceOffset:uint = 0; 
		 
		private var _xPlacementDeviceTable:DeviceTableData; 
		private var _yPlacementDeviceTable:DeviceTableData; 
		private var _xAdvanceDeviceTable:DeviceTableData; 
		private var _yAdvanceDeviceTable:DeviceTableData; 
		 
		/////////////////////// 
		// Constructor 
		/////////////////////// 
		 
		public function ValueRecord()  
		{ 
			 
		} 
		 
		/////////////////////// 
		// Member Properties 
		/////////////////////// 
		 
		public function get xPlacement():int  
		{ 
			return _xPlacement; 
		} 
		 
		public function set xPlacement(value:int):void  
		{ 
			_xPlacement = value; 
		} 
		 
		public function get yPlacement():int  
		{ 
			return _yPlacement; 
		} 
		 
		public function set yPlacement(value:int):void  
		{ 
			_yPlacement = value; 
		} 
		 
		public function get xAdvance():int  
		{ 
			return _xAdvance; 
		} 
		 
		public function set xAdvance(value:int):void  
		{ 
			_xAdvance = value; 
		} 
		 
		public function get yAdvance():int  
		{ 
			return _yAdvance; 
		} 
		 
		public function set yAdvance(value:int):void  
		{ 
			_yAdvance = value; 
		} 
		 
		public function get xPlacementDeviceOffset():uint  
		{ 
			return _xPlacementDeviceOffset; 
		} 
		 
		public function set xPlacementDeviceOffset(value:uint):void  
		{ 
			_xPlacementDeviceOffset = value; 
		} 
		 
		public function get yPlacementDeviceOffset():uint  
		{ 
			return _yPlacementDeviceOffset; 
		} 
		 
		public function set yPlacementDeviceOffset(value:uint):void  
		{ 
			_yPlacementDeviceOffset = value; 
		} 
		 
		public function get xAdvanceDeviceOffset():uint  
		{ 
			return _xAdvanceDeviceOffset; 
		} 
		 
		public function set xAdvanceDeviceOffset(value:uint):void  
		{ 
			_xAdvanceDeviceOffset = value; 
		} 
		 
		public function get yAdvanceDeviceOffset():uint  
		{ 
			return _yAdvanceDeviceOffset; 
		} 
		 
		public function set yAdvanceDeviceOffset(value:uint):void  
		{ 
			_yAdvanceDeviceOffset = value; 
		} 
		 
		public function get xPlacementDeviceTable():DeviceTableData  
		{ 
			return _xPlacementDeviceTable; 
		} 
		 
		public function set xPlacementDeviceTable(value:DeviceTableData):void  
		{ 
			_xPlacementDeviceTable = value; 
		} 
		 
		public function get yPlacementDeviceTable():DeviceTableData  
		{ 
			return _yPlacementDeviceTable; 
		} 
		 
		public function set yPlacementDeviceTable(value:DeviceTableData):void  
		{ 
			_yPlacementDeviceTable = value; 
		} 
		 
		public function get xAdvanceDeviceTable():DeviceTableData  
		{ 
			return _xAdvanceDeviceTable; 
		} 
		 
		public function set xAdvanceDeviceTable(value:DeviceTableData):void  
		{ 
			_xAdvanceDeviceTable = value; 
		} 
		 
		public function get yAdvanceDeviceTable():DeviceTableData  
		{ 
			return _yAdvanceDeviceTable; 
		} 
		 
		public function set yAdvanceDeviceTable(value:DeviceTableData):void  
		{ 
			_yAdvanceDeviceTable = value; 
		} 
		 
	} 
} 
