package de.maxdidit.hardware.font.data.tables.advanced.gpos.pair 
{
	import de.maxdidit.hardware.font.data.tables.advanced.gpos.shared.ValueFormat;
	import de.maxdidit.hardware.font.data.tables.advanced.gpos.shared.ValueRecord;
	import de.maxdidit.hardware.font.data.tables.advanced.ScriptFeatureLookupTable;
	import de.maxdidit.hardware.font.data.tables.common.classes.IClassDefinitionTable;
	import de.maxdidit.hardware.font.data.tables.common.lookup.IGlyphLookup;
	import de.maxdidit.hardware.font.data.tables.truetype.glyf.Glyph;
	import de.maxdidit.hardware.font.HardwareFont;
	import de.maxdidit.hardware.font.parser.tables.TableNames;
	import de.maxdidit.list.LinkedList;
	import de.maxdidit.hardware.font.data.tables.common.coverage.ICoverageTable;
	import de.maxdidit.hardware.font.data.tables.common.lookup.ILookupSubtable;
	import de.maxdidit.hardware.font.data.tables.common.lookup.LookupTable;
	
	/**
	 * ...
	 * @author Max Knoblich
	 */
	public class PairAdjustmentPositioningSubtable2 implements ILookupSubtable
	{
		///////////////////////
		// Member Fields
		///////////////////////
		
		private var _coverageOffset:uint;
		private var _coverage:ICoverageTable;
		
		private var _valueFormatData1:uint;
		private var _valueFormat1:ValueFormat;
		
		private var _valueFormatData2:uint;
		private var _valueFormat2:ValueFormat;
		
		private var _classDefinitionOffset1:uint;
		private var _classDefinition1:IClassDefinitionTable;
		
		private var _classDefinitionOffset2:uint;
		private var _classDefinition2:IClassDefinitionTable;
		
		private var _class1Count:uint;
		private var _class2Count:uint;
		
		private var _class1Records:Vector.<Class1Record>;
		
		private var _parent:LookupTable;
		
		///////////////////////
		// Constructor
		///////////////////////
		
		public function PairAdjustmentPositioningSubtable2() 
		{
			
		}
		
		///////////////////////
		// Member Propoerties
		///////////////////////
		
		public function get coverageOffset():uint 
		{
			return _coverageOffset;
		}
		
		public function set coverageOffset(value:uint):void 
		{
			_coverageOffset = value;
		}
		
		public function get valueFormatData1():uint 
		{
			return _valueFormatData1;
		}
		
		public function set valueFormatData1(value:uint):void 
		{
			_valueFormatData1 = value;
		}
		
		public function get valueFormatData2():uint 
		{
			return _valueFormatData2;
		}
		
		public function set valueFormatData2(value:uint):void 
		{
			_valueFormatData2 = value;
		}
		
		public function get valueFormat1():ValueFormat 
		{
			return _valueFormat1;
		}
		
		public function set valueFormat1(value:ValueFormat):void 
		{
			_valueFormat1 = value;
		}
		
		public function get valueFormat2():ValueFormat 
		{
			return _valueFormat2;
		}
		
		public function set valueFormat2(value:ValueFormat):void 
		{
			_valueFormat2 = value;
		}
		
		public function get coverage():ICoverageTable 
		{
			return _coverage;
		}
		
		public function set coverage(value:ICoverageTable):void 
		{
			_coverage = value;
		}
		
		public function get classDefinitionOffset1():uint 
		{
			return _classDefinitionOffset1;
		}
		
		public function set classDefinitionOffset1(value:uint):void 
		{
			_classDefinitionOffset1 = value;
		}
		
		public function get classDefinition1():IClassDefinitionTable 
		{
			return _classDefinition1;
		}
		
		public function set classDefinition1(value:IClassDefinitionTable):void 
		{
			_classDefinition1 = value;
		}
		
		public function get classDefinitionOffset2():uint 
		{
			return _classDefinitionOffset2;
		}
		
		public function set classDefinitionOffset2(value:uint):void 
		{
			_classDefinitionOffset2 = value;
		}
		
		public function get classDefinition2():IClassDefinitionTable 
		{
			return _classDefinition2;
		}
		
		public function set classDefinition2(value:IClassDefinitionTable):void 
		{
			_classDefinition2 = value;
		}
		
		public function get class1Records():Vector.<Class1Record> 
		{
			return _class1Records;
		}
		
		public function set class1Records(value:Vector.<Class1Record>):void 
		{
			_class1Records = value;
		}
		
		public function get class1Count():uint 
		{
			return _class1Count;
		}
		
		public function set class1Count(value:uint):void 
		{
			_class1Count = value;
		}
		
		public function get class2Count():uint 
		{
			return _class2Count;
		}
		
		public function set class2Count(value:uint):void 
		{
			_class2Count = value;
		}
		
		public function get parent():LookupTable 
		{
			return _parent;
		}
		
		public function set parent(value:LookupTable):void 
		{
			_parent = value;
		}
		
		///////////////////////
		// Member Functions
		///////////////////////
		
		/* INTERFACE de.maxdidit.hardware.font.data.tables.common.lookup.ILookupSubtable */
		
		//public function performLookup(characterInstances:LinkedList, parent:ScriptFeatureLookupTable):void 
		//{
			//var currentCharacter:HardwareCharacterInstance = (characterInstances.currentElement as HardwareCharacterInstanceListElement).hardwareCharacterInstance;
			//
			//var nextElement:HardwareCharacterInstanceListElement = (characterInstances.currentElement.next as HardwareCharacterInstanceListElement);
			//if (!nextElement)
			//{
				//return;
			//}
			//
			//var nextCharacter:HardwareCharacterInstance = nextElement.hardwareCharacterInstance;
			//
			//var coverageIndex:int = _coverage.getCoverageIndex(currentCharacter.glyphID);
			//if (coverageIndex == -1)
			//{
				//return;
			//}
			//
			//var class1:uint = _classDefinition1.getGlyphClassByID(currentCharacter.glyphID);
			//var class2:uint = _classDefinition2.getGlyphClassByID(nextCharacter.glyphID);
			//
			//var class2Record:Class2Record = _class1Records[class1].class2Records[class2];
			//
			// apply positioning values
			//var value1:ValueRecord = class2Record.value1;
			//var value2:ValueRecord = class2Record.value2;
			//
			//currentCharacter.applyPositionAdjustmentValue(value1);
			//nextCharacter.applyPositionAdjustmentValue(value2);
		//}
		
		public function retrieveGlyphLookup(glyphIndex:uint, coverageIndex:uint, font:HardwareFont):IGlyphLookup 
		{
			var class1:uint = _classDefinition1.getGlyphClassByID(glyphIndex);
			var class1Record:Class1Record = _class1Records[class1];
			
			var result:PairAdjustmentPositioningLookup2 = new PairAdjustmentPositioningLookup2();
			
			result.classDefinition2 = _classDefinition2;
			result.class1Record = class1Record;
			
			return result;
		}
		
		public function resolveDependencies(parent:ScriptFeatureLookupTable, font:HardwareFont):void 
		{
			_coverage.iterateOverCoveredIndices(assignGlyphLookup, font);
		}
		
		private function assignGlyphLookup(glyphIndex:uint, coverageIndex:uint, font:HardwareFont):void 
		{
			var targetGlyph:Glyph = font.retrieveGlyph(glyphIndex);
			targetGlyph.addGlyphLookup(TableNames.GLYPH_POSITIONING_DATA, _parent.lookupIndex, retrieveGlyphLookup(glyphIndex, coverageIndex, font));
		}
	}

}