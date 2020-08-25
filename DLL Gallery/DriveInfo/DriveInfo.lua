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

DriveInfo = {};
function DriveInfo.GetDrives()
	drives = DLL.CallFunction("AutoPlay\\Docs\\DriveInfo.dll", "GetDrives", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return DelimitedStringToTable(drives, "\r\n");
end
function DriveInfo.GetHardwareSerial(driveName)
	return DLL.CallFunction("AutoPlay\\Docs\\DriveInfo.dll", "GetHardwareSerial", "\""..driveName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function DriveInfo.GetVolumeSerial(driveName)
	return DLL.CallFunction("AutoPlay\\Docs\\DriveInfo.dll", "GetVolumeSerial", "\""..driveName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function DriveInfo.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\DriveInfo.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ListBox1, Event: On Select Script ]]------------------------------
if (ListBox.GetSelectedCount("ListBox1") > 0) then
	Input.SetText("InputHardwareSerial", DriveInfo.GetHardwareSerial(ListBox.GetItemText("ListBox1", ListBox.GetSelected("ListBox1")[1])));
	Input.SetText("InputVolumeSerial", DriveInfo.GetVolumeSerial(ListBox.GetItemText("ListBox1", ListBox.GetSelected("ListBox1")[1])));
end


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetDrives, Event: On Click Script ]]------------------------------
drives = DriveInfo.GetDrives();
error = DriveInfo.GetError();

if (error == "") then
	for i, v in drives do
		ListBox.AddItem("ListBox1", v, "");
	end
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

