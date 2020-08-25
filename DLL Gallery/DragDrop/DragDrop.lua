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

dataFormat = "";

DataFormat = { Text = "Text", FileDrop = "FileDrop"};

DragDrop = {};
function DragDrop.GetDataFormat()
	return DLL.CallFunction("AutoPlay\\Docs\\DragDrop.dll", "GetDataFormat", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function DragDrop.SetDataFormat(format)
	dataFormat = format;
	DLL.CallFunction("AutoPlay\\Docs\\DragDrop.dll", "SetDataFormat", "\""..format.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function DragDrop.Start(hWnd)
	DLL.CallFunction("AutoPlay\\Docs\\DragDrop.dll", "Start", hWnd, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function DragDrop.Stop(hWnd)
	DLL.CallFunction("AutoPlay\\Docs\\DragDrop.dll", "Stop", hWnd, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function DragDrop.GetEventType()
	return DLL.CallFunction("AutoPlay\\Docs\\DragDrop.dll", "GetEventType", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function DragDrop.GetDataObject()
	dataString = DLL.CallFunction("AutoPlay\\Docs\\DragDrop.dll", "GetDataObject", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	if (dataFormat == "Text") then return dataString; else return StringToTable(dataString, "\r\n"); end
end
function DragDrop.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\DragDrop.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

-- Start:


--DragDrop.SetDataFormat(DataFormat.Text);
DragDrop.SetDataFormat(DataFormat.FileDrop);
DragDrop.Start(Application.GetWndHandle());
error = DragDrop.GetError();

if (error == "") then
	Page.StartTimer(100);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

-- stop

DragDrop.Stop(Application.GetWndHandle());
