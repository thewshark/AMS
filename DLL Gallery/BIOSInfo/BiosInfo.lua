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



BiosInfo = { };
function BiosInfo.BiosCharacteristics()
	stringValue = DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "BiosCharacteristics", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return DelimitedStringToTable(stringValue, "\r\n");
end
function BiosInfo.BIOSVersion()
	stringValue = DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "BIOSVersion", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
	return DelimitedStringToTable(stringValue, "\r\n");
end
function BiosInfo.BuildNumber()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "BuildNumber", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.Caption()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "Caption", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function BiosInfo.CodeSet()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "CodeSet", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.CurrentLanguage()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "CurrentLanguage", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.Description()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "Description", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.IdentificationCode()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "IdentificationCode", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.InstallableLanguages()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "InstallableLanguages", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.InstallDate()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "InstallDate", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.LanguageEdition()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "LanguageEdition", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.ListOfLanguages()
	stringValue = DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "ListOfLanguages", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
	return DelimitedStringToTable(stringValue, "\r\n");
end
function BiosInfo.Manufacturer()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "Manufacturer", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.Name()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "Name", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.OtherTargetOS()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "OtherTargetOS", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.PrimaryBIOS()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "PrimaryBIOS", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.ReleaseDate()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "ReleaseDate", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.SerialNumber()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "SerialNumber", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.SMBIOSBIOSVersion()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "SMBIOSBIOSVersion", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.SMBIOSMajorVersion()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "SMBIOSMajorVersion", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.SMBIOSMinorVersion()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "SMBIOSMinorVersion", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.SMBIOSPresent()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "SMBIOSPresent", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.SoftwareElementID()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "SoftwareElementID", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.SoftwareElementState()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "SoftwareElementState", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.Status()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "Status", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.TargetOperatingSystem()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "TargetOperatingSystem", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.Version()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "Version", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end
function BiosInfo.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\BiosInfo.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonComUnRegister, Event: On Click Script ]]------------------------------
System.UnregisterActiveX(Folder.GetCurrent().."\\AutoPlay\\Docs\\BiosInfo.dll");

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetBiosInfo2, Event: On Click Script ]]------------------------------
--ListBox.AddItem("ListBox1", BiosInfo.BiosCharacteristics(), "");
for i, v in BiosInfo.BiosCharacteristics() do
	ListBox.AddItem("ListBox1", v, "");
end

--ListBox.AddItem("ListBox1", BiosInfo.BIOSVersion(), "");
for i, v in BiosInfo.BIOSVersion() do
	ListBox.AddItem("ListBox1", v, "");
end

ListBox.AddItem("ListBox1", BiosInfo.BuildNumber(), "");
ListBox.AddItem("ListBox1", BiosInfo.Caption(), "");
ListBox.AddItem("ListBox1", BiosInfo.CodeSet(), "");
ListBox.AddItem("ListBox1", BiosInfo.CurrentLanguage(), "");
ListBox.AddItem("ListBox1", BiosInfo.Description(), "");
ListBox.AddItem("ListBox1", BiosInfo.IdentificationCode(), "");
ListBox.AddItem("ListBox1", BiosInfo.InstallableLanguages(), "");
ListBox.AddItem("ListBox1", BiosInfo.InstallDate(), "");
ListBox.AddItem("ListBox1", BiosInfo.LanguageEdition(), "");

--ListBox.AddItem("ListBox1", BiosInfo.ListOfLanguages(), "");
for i, v in BiosInfo.ListOfLanguages() do
	ListBox.AddItem("ListBox1", v, "");
end

