package de.maxdidit.hardware.font.data.tables.advanced.gpos.cursive 
{
	import de.maxdidit.hardware.font.data.tables.advanced.ScriptFeatureLookupTable;
	import de.maxdidit.hardware.font.data.tables.common.coverage.ICoverageTable;
	import de.maxdidit.hardware.font.data.tables.common.lookup.IGlyphLookup;
	import de.maxdidit.hardware.font.data.tables.common.lookup.ILookupSubtable;
	import de.maxdidit.hardware.font.data.tables.common.lookup.LookupTable;
	import de.maxdidit.hardware.font.data.tables.truetype.glyf.Glyph;
	import de.maxdidit.hardware.font.HardwareFont;
	import de.maxdidit.hardware.font.parser.tables.TableNames;
	import de.maxdidit.list.LinkedList;
	
	/**
	 * ...
	 * @author Max Knoblich
	 */
	public class CursiveAttachmentPositioningSubtable implements ILookupSubtable 
	{
		///////////////////////
		// Member Fields
		///////////////////////
		
		private var _coverageOffset:uint;
		private var _coverage:ICoverageTable;
		
		private var _entryExitCount:uint;
		private var _entryExitRecords:Vector.<EntryExitRecord>;
		
		private var _parent:LookupTable;
		
		///////////////////////
		// Constructor
		///////////////////////
		
		public function CursiveAttachmentPositioningSubtable() 
		{
			
		}
		
		///////////////////////
		// Member Propertes
		///////////////////////
		
		public function get coverageOffset():uint 
		{
			return _coverageOffset;
		}
		
		public function set coverageOffset(value:uint):void 
		{
			_coverageOffset = value;
		}
		
		public function get coverage():ICoverageTable 
		{
			return _coverage;
		}
		
		public function set coverage(value:ICoverageTable):void 
		{
			_coverage = value;
		}
		
		public function get entryExitCount():uint 
		{
			return _entryExitCount;
		}
		
		public function set entryExitCount(value:uint):void 
		{
			_entryExitCount = value;
		}
		
		public function get entryExitRecords():Vector.<EntryExitRecord> 
		{
			return _entryExitRecords;
		}
		
		public function set entryExitRecords(value:Vector.<EntryExitRecord>):void 
		{
			_entryExitRecords = value;
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
		
		public function performLookup(characterInstances:LinkedList, parent:ScriptFeatureLookupTable):void
		{
			throw new Error("Function not yet implemented");
		}
		
		public function retrieveGlyphLookup(glyphIndex:uint, coverageIndex:uint, font:HardwareFont):IGlyphLookup 
		{
			var entryExitRecord:EntryExitRecord = _entryExitRecords[coverageIndex];
			
			var result:CursiveAttachmentPositioningLookup = new CursiveAttachmentPositioningLookup();
			result.entryExitRecord = entryExitRecord;
			
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