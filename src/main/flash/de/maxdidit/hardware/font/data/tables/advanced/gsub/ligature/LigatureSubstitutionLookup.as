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
 
package de.maxdidit.hardware.font.data.tables.advanced.gsub.ligature 
{ 
	import de.maxdidit.hardware.font.data.tables.common.lookup.IGlyphLookup; 
	import de.maxdidit.hardware.font.data.tables.required.cmap.CharacterIndexMappingTableData; 
	import de.maxdidit.hardware.font.HardwareFont; 
	import de.maxdidit.hardware.font.parser.tables.TableNames; 
	import de.maxdidit.hardware.text.components.HardwareCharacterInstance; 
	import de.maxdidit.list.ILinkedListElement; 
	import de.maxdidit.list.LinkedList; 
	 
	/** 
	 * ... 
	 * @author Max Knoblich 
	 */ 
	public class LigatureSubstitutionLookup implements IGlyphLookup 
	{ 
		/////////////////////// 
		// Member Fields 
		/////////////////////// 
		 
		private var _ligatureSets:LigatureSetTable; 
		 
		/////////////////////// 
		// Constructor 
		/////////////////////// 
		 
		public function LigatureSubstitutionLookup() 
		{ 
		 
		} 
		 
		/////////////////////// 
		// Member Properties 
		/////////////////////// 
		 
		public function get ligatureSets():LigatureSetTable 
		{ 
			return _ligatureSets; 
		} 
		 
		public function set ligatureSets(value:LigatureSetTable):void 
		{ 
			_ligatureSets = value; 
		} 
		 
		/////////////////////// 
		// Member Functions 
		/////////////////////// 
		 
		/* INTERFACE de.maxdidit.hardware.font.data.tables.common.lookup.IGlyphLookup */ 
		 
		public function performLookup(characterInstances:LinkedList):void 
		{ 
			var ligatures:Vector.<LigatureTable> = _ligatureSets.ligatures; 
			const l:uint = ligatures.length; 
			 
			for (var i:uint = 0; i < l; i++) 
			{ 
				var ligature:LigatureTable = ligatures[i]; 
				if (!matchesLigatureComponents(characterInstances, ligature)) 
				{ 
					continue; 
				} 
				 
				removeComponentGlyphs(characterInstances, ligature); 
				 
				// perform substitution 
				var currentCharacter:HardwareCharacterInstance = characterInstances.currentElement as HardwareCharacterInstance; 
				currentCharacter.glyph = ligature.ligatureGlyph; 
				 
				return; 
			} 
		} 
		 
		private function removeComponentGlyphs(characterInstances:LinkedList, ligature:LigatureTable):void 
		{ 
			var currentCharacter:ILinkedListElement = characterInstances.currentElement; 
			var componentGlyphIDs:Vector.<uint> = ligature.componentGlyphIDs; 
			var cc:uint = ligature.componentCount - 1; 
			 
			for (var c:uint = 0; c < cc; c++) 
			{ 
				currentCharacter = currentCharacter.next; 
				if (!currentCharacter) 
				{ 
					return; 
				} 
				 
				characterInstances.removeElement(currentCharacter); 
			} 
		} 
		 
		private function matchesLigatureComponents(characterInstances:LinkedList, ligature:LigatureTable):Boolean 
		{ 
			var currentCharacter:HardwareCharacterInstance = characterInstances.currentElement as HardwareCharacterInstance; 
			var componentGlyphIDs:Vector.<uint> = ligature.componentGlyphIDs; 
			var cc:uint = ligature.componentCount - 1; 
			 
			for (var c:uint = 0; c < cc; c++) 
			{ 
				currentCharacter = currentCharacter.next as HardwareCharacterInstance; 
				if (!currentCharacter) 
				{ 
					return false; 
				} 
				 
				if (currentCharacter.glyph.header.index != componentGlyphIDs[c]) 
				{ 
					return false; 
				} 
			} 
			 
			return true; 
		} 
	 
	} 
} 