ListBox.AddItem("ListBox1", BiosInfo.Manufacturer(), "");
ListBox.AddItem("ListBox1", BiosInfo.Name(), "");
ListBox.AddItem("ListBox1", BiosInfo.OtherTargetOS(), "");
ListBox.AddItem("ListBox1", BiosInfo.PrimaryBIOS(), "");
ListBox.AddItem("ListBox1", BiosInfo.ReleaseDate(), "");
ListBox.AddItem("ListBox1", BiosInfo.SerialNumber(), "");
ListBox.AddItem("ListBox1", BiosInfo.SMBIOSBIOSVersion(), "");
ListBox.AddItem("ListBox1", BiosInfo.SMBIOSMajorVersion(), "");
ListBox.AddItem("ListBox1", BiosInfo.SMBIOSMinorVersion(), "");
ListBox.AddItem("ListBox1", BiosInfo.SMBIOSPresent(), "");
ListBox.AddItem("ListBox1", BiosInfo.SoftwareElementID(), "");
ListBox.AddItem("ListBox1", BiosInfo.SoftwareElementState(), "");
ListBox.AddItem("ListBox1", BiosInfo.Status(), "");
ListBox.AddItem("ListBox1", BiosInfo.TargetOperatingSystem(), "");
ListBox.AddItem("ListBox1", BiosInfo.Version(), "");

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetBiosInfo, Event: On Click Script ]]------------------------------
bi = luacom.CreateObject("BiosInfo.BiosInfoClass");

--ListBox.AddItem("ListBox1", bi:BiosCharacteristics(), "");
for i, v in bi:BiosCharacteristics() do
	ListBox.AddItem("ListBox1", v, "");
end
--ListBox.AddItem("ListBox1", bi:BIOSVersion(), "");
for i, v in bi:BIOSVersion() do
	ListBox.AddItem("ListBox1", v, "");
end

ListBox.AddItem("ListBox1", bi:BuildNumber(), "");
ListBox.AddItem("ListBox1", bi:Caption(), "");
ListBox.AddItem("ListBox1", bi:CodeSet(), "");
ListBox.AddItem("ListBox1", bi:CurrentLanguage(), "");
ListBox.AddItem("ListBox1", bi:Description(), "");
ListBox.AddItem("ListBox1", bi:IdentificationCode(), "");
ListBox.AddItem("ListBox1", bi:InstallableLanguages(), "");
ListBox.AddItem("ListBox1", bi:InstallDate(), "");
ListBox.AddItem("ListBox1", bi:LanguageEdition(), "");

--ListBox.AddItem("ListBox1", bi:ListOfLanguages(), "");
for i, v in bi:ListOfLanguages() do
	ListBox.AddItem("ListBox1", v, "");
end

ListBox.AddItem("ListBox1", bi:Manufacturer(), "");
ListBox.AddItem("ListBox1", bi:Name(), "");
ListBox.AddItem("ListBox1", bi:OtherTargetOS(), "");

--ListBox.AddItem("ListBox1", bi:PrimaryBIOS(), "");
if (bi:PrimaryBIOS() == true) then
	ListBox.AddItem("ListBox1", "true", "");
else
	ListBox.AddItem("ListBox1", "false", "");
end

ListBox.AddItem("ListBox1", bi:ReleaseDate(), "");
ListBox.AddItem("ListBox1", bi:SerialNumber(), "");
ListBox.AddItem("ListBox1", bi:SMBIOSBIOSVersion(), "");
ListBox.AddItem("ListBox1", bi:SMBIOSMajorVersion(), "");
ListBox.AddItem("ListBox1", bi:SMBIOSMinorVersion(), "");

--ListBox.AddItem("ListBox1", bi:SMBIOSPresent(), "");
if (bi:SMBIOSPresent() == true) then
	ListBox.AddItem("ListBox1", "true", "");
else
	ListBox.AddItem("ListBox1", "false", "");
end

ListBox.AddItem("ListBox1", bi:SoftwareElementID(), "");
ListBox.AddItem("ListBox1", bi:SoftwareElementState(), "");
ListBox.AddItem("ListBox1", bi:Status(), "");
ListBox.AddItem("ListBox1", bi:TargetOperatingSystem(), "");
ListBox.AddItem("ListBox1", bi:Version(), "");

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonComRegister, Event: On Click Script ]]------------------------------
System.RegisterActiveX(Folder.GetCurrent().."\\AutoPlay\\Docs\\BiosInfo.dll");

