-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
---------------- Server APZ
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------



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

function RowToTable(string)
	index = String.Find(string, "|", 1, false);
	process = {};
	process.Name = String.Left(string, index - 1);
	process.Id = String.Right(string, String.Length(string) - index);
	return process;
end

function ProcessStringToTable(DelimitedString, Delimiter)
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
		tbReturn[nTableIndex] = RowToTable(strData);
		nTableIndex = nTableIndex + 1;
		local nLength = String.Length(strWorking);
		strWorking = String.Right(strWorking,nLength - (nPos + (nDelimiterLength-1)));
		nPos = String.Find(strWorking,Delimiter);
	end
	
	if(strWorking ~= "")then
		tbReturn[nTableIndex] = RowToTable(strWorking);
	end
	
	return tbReturn;
end

pid = 0;

RemoteControl = {};
function RemoteControl.Connect(host)
	DLL.CallFunction("RemoteControl.dll", "Connect", "\""..host.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.Disconnect()
	DLL.CallFunction("RemoteControl.dll", "Disconnect", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.Start()
	DLL.CallFunction("RemoteControl.dll", "Start", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.Stop()
	DLL.CallFunction("RemoteControl.dll", "Stop", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.GetDesktopImage()
	return DLL.CallFunction("RemoteControl.dll", "GetDesktopImage", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function RemoteControl.GetDrives()
	drives = DLL.CallFunction("RemoteControl.dll", "GetDrives", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(drives, "\r\n");
end
function RemoteControl.GetDirectories(path)
	dirs = DLL.CallFunction("RemoteControl.dll", "GetDirectories", "\""..path.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(dirs, "\r\n");
end
function RemoteControl.GetFiles(path)
	files = DLL.CallFunction("RemoteControl.dll", "GetFiles", "\""..path.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(files, "\r\n");
end
function RemoteControl.DownloadFile(file, fileName)
	DLL.CallFunction("RemoteControl.dll", "DownloadFile", "\""..file.."\""..",".."\""..fileName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.UploadFile(file, fileName)
	DLL.CallFunction("RemoteControl.dll", "UploadFile", "\""..file.."\""..",".."\""..fileName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.GetRegistryValue(keyName, valueName)
	return DLL.CallFunction("RemoteControl.dll", "GetRegistryValue", "\""..keyName.."\""..",".."\""..valueName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function RemoteControl.SetRegistryValue(keyName, valueName, value)
	DLL.CallFunction("RemoteControl.dll", "SetRegistryValue",  "\""..keyName.."\""..",".."\""..valueName.."\""..",".."\""..value.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.GetProcesses()
	processes = DLL.CallFunction("RemoteControl.dll", "GetProcesses", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return ProcessStringToTable(processes, "\r\n");
end
function RemoteControl.ProcessStart(fileName, arguments)
	return DLL.CallFunction("RemoteControl.dll", "ProcessStart", "\""..fileName.."\""..",".."\""..arguments.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.ProcessStop(pid)
	DLL.CallFunction("RemoteControl.dll", "ProcessStop", pid, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function RemoteControl.Shutdown()
	DLL.CallFunction("RemoteControl.dll", "Shutdown", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.Restart()
	DLL.CallFunction("RemoteControl.dll", "Restart", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.GetError()
	return DLL.CallFunction("RemoteControl.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStop, Event: On Click Script ]]------------------------------
RemoteControl.Stop();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStart, Event: On Click Script ]]------------------------------
RemoteControl.Start();
error = RemoteControl.GetError();

if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
---------------- Client APZ
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------


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

function RowToTable(string)
	index = String.Find(string, "|", 1, false);
	process = {};
	process.Name = String.Left(string, index - 1);
	process.Id = String.Right(string, String.Length(string) - index);
	return process;
end

function ProcessStringToTable(DelimitedString, Delimiter)
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
		tbReturn[nTableIndex] = RowToTable(strData);
		nTableIndex = nTableIndex + 1;
		local nLength = String.Length(strWorking);
		strWorking = String.Right(strWorking,nLength - (nPos + (nDelimiterLength-1)));
		nPos = String.Find(strWorking,Delimiter);
	end
	
	if(strWorking ~= "")then
		tbReturn[nTableIndex] = RowToTable(strWorking);
	end
	
	return tbReturn;
end

pid = 0;

RemoteControl = {};
function RemoteControl.Connect(host)
	DLL.CallFunction("RemoteControl.dll", "Connect", "\""..host.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.Disconnect()
	DLL.CallFunction("RemoteControl.dll", "Disconnect", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.Start()
	DLL.CallFunction("RemoteControl.dll", "Start", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.Stop()
	DLL.CallFunction("RemoteControl.dll", "Stop", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.GetDesktopImage()
	return DLL.CallFunction("RemoteControl.dll", "GetDesktopImage", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function RemoteControl.GetDrives()
	drives = DLL.CallFunction("RemoteControl.dll", "GetDrives", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(drives, "\r\n");
end
function RemoteControl.GetDirectories(path)
	dirs = DLL.CallFunction("RemoteControl.dll", "GetDirectories", "\""..path.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(dirs, "\r\n");
end
function RemoteControl.GetFiles(path)
	files = DLL.CallFunction("RemoteControl.dll", "GetFiles", "\""..path.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(files, "\r\n");
end
function RemoteControl.DownloadFile(file, fileName)
	DLL.CallFunction("RemoteControl.dll", "DownloadFile", "\""..file.."\""..",".."\""..fileName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.UploadFile(file, fileName)
	DLL.CallFunction("RemoteControl.dll", "UploadFile", "\""..file.."\""..",".."\""..fileName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.GetRegistryValue(keyName, valueName)
	return DLL.CallFunction("RemoteControl.dll", "GetRegistryValue", "\""..keyName.."\""..",".."\""..valueName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function RemoteControl.SetRegistryValue(keyName, valueName, value)
	DLL.CallFunction("RemoteControl.dll", "SetRegistryValue",  "\""..keyName.."\""..",".."\""..valueName.."\""..",".."\""..value.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.GetProcesses()
	processes = DLL.CallFunction("RemoteControl.dll", "GetProcesses", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return ProcessStringToTable(processes, "\r\n");
end
function RemoteControl.ProcessStart(fileName, arguments)
	return DLL.CallFunction("RemoteControl.dll", "ProcessStart", "\""..fileName.."\""..",".."\""..arguments.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.ProcessStop(pid)
	DLL.CallFunction("RemoteControl.dll", "ProcessStop", pid, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function RemoteControl.Shutdown()
	DLL.CallFunction("RemoteControl.dll", "Shutdown", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.Restart()
	DLL.CallFunction("RemoteControl.dll", "Restart", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function RemoteControl.GetError()
	return DLL.CallFunction("RemoteControl.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonRestart, Event: On Click Script ]]------------------------------
RemoteControl.Restart();
error = RemoteControl.GetError();

if (error == "") then
	Dialog.Message("Success", "Computer restarted.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonShutdown, Event: On Click Script ]]------------------------------
RemoteControl.Shutdown();
error = RemoteControl.GetError();

if (error == "") then
	Dialog.Message("Success", "Computer shutdown.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonProcessStop, Event: On Click Script ]]------------------------------
RemoteControl.ProcessStop(pid);
error = RemoteControl.GetError();

if (error == "") then
	pid = 0;
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonProcessStart, Event: On Click Script ]]------------------------------
processId = RemoteControl.ProcessStart("iexplore", "www.indigorose.com");
error = RemoteControl.GetError();

if (error == "") then
	pid = processId;
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetProcesses, Event: On Click Script ]]------------------------------
processes = RemoteControl.GetProcesses();
error = RemoteControl.GetError();

if (error == "") then
	for i, v in processes do
		ListBox.AddItem("ListBoxProcesses", v.Name.."\t"..v.Id, "");
	end
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetRegistryValue, Event: On Click Script ]]------------------------------
RemoteControl.SetRegistryValue(keyName, valueName, value);
error = RemoteControl.GetError();

if (error == "") then
	Dialog.Message("Success", "Value is set", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetRegistryValue, Event: On Click Script ]]------------------------------
value = RemoteControl.GetRegistryValue("HKEY_LOCAL_MACHINE\\HARDWARE\\DESCRIPTION\\System\\CentralProcessor\\0", "ProcessorNameString");
error = RemoteControl.GetError();

if (error == "") then
	Dialog.Message("Success", value, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonUploadFile, Event: On Click Script ]]------------------------------
file = "C:\\Blue hills.jpg";
fileName = "D:\\Blue hills.jpg"
RemoteControl.UploadFile(file, fileName);
error = RemoteControl.GetError();

if (error == "") then
	pid = RemoteControl.ProcessStart(fileName, "");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDownloadFile, Event: On Click Script ]]------------------------------
file = "D:\\Blue hills.jpg";
fileName = "C:\\Blue hills.jpg"
RemoteControl.DownloadFile(file, fileName);
error = RemoteControl.GetError();

if (error == "") then
	File.Open(fileName, "", SW_SHOWNORMAL);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetFiles, Event: On Click Script ]]------------------------------
files = RemoteControl.GetFiles("C:\\Windows");
error = RemoteControl.GetError();

if (error == "") then
	ListBox.DeleteItem("ListBoxFiles", -1);

	for i, v in files do
		ListBox.AddItem("ListBoxFiles", v, "");
	end
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetDirectories, Event: On Click Script ]]------------------------------
directories = RemoteControl.GetDirectories("C:\\");
error = RemoteControl.GetError();

if (error == "") then
	ListBox.DeleteItem("ListBoxDirectories", -1);

	for i, v in directories do
		ListBox.AddItem("ListBoxDirectories", v, "");
	end
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetDrives, Event: On Click Script ]]------------------------------
drives = RemoteControl.GetDrives();
error = RemoteControl.GetError();

if (error == "") then
	ListBox.DeleteItem("ListBoxDrives", -1);

	for i, v in drives do
		ListBox.AddItem("ListBoxDrives", v, "");
	end
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDisconnect, Event: On Click Script ]]------------------------------
RemoteControl.Disconnect();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonConnect, Event: On Click Script ]]------------------------------
RemoteControl.Connect("192.168.2.103");
error = RemoteControl.GetError();

if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

