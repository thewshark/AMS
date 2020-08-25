-- Requires Windows 2000 or higher. 
-- Only invokes the format prompt (doesn't format automatically). 
-- Return 0 if Error or Cancel / 1 if successfull

sDrive = "A"-- Drive = A: B: C: ...
nType = 0-- Type = 0 for Full Format / 1 for Quick format
result = String.ToNumber(DLL.CallFunction("AutoPlay\\Docs\\FormatDrive.dll", "FormatDrive", "\""..sDrive.."\","..nType, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL));
if result == 0 then
	Dialog.Message("Debug", "Format Failed", MB_OK, MB_ICONEXCLAMATION, MB_DEFBUTTON1);
elseif result == 1 then
	Dialog.Message("Debug", "Format Success", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end