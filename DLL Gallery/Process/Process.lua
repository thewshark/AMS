------------------------------[[ SCRIPT: Global Script ]]------------------------------
function StringToTable(string)
	index = String.Find(string, "|", 1, false);
	process = {};
	process.Name = String.Left(string, index - 1);
	process.Id = String.Right(string, String.Length(string) - index);
	return process;
end

function DelimitedStringToTable(DelimitedString, Delimiter)
	tbReturn = {};
	local strWorking;
	local nPos = nil;
	local strData;
	local nTableIndex = 1;
	local nDelimiterLength = String.Length(Delimiter);
	
	strWorking = DelimitedString;
	nPos = String.Find(strWorking,Delimiter);
	
	while(nPos ~= -1)do
		strData = String.Left(strWorking,nPos-1);
		tbReturn[nTableIndex] = StringToTable(strData);
		nTableIndex = nTableIndex + 1;
		local nLength = String.Length(strWorking);
		strWorking = String.Right(strWorking,nLength - (nPos + (nDelimiterLength-1)));
		nPos = String.Find(strWorking,Delimiter);
	end
	
	if(strWorking ~= "")then
		tbReturn[nTableIndex] = StringToTable(strWorking);
	end
	
	return tbReturn;
end

function GetTable(DelimitedString, Delimiter)
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

WindowStyle = { Normal = 0, Hidden = 1, Minimized = 2, Maximized = 3 };

Process = {};
function Process.GetProcesses()
	processes = DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetProcesses", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return DelimitedStringToTable(processes, "\r\n");
end
function Process.GetProcessesByName(processName)
	processes = DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetProcessesByName", "\""..processName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return DelimitedStringToTable(processes, "\r\n");
end
function Process.GetCurrentProcess()
	DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetCurrentProcess", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Process.GetProcessById(processId)
	DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetProcessById", processId, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function Process.Start(fileName, arguments, windowStyle)
	DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "Start", "\""..fileName.."\""..",".."\""..arguments.."\""..","..windowStyle, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Process.GetHandle()
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetHandle", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Process.GetId()
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetId", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Process.GetMainWindowHandle()
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetMainWindowHandle", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Process.GetName()
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetName", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Process.GetFileName()
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetFileName", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Process.GetMainWindowTitle()
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetMainWindowTitle", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Process.SetMainWindowTitle(title)
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "SetMainWindowTitle", "\""..title.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Process.GetModules()
	modules = DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetModules", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return GetTable(modules, "\r\n");
end
function Process.IsModuleLoaded(moduleName)
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "IsModuleLoaded", "\""..moduleName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Process.GetProcessesByLoadedModuleName(moduleName)
	modules = DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetProcessesByLoadedModuleName", "\""..moduleName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return DelimitedStringToTable(modules, "\r\n");
end
function Process.CloseMainWindow(processName)
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "CloseMainWindow", "\""..processName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Process.WaitForExit(ms)
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "WaitForExit", ms, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function Process.WaitForInputIdle(ms)
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "WaitForInputIdle", ms, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function Process.Stop(processName)
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "Stop", "\""..processName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Process.Close()
	DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "Close", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Process.HasExited()
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "HasExited", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Process.GetExitCode()
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetExitCode", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Process.GetStartTime()
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetStartTime", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Process.GetExitTime()
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetExitTime", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Process.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\Process.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetExitTime, Event: On Click Script ]]------------------------------
exitTime = Process.GetExitTime();
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process ExitTime", "ProcessExitTime: "..exitTime, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetStartTime, Event: On Click Script ]]------------------------------
startTime = Process.GetStartTime();
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process StartTime", "ProcessStartTime: "..startTime, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetExitCode, Event: On Click Script ]]------------------------------
exitCode = Process.GetExitCode();
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process ExitCode", "ProcessExitCode: "..exitCode, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonHasExited, Event: On Click Script ]]------------------------------
hasExited = Process.HasExited();
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process HasExited", "ProcessHasExited: "..hasExited, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonClose, Event: On Click Script ]]------------------------------
Process.Close();
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process Closed", "Process Closed.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStop, Event: On Click Script ]]------------------------------
--processCount = Process.Stop("");
processCount = Process.Stop("iexplore");
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process Count", "ProcessCount: "..processCount, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonWaitForInputIdle, Event: On Click Script ]]------------------------------
inputIdle = Process.WaitForInputIdle(-1); -- if -1, process wait in definitely, other than that specify the amount of time in milliseconds.
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process IputIdle", "ProcessInputIdle: "..inputIdle, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonWaitForExit, Event: On Click Script ]]------------------------------
hasExited = Process.WaitForExit(-1);-- if -1, process wait in definitely, other than that specify the amount of time in milliseconds.
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process HasExited", "ProcessHasExited: "..hasExited, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCloseMainWindow, Event: On Click Script ]]------------------------------
--windowCount = Process.CloseMainWindow("");
windowCount = Process.CloseMainWindow("iexplore");
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process WindowCount", "ProcessWindowCount: "..windowCount, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetProcessesByLoadedModuleName, Event: On Click Script ]]------------------------------
processes = Process.GetProcessesByLoadedModuleName("Process.dll");
error = Process.GetError();

