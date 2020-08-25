--[[

	ListIconEx Action Plugin
	(C) Illusion Programming, 2011. (gensokyo.co.uk)
	
	Programmers:
		* Shadiku Izayoi <blackhawk.delta@gmail.com>
		
	Special thanks to RizlaUK and Imagine Programming for ListIcon!
		
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
]]--

-- ListIcon abstraction class by Shadiku Izayoi.
ListIconEvent = {};
ListIconEx = {Performed = false};
ListIconEx.Stored = {};

ListIcon.Blocked = {"Create", "LoadImage", "LoadFont", "FreeFont", "FreeImage", "CountIconsInFile"};

function ListIconEx.__loadstring(Code)
	return loadstring(Code)();
end

function ListIconEx.__inarray(Haystack, Needle)
	for Key, Value in pairs(Haystack) do
		if (tostring(Value) == Needle) then
			return true;
		end
	end
	
	return false;
end

function ListIconEx.CreateObject(Name, Text, ColumnWidth, Flags, ImportData)
	assert(type(Name) == "string", "Argument 1 must be of type string.");
	assert(type(Text) == "string", "Argument 2 must be of type string.");
	assert(type(ColumnWidth) == "number", "Argument 3 must be of type number.");
	assert(type(Flags) == "table", "Argument 4 must be of type table.");
	
	local Properties, ImportCheckBoxes;
	
	if (ImportData == true) then
		Properties, ImportCheckBoxes, ImportData = ListBox.GetProperties(Name), false, {};

		if (Properties.ListBoxType == 1) and (Flags.CheckBoxes) then
			ImportCheckBoxes = true;
		end
		
		for I = 1, ListBox.GetCount(Name) do
			table.insert(ImportData, {Text = ListBox.GetItemText(Name, I), Data = ListBox.GetItemData(Name, I), Checked = (ListBox.GetItemCheck(Name, I) == 1)});
		end
	end
	
	local ID = ListIcon.Create(Name, Text, ColumnWidth, Flags);
	assert(ID, "Failed to create ListIcon object.");
	ListIconEx.Stored[Name] = {Name = Name, ItemData = {}};
	
	if not (ListIconEx.Performed) then
		for K, V in pairs(ListIcon) do
			if not (ListIconEx.__inarray(ListIcon.Blocked, K)) then
				pcall(ListIconEx.__loadstring, "function ListIconEx:"..tostring(K).."(...) return ListIcon."..tostring(K).."(self.Name, unpack(arg)); end");
			end
		end
		
		function ListIconEx:AddRow(strText, strData, HLIIMAGE)
			ListIcon.AddRow(self.Name, strText, HLIIMAGE);
			self.ItemData[ListIcon.CountRows(self.Name)] = strData;
		end
		
		function ListIconEx:RemoveRow(intRow)
			Table.Remove(self.ItemData, intRow + 1);
			ListIcon.RemoveRow(self.Name, intRow);
		end
		
		function ListIconEx:ClearRows()
			ListIcon.ClearRows(self.Name);
			self.ItemData = {};
		end
				
		function ListIconEx:GetRowData(intRow)
			if (self.ItemData[intRow + 1]) then
				return self.ItemData[intRow + 1];
			end
		end
		
		function ListIconEx:SetRowData(intRow, strData)
			if (self.ItemData[intRow + 1]) then
				self.ItemData[intRow + 1] = strData;
			end
		end
		
		ListIconEx.Performed = true;
	end
	
	setmetatable(ListIconEx.Stored[Name], {__index = ListIconEx});
	
	if (type(ImportData) == "table") then
		for K, V in pairs(ImportData) do
			ListIconEx.Stored[Name]:AddRow(V.Text, V.Data);
			
			if (V.Checked == true) then
				ListIconEx.Stored[Name]:SetRowChecked(ListIconEx.Stored[Name]:CountRows() - 1, true);
			end
		end
	end
	
	return ListIconEx.Stored[Name];
end

function ListIconEx.GenerateFlagsTable(CheckBoxes, MultiSelect, GridLines, FullRowSelect, HeaderDragDrop, AlwaysShowSelection)
	assert(type(CheckBoxes) == "boolean", "Argument 1 must be of type boolean.");
	assert(type(MultiSelect) == "boolean", "Argument 2 must be of type boolean.");
	assert(type(GridLines) == "boolean", "Argument 3 must be of type boolean.");
	assert(type(FullRowSelect) == "boolean", "Argument 4 must be of type boolean.");
	assert(type(HeaderDragDrop) == "boolean", "Argument 5 must be of type boolean.");
	assert(type(AlwaysShowSelection) == "boolean", "Argument 6 must be of type boolean.");
	
	return {CheckBoxes = CheckBoxes, MultiSelect = MultiSelect, GridLines = GridLines, FullRowSelect = FullRowSelect, HeaderDragDrop = HeaderDragDrop, AlwaysShowSelection = AlwaysShowSelection};
end

