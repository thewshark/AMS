------------------------------[[ SCRIPT: Global Script ]]------------------------------
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

DateTimeKind = { Unspecified = 0, Utc = 1, Local = 2, };

TimeSynchronizer = {};
function TimeSynchronizer.GetTimeServerList()
	result = DLL.CallFunction("AutoPlay\\Docs\\TimeSynchronizer.dll", "GetTimeServerList", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return DelimitedStringToTable(result, "\r\n");
end
function TimeSynchronizer.GetTimeFromServer(dateTimeKind)
	return DLL.CallFunction("AutoPlay\\Docs\\TimeSynchronizer.dll", "GetTimeFromServer", dateTimeKind, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function TimeSynchronizer.GetTimeFromServerEx(dateTimeKind, server)
	return DLL.CallFunction("AutoPlay\\Docs\\TimeSynchronizer.dll", "GetTimeFromServerEx", dateTimeKind..",".."\""..server.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function TimeSynchronizer.SynchronizeTime()
	DLL.CallFunction("AutoPlay\\Docs\\TimeSynchronizer.dll", "SynchronizeTime", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function TimeSynchronizer.SynchronizeTimeEx(server)
	DLL.CallFunction("AutoPlay\\Docs\\TimeSynchronizer.dll", "SynchronizeTimeEx", "\""..server.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function TimeSynchronizer.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\TimeSynchronizer.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSynchronize, Event: On Click Script ]]------------------------------
TimeSynchronizer.SynchronizeTime();
error = TimeSynchronizer.GetError();

if (error == "") then
	Dialog.Message("Success", "Time Synchronized Successfully.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetTime, Event: On Click Script ]]------------------------------
time = TimeSynchronizer.GetTimeFromServer(DateTimeKind.Local);
error = TimeSynchronizer.GetError();

if (error == "") then
	Input.SetText("Input1", time);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetTimeServerList, Event: On Click Script ]]------------------------------
timeServerList = TimeSynchronizer.GetTimeServerList();

for i, v in timeServerList do
	ListBox.AddItem("ListBox1", v, "");
end

