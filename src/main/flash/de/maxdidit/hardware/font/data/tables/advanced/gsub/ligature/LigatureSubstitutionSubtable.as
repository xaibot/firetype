package de.maxdidit.hardware.font.data.tables.advanced.gsub.ligature 
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
	public class LigatureSubstitutionSubtable implements ILookupSubtable 
	{
		///////////////////////
		// Member Fields
		///////////////////////
		
		private var _coverageOffset:uint;
		private var _coverage:ICoverageTable;
		
		private var _ligatureSetCount:uint;
		private var _ligatureSetOffsets:Vector.<uint>;
		private var _ligatureSets:Vector.<LigatureSetTable>;
		
		private var _parent:LookupTable;
		
		///////////////////////
		// Constructor
		///////////////////////
		
		public function LigatureSubstitutionSubtable() 
		{
			
		}
		
		///////////////////////
		// Member Properties
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
		
		public function get ligatureSetCount():uint 
		{
			return _ligatureSetCount;
		}
		
		public function set ligatureSetCount(value:uint):void 
		{
			_ligatureSetCount = value;
		}
		
		public function get ligatureSetOffsets():Vector.<uint> 
		{
			return _ligatureSetOffsets;
		}
		
		public function set ligatureSetOffsets(value:Vector.<uint>):void 
		{
			_ligatureSetOffsets = value;
		}
		
		public function get ligatureSets():Vector.<LigatureSetTable> 
		{
			return _ligatureSets;
		}
		
		public function set ligatureSets(value:Vector.<LigatureSetTable>):void 
		{
			_ligatureSets = value;
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
			//var currentElement:HardwareCharacterInstanceListElement = characterInstances.currentElement as HardwareCharacterInstanceListElement;
			//
			//var glyphIndex:uint = currentElement.hardwareCharacterInstance.glyphID;
			//var coverageIndex:int = _coverage.getCoverageIndex(glyphIndex);
			//if (coverageIndex == -1)
			//{
				//return;
			//}
			//
			//var ligatureSets:LigatureSetTable = _ligatureSets[coverageIndex];
			//var ligature:LigatureTable = findLigatureTableMatch(characterInstances, ligatureSets);
			//
			//if (!ligature)
			//{
				//return;
			//}
			//
			// perform substitution
			//currentElement.hardwareCharacterInstance.glyphID = ligature.ligatureGlyphID;
			//
			// remove ligature component glyphs.
			//const l:uint = ligature.componentCount - 1;
			//for (var i:uint = 0; i < l; i++)
			//{
				//characterInstances.removeElement(currentElement.next);
			//}
		//}
		
		public function retrieveGlyphLookup(glyphIndex:uint, coverageIndex:uint, font:HardwareFont):IGlyphLookup
		{
			var ligatureSets:LigatureSetTable = _ligatureSets[coverageIndex];
			
			var result:LigatureSubstitutionLookup = new LigatureSubstitutionLookup();
			result.ligatureSets = ligatureSets;
			
			return result;
		}
		
		public function resolveDependencies(parent:ScriptFeatureLookupTable, font:HardwareFont):void 
		{
			const l:uint = _ligatureSetCount;
			for (var i:uint = 0; i < l; i++)
			{
				var ligatureSet:LigatureSetTable = _ligatureSets[i];
				var ll:uint = ligatureSet.ligatureCount;
				for (var li:uint = 0; li < ll; li++)
				{
					var ligature:LigatureTable = ligatureSet.ligatures[li];
					ligature.ligatureGlyph = font.retrieveGlyph(ligature.ligatureGlyphID);
				}
			}
			
			_coverage.iterateOverCoveredIndices(assignGlyphLookup, font);
		}
		
		private function assignGlyphLookup(glyphIndex:uint, coverageIndex:uint, font:HardwareFont):void 
		{
			var targetGlyph:Glyph = font.retrieveGlyph(glyphIndex);
			targetGlyph.addGlyphLookup(TableNames.GLYPH_SUBSTITUTION_DATA, _parent.lookupIndex, retrieveGlyphLookup(glyphIndex, coverageIndex, font));
		}
		
		//private function findLigatureTableMatch(characterInstances:LinkedList, ligatureSet:LigatureSetTable):LigatureTable 
		//{
			//const l:uint = ligatureSet.ligatureCount;
			//for (var i:uint = 0; i < l; i++)
			//{
				//var ligature:LigatureTable = ligatureSet.ligatures[i];
				//if (matchLigature(characterInstances, ligature))
				//{
					//return ligature;
				//}
			//}
			//
			//return null;
		//}
		
		//private function matchLigature(characterInstances:LinkedList, ligature:LigatureTable):Boolean 
		//{
			//var characterElement:HardwareCharacterInstanceListElement = characterInstances.currentElement as HardwareCharacterInstanceListElement;
			//
			//const l:uint = ligature.componentCount - 1;
			//for (var i:uint = 0; i < l; i++)
			//{
				//characterElement = characterElement.next as HardwareCharacterInstanceListElement;
				//if (ligature.componentGlyphIDs[i] != characterElement.hardwareCharacterInstance.glyphID)
				//{
					//return false;
				//}
			//}
			//
			//return true;
		//}
		
	}

}