function ListIconEx.GetObjectByName(szName, blCaseSensitive)
	assert(type(szName) == "string", "Argument 1 must be of type string.");
	assert(type(blCaseSensitive) == "boolean", "Argument 2 must be of type boolean.");
	
	if (blCaseSensitive == nil) then
		blCaseSensitive = true;
	end
	
	for K, V in pairs(ListIconEx.Stored) do
		if (blCaseSensitive) then
			if (V.Name) then
				if ((V.Name) == (szName)) then
					return ListIconEx.Stored[K];
				end
			end
		else
			if (V.Name) then
				if (string.lower(V.Name) == string.lower(szName)) then
					return ListIconEx.Stored[K];
				end
			end
		end
	end
end

function ListIconEvent.OnReturn(sObject, nRow) if (ListIconEx.Stored[sObject].OnReturn) then ListIconEx.Stored[sObject].OnReturn(nRow); end end
function ListIconEvent.OnKey(sObject, nKey) if (ListIconEx.Stored[sObject].OnKey) then ListIconEx.Stored[sObject].OnKey(nKey); end end
function ListIconEvent.OnDoubleRightClick(sObject, nRow) if (ListIconEx.Stored[sObject].OnDoubleRightClick) then ListIconEx.Stored[sObject].OnDoubleRightClick(nRow); end end
function ListIconEvent.OnDoubleClick(sObject, nRow) if (ListIconEx.Stored[sObject].OnDoubleClick) then ListIconEx.Stored[sObject].OnDoubleClick(nRow); end end
function ListIconEvent.OnRightClick(sObject, nRow) if (ListIconEx.Stored[sObject].OnRightClick) then ListIconEx.Stored[sObject].OnRightClick(nRow); end end
function ListIconEvent.OnHeaderRightClick(sObject, nCol) if (ListIconEx.Stored[sObject].OnHeaderRightClick) then ListIconEx.Stored[sObject].OnHeaderRightClick(nCol); end end
function ListIconEvent.OnHeaderClick(sObject, nCol) if (ListIconEx.Stored[sObject].OnHeaderClick) then ListIconEx.Stored[sObject].OnHeaderClick(nCol); end end
function ListIconEvent.OnSelect(sObject, nRow) if (ListIconEx.Stored[sObject].OnSelect) then ListIconEx.Stored[sObject].OnSelect(nRow); end end
function ListIconEvent.OnChecked(sObject, nRow, bChecked) if (ListIconEx.Stored[sObject].OnChecked) then ListIconEx.Stored[sObject].OnChecked(nRow, bChecked); end end
function ListIconEvent.OnSetFocus(sObject) if (ListIconEx.Stored[sObject].OnSetFocus) then ListIconEx.Stored[sObject].OnSetFocus(); end end
function ListIconEvent.OnKillFocus(sObject) if (ListIconEx.Stored[sObject].OnKillFocus) then ListIconEx.Stored[sObject].OnKillFocus(); end end
function ListIconEvent.OnColorRequest(sObject, nRow, nColumn) if (ListIconEx.Stored[sObject].OnColorRequest) then return ListIconEx.Stored[sObject].OnColorRequest(nRow, nColumn); end end
function ListIconEvent.OnFontRequest(sObject, nRow, nColumn) if (ListIconEx.Stored[sObject].OnFontRequest) then return ListIconEx.Stored[sObject].OnFontRequest(nRow, nColumn); end end

function ListIconEx:GetSelectedRows()
	local Return = {};
	
	for I = 0, self:CountRows() do
		if (self:GetRowSelected(I)) then
			table.insert(Return, I);
		end
	end
	
	return Return;
end

function ListIconEx:GetCheckedRows()
	local Return = {};
	
	for I = 0, self:CountRows() do
		if (self:GetRowChecked(I)) then
			table.insert(Return, I);
		end
	end
	
	return Return;
end

function ListIconEx:GetSelectedCount()
	local Return = 0;
	
	for I = 0, self:CountRows() do
		if (self:GetRowSelected(I)) then
			Return = Return + 1;
		end
	end
	
	return Return;
end

function ListIconEx:GetCheckedCount()
	local Return = 0;
	
	for I = 0, self:CountRows() do
		if (self:GetRowChecked(I)) then
			Return = Return + 1;
		end
	end
	
	return Return;
end

function ListIconEx:CheckAllRows(ShouldCheck)
	for I = 0, self:CountRows() do
		self:SetRowChecked(I, ShouldCheck);
	end
end

function ListIconEx:SelectAllRows(ShouldCheck)
	for I = 0, self:CountRows() do
		self:SetRowSelected(I, ShouldCheck);
	end
end

function ListIconEx:InverseChecked()
	local Rows = self:CountRows();
	
	for I = 0, Rows do
		self:SetRowChecked(I, not self:GetRowChecked(I));
	end
end

function ListIconEx:InverseSelection()
	local Rows = self:CountRows();
	
	if (type(Rows) == "table") then
		for I = 0, Rows do
			self:SetRowSelected(I, not self:GetRowSelected(I));
		end
	end
end