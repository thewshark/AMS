-- arguments: 0 = GUID, 1 = Profile name
-- returns: "0" = error, else guid or profile name is returned

GUID = DLL.CallFunction("AutoPlay\\Docs\\HardwareFingerprint.dll", "GetHardwareFingerprint", 0, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
pName = DLL.CallFunction("AutoPlay\\Docs\\HardwareFingerprint.dll", "GetHardwareFingerprint", 1, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

if GUID ~= "0" and pName ~= "0" then
	Dialog.Message("Test", "The global unique system identifier (GUID) for this system is\r\n\r\n"..GUID.."\r\nProfile: "..pName, MB_OK, MB_ICONNONE, MB_DEFBUTTON1)
end