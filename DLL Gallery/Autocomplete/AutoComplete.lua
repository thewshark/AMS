------------------------------[[ SCRIPT: Global Script ]]------------------------------
function StringToTable(DelimitedString, Delimiter)
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
		strWorking = String.Right(strWorking,nLength - (nPos + (nDelimiterLength-1)));
		nPos = String.Find(strWorking,Delimiter);
	end
	if(strWorking ~= "")then
		tbReturn[nTableIndex] = strWorking;
	end
	
	return tbReturn;
end

function TableToString(Table, Delimiter)
	strReturn = "";
	for i, item in Table do
		strReturn = strReturn..item..Delimiter;
	end
	strReturn = String.TrimRight(strReturn,Delimiter);
	return strReturn;
end

--AutoCompleteMode = "None", "Suggest", "Append", "Search", "FilterPreFixes", "UseTab", "UpDownKeyDropsList", "RtlReading";
--AutoCompleteSource = "History", "MostRecentlyUsed", "Isf", "Custom";

AutoComplete = {};
function AutoComplete.AutoComplete(hWndEdit, mode, source)
	DLL.CallFunction("AutoPlay\\Docs\\AutoComplete.dll", "AutoComplete", hWndEdit..",".."\""..mode.."\""..",".."\""..source.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function AutoComplete.GetMode(hWndEdit)
	return DLL.CallFunction("AutoPlay\\Docs\\AutoComplete.dll", "GetMode", hWndEdit, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function AutoComplete.SetMode(hWndEdit, mode)
	DLL.CallFunction("AutoPlay\\Docs\\AutoComplete.dll", "SetMode", hWndEdit..",".."\""..mode.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function AutoComplete.GetSource(hWndEdit)
	return DLL.CallFunction("AutoPlay\\Docs\\AutoComplete.dll", "GetSource", hWndEdit, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function AutoComplete.SetSource(hWndEdit, source)
	DLL.CallFunction("AutoPlay\\Docs\\AutoComplete.dll", "SetSource", hWndEdit..",".."\""..source.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function AutoComplete.GetCustomSource(hWndEdit)
	sourceString = DLL.CallFunction("AutoPlay\\Docs\\AutoComplete.dll", "GetCustomSource", hWndEdit, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(sourceString, "\r\n");
end
function AutoComplete.SetCustomSource(hWndEdit, customSource)
	sourceString = TableToString(customSource, "\r\n");
	DLL.CallFunction("AutoPlay\\Docs\\AutoComplete.dll", "SetCustomSource", hWndEdit..",".."\""..sourceString.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function AutoComplete.CustomSourceAdd(hWndEdit, item)
	DLL.CallFunction("AutoPlay\\Docs\\AutoComplete.dll", "CustomSourceAdd", hWndEdit..",".."\""..item.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function AutoComplete.CustomSourceRemove(hWndEdit, item)
	DLL.CallFunction("AutoPlay\\Docs\\AutoComplete.dll", "CustomSourceRemove", hWndEdit..",".."\""..item.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function AutoComplete.GetEditHandle(hWndCombo)
	return DLL.CallFunction("AutoPlay\\Docs\\AutoComplete.dll", "GetEditHandle", hWndCombo, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function AutoComplete.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\AutoComplete.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetCustomSource, Event: On Click Script ]]------------------------------
AutoComplete.SetSource(Input.GetText("InputHandle"), "Custom");
error = AutoComplete.GetError()
if (error == "") then
	AutoComplete.SetCustomSource(Input.GetText("InputHandle"), { "string1", "string2", "string3"});
	--AutoComplete.CustomSourceAdd(Input.GetText("InputHandle"), "string1");
	--AutoComplete.CustomSourceAdd(Input.GetText("InputHandle"), "string2");
	--AutoComplete.CustomSourceAdd(Input.GetText("InputHandle"), "string3");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetSource, Event: On Click Script ]]------------------------------
AutoComplete.SetSource(Input.GetText("InputHandle"), "MostRecentlyUsed, Isf");
error = AutoComplete.GetError()
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetMode, Event: On Click Script ]]------------------------------
AutoComplete.SetMode(Input.GetText("InputHandle"), "Suggest, Append");
error = AutoComplete.GetError()
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonAutoComplete, Event: On Click Script ]]------------------------------
AutoComplete.AutoComplete(Input.GetText("InputHandle"), "Suggest", "History");
error = AutoComplete.GetError()
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

