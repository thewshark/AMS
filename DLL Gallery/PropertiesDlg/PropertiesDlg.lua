function TableToListBox (List,InTable,Clear)
	if Clear then ListBox.DeleteItem(List,LB_ALLITEMS); end
	for Index, Value in pairs(InTable) do
		if (Value ~= "") then
			ListBox.AddItem(List,Index.." : "..Value,Index);
		end
	end
end

function DelimitedStringToTable(DelimitedString, Delimiter)
	tbReturn = {};
	local strWorking;
	local nPos = nil;
	local strData;
	local nTableIndex = 1;
	local nDelimiterLength = String.Length(Delimiter);
	
	if(nDelimiterLength < 1)then
		tbReturn[nTableIndex] = DelimitedString;
		return tbReturn;
	end
	
	strWorking = DelimitedString;
	nPos = String.Find(strWorking,Delimiter);
	while(nPos ~= -1)do
		strData = String.Left(strWorking,nPos-1);
		tbReturn[nTableIndex] = strData;
		nTableIndex = nTableIndex + 1;
		local nLength = String.Length(strWorking);
		strWorking = String.Right(strWorking,nLength - (nPos + 
(nDelimiterLength-1)));
		nPos = String.Find(strWorking,Delimiter);
	end
	if(strWorking ~= "")then
		tbReturn[nTableIndex] = strWorking;
	end
	
	return tbReturn;
end

if (String.Length(Input.GetText("Input1")) ~= 0) then
RString = DLL.CallFunction("AutoPlay\\Docs\\PropertiesDlg.dll", "GetFileProperties", "\""..Input.GetText("Input1").."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
PropTable = DelimitedStringToTable(RString,"|");
TableToListBox("ListBox1",PropTable,true);
end