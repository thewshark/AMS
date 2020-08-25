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

function GetEventDataTable(eventDataString)
	tbReturn = DelimitedStringToTable(eventDataString, "|");
	
	event = {};
	
	if (Table.Count(tbReturn) == 2) then
		event.Type = tbReturn[1];
		event.Path = tbReturn[2];
	elseif (Table.Count(tbReturn) == 3) then
		event.Type = tbReturn[1];
		event.Path = tbReturn[2];
		event.OldPath = tbReturn[3];
	end

	return event;
end

function GetErrorDataTable(errorDataString)
	tbReturn = DelimitedStringToTable(errorDataString, "|");
	
	error = {};
	
	if (Table.Count(tbReturn) == 2) then
		error.Time = tbReturn[1];
		error.Message = tbReturn[2];
	end

	return error;
end


--[[
-- Specifies changes to watch for in a file or folder.
NotifyFilter = {
        -- The name of the file.
        FileName,
        -- The name of the directory.
        DirectoryName,
        -- The attributes of the file or folder.
        Attributes,
        -- The size of the file or folder.
        Size,
        -- The date the file or folder last had anything written to it.
        LastWrite,
        -- The date the file or folder was last opened.
        LastAccess,
        -- The time the file or folder was created.
        CreationTime,
        -- The security settings of the file or folder.
        Security,
    };
]]--

--[[
-- Changes that might occur to a file or directory.
EventType = {
        -- The creation of a file or folder.
        Created,
        -- The deletion of a file or folder.
        Deleted,
        -- The change of a file or folder. The types of changes include: changes to
        -- size, attributes, security settings, last write, and last access time.
        Changed,
        -- The renaming of a file or folder.
        Renamed,
        -- The creation, deletion, change, or renaming of a file or folder.
        All,
    };
]]--

Watcher = {};
function Watcher.Initialize(objRef)
	DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "Initialize", "\""..objRef.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Watcher.UnInitialize(objRef)
	DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "UnInitialize", "\""..objRef.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function Watcher.GetPath(objRef)
	return DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "GetPath", "\""..objRef.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Watcher.GetFilter(objRef)
	return DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "GetFilter", "\""..objRef.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Watcher.GetBufferSize(objRef)
	return DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "GetBufferSize", "\""..objRef.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Watcher.GetNotifyFilter(objRef)
	return DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "GetNotifyFilter", "\""..objRef.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Watcher.GetEventType(objRef)
	return DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "GetEventType", "\""..objRef.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Watcher.GetLogErrors(objRef)
	return DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "GetLogErrors", "\""..objRef.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Watcher.GetIncludeSubdirectories(objRef)
	return DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "GetIncludeSubdirectories", "\""..objRef.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Watcher.GetEnableRaisingEvents(objRef)
	return DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "GetEnableRaisingEvents", "\""..objRef.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Watcher.GetLoggedEvent(objRef)
	eventDataString = DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "GetLoggedEvent", "\""..objRef.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return GetEventDataTable(eventDataString);
end
function Watcher.GetLoggedError(objRef)
	errorDataString = DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "GetLoggedError", "\""..objRef.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return GetErrorDataTable(errorDataString);
end

function Watcher.SetPath(objRef, path)
	DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "SetPath", "\""..objRef.."\""..",".."\""..path.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Watcher.SetFilter(objRef, filter)
	DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "SetFilter", "\""..objRef.."\""..",".."\""..filter.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Watcher.SetBufferSize(objRef, bufferSize)
	DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "SetBufferSize", "\""..objRef.."\""..","..bufferSize, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Watcher.SetNotifyFilter(objRef, notifyFilter)
	DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "SetNotifyFilter", "\""..objRef.."\""..",".."\""..notifyFilter.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Watcher.SetEventType(objRef, eventType)
	DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "SetEventType", "\""..objRef.."\""..",".."\""..eventType.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Watcher.SetLogErrors(objRef, logErrors)
	if logErrors == true then logErrors = 1; else logErrors = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "SetLogErrors", "\""..objRef.."\""..","..logErrors, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Watcher.SetIncludeSubdirectories(objRef, includeSubdirectories)
	if includeSubdirectories == true then includeSubdirectories = 1; else includeSubdirectories = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "SetIncludeSubdirectories", "\""..objRef.."\""..","..includeSubdirectories, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Watcher.SetEnableRaisingEvents(objRef, enableRaisingEvents)
	if enableRaisingEvents == true then enableRaisingEvents = 1; else enableRaisingEvents = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "SetEnableRaisingEvents", "\""..objRef.."\""..","..enableRaisingEvents, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function Watcher.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\Watcher.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Event: On Show Script ]]------------------------------
Page.StartTimer(1000);

------------------------------[[ SCRIPT: Page: Page1, Event: On Timer Script ]]------------------------------
loggedEvent = Watcher.GetLoggedEvent("watcher1");

if (loggedEvent.Type == "Changed" ) then
	ListBox.AddItem("ListBox1", loggedEvent.Type..", "..loggedEvent.Path, "");
elseif (loggedEvent.Type == "Created") then
	ListBox.AddItem("ListBox1", loggedEvent.Type..", "..loggedEvent.Path, "");
elseif (loggedEvent.Type == "Deleted" ) then
	ListBox.AddItem("ListBox1", loggedEvent.Type..", "..loggedEvent.Path, "");
elseif (loggedEvent.Type == "Renamed" ) then
	ListBox.AddItem("ListBox1", loggedEvent.Type..", "..loggedEvent.Path..", "..loggedEvent.OldPath, "");
end

loggedError = Watcher.GetLoggedError("watcher1");

if (loggedError.Message ~= nil) then
	ListBox.AddItem("ListBox1", loggedError.Time..", "..loggedError.Message, "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStop, Event: On Click Script ]]------------------------------
Watcher.UnInitialize("watcher1");

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStart, Event: On Click Script ]]------------------------------
Watcher.Initialize("watcher1");
Watcher.SetPath("watcher1", "C:\\");
Watcher.SetFilter("watcher1", "*"); --"*.*", "*.txt", "*.pdf", etc are valid filters.
Watcher.SetNotifyFilter("watcher1", "DirectoryName, FileName");
Watcher.SetEventType("watcher1", "Created, Deleted, Renamed");
Watcher.SetLogErrors("watcher1");
Watcher.SetIncludeSubdirectories("watcher1", true);
Watcher.SetEnableRaisingEvents("watcher1", true);