if (error == "") then
	for i, v in processes do
		ListBox.AddItem("ListBox1", v.Name.."\t"..v.Id, "");
	end
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonIsModuleLoaded, Event: On Click Script ]]------------------------------
isLoaded = Process.IsModuleLoaded("Process.dll");
error = Process.GetError();

if (error == "") then
	Dialog.Message("IsModuleLoaded", isLoaded, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetModules, Event: On Click Script ]]------------------------------
modules = Process.GetModules(); --Use Process.Start or Process.GetProcessById to get a valid process.
error = Process.GetError();

if (error == "") then
	for i, v in modules do
		ListBox.AddItem("ListBox1", v, "");
	end
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetMainWindowTitle, Event: On Click Script ]]------------------------------
oldWindowTitle = Process.SetMainWindowTitle("New Title");
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process OldWindowTitle", "ProcessOldWindowTitle: "..oldWindowTitle, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetMainWindowTitle, Event: On Click Script ]]------------------------------
windowTitle = Process.GetMainWindowTitle();
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process WindowTitle", "ProcessWindowTitle: "..windowTitle, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetFileName, Event: On Click Script ]]------------------------------
fileName = Process.GetFileName();
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process FileName", "ProcessFileName: "..fileName, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetName, Event: On Click Script ]]------------------------------
name = Process.GetName();
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process Name", "ProcessName: "..name, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetMainWindowHandle, Event: On Click Script ]]------------------------------
hWnd = Process.GetMainWindowHandle();
error = Process.GetError();

if (error == "") then
	Dialog.Message("Window Handle", "WindowHandle: "..hWnd, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetId, Event: On Click Script ]]------------------------------
id = Process.GetId();
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process Id", "ProcessId: "..id, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetHandle, Event: On Click Script ]]------------------------------
handle = Process.GetHandle();
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process Handle", "ProcessHandle: "..handle, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStart, Event: On Click Script ]]------------------------------
--Process.Start("iexplore", "www.indigorose.com", WindowStyle.Normal);
Process.Start("notepad", "", WindowStyle.Normal);
error = Process.GetError();

if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetProcessById, Event: On Click Script ]]------------------------------
Process.GetProcessById(1234);
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process Info", "ProcessHandle:\t"..Process.GetHandle().."\r\nProcessId:\t"..Process.GetId().."\r\nProcessName:\t"..Process.GetName().."\r\nProcessFileName:\t"..Process.GetFileName(), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetCurrentProcess, Event: On Click Script ]]------------------------------
Process.GetCurrentProcess();
error = Process.GetError();

if (error == "") then
	Dialog.Message("Process Info", "ProcessHandle:\t"..Process.GetHandle().."\r\nProcessId:\t"..Process.GetId().."\r\nProcessName:\t"..Process.GetName().."\r\nProcessFileName:\t"..Process.GetFileName(), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetProcessesByName, Event: On Click Script ]]------------------------------
processes = Process.GetProcessesByName("notepad");
error = Process.GetError();

if (error == "") then
	for i, v in processes do
		ListBox.AddItem("ListBox1", v.Name.."\t"..v.Id, "");
	end
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetProcesses, Event: On Click Script ]]------------------------------
processes = Process.GetProcesses();
error = Process.GetError();

if (error == "") then
	for i, v in processes do
		ListBox.AddItem("ListBox1", v.Name.."\t"..v.Id, "");
	end
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

