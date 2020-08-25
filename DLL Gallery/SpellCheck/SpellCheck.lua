------------------------------[[ SCRIPT: Global Script ]]------------------------------
function TableToDelimitedString(Table, Delimiter)
	strReturn = "";
	for i, item in Table do
		strReturn = strReturn..item..Delimiter;
	end
	strReturn = String.TrimRight(strReturn,Delimiter);
	return strReturn;
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
		strWorking = String.Right(strWorking,nLength - (nPos + (nDelimiterLength-1)));
		nPos = String.Find(strWorking,Delimiter);
	end
	if(strWorking ~= "")then
		tbReturn[nTableIndex] = strWorking;
	end
	
	return tbReturn;
end

function GetSpellingErrorInfo(seiString)
	if (seiString ~= "") then
		tbReturn = DelimitedStringToTable(seiString, "|");
		
		spellingErrorInfo = {};
		spellingErrorInfo.StartIndex = tbReturn[1];
		spellingErrorInfo.Length = tbReturn[2];
		spellingErrorInfo.MisSpelledWord = tbReturn[3];
		spellingErrorInfo.Suggestions = DelimitedStringToTable(tbReturn[4], ",");
		
		return spellingErrorInfo;
	end
end

function GetSpellingErrorInfoList(errorList)
	if (errorList ~= "") then
		tbReturn = DelimitedStringToTable(errorList, "\r\n")
		
		spellingErrorInfoList = {};
		
		for i, v in tbReturn do
			spellingErrorInfoList[i] = GetSpellingErrorInfo(v);
		end
		
		return spellingErrorInfoList;
	end
end

SpellCheck = {};
function SpellCheck.GetText()
	return DLL.CallFunction("AutoPlay\\Docs\\SpellCheck.dll", "GetText", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function SpellCheck.SetText(text)
	DLL.CallFunction("AutoPlay\\Docs\\SpellCheck.dll", "SetText", "\""..text.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function SpellCheck.GetSpellingErrorList()
	errorList = DLL.CallFunction("AutoPlay\\Docs\\SpellCheck.dll", "GetSpellingErrorList", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return GetSpellingErrorInfoList(errorList);
end
function SpellCheck.GetNextSpellingErrorCharacterIndex(charIndex)
	return DLL.CallFunction("AutoPlay\\Docs\\SpellCheck.dll", "GetNextSpellingErrorCharacterIndex", charIndex, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function SpellCheck.GetSpellingErrorStart(charIndex)
	return DLL.CallFunction("AutoPlay\\Docs\\SpellCheck.dll", "GetSpellingErrorStart", charIndex, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function SpellCheck.GetSpellingErrorLength(charIndex)
	return DLL.CallFunction("AutoPlay\\Docs\\SpellCheck.dll", "GetSpellingErrorLength", charIndex, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function SpellCheck.GetSpellingError(charIndex)
	spellError = DLL.CallFunction("AutoPlay\\Docs\\SpellCheck.dll", "GetSpellingError", charIndex, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return GetSpellingErrorInfo(spellError);
end
function SpellCheck.GetNextSpellingError()
	spellError = DLL.CallFunction("AutoPlay\\Docs\\SpellCheck.dll", "GetNextSpellingError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return GetSpellingErrorInfo(spellError);
end
function SpellCheck.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\SpellCheck.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetSpellingErrorList, Event: On Click Script ]]------------------------------
SpellCheck.SetText(Input.GetText("InputText"));
errorList = SpellCheck.GetSpellingErrorList();
for i, v in errorList do
	ListBox.AddItem("ListBoxErrors", v.MisSpelledWord.." = "..TableToDelimitedString(v.Suggestions, ", "), "");
end

