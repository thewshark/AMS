------------------------------[[ SCRIPT: Global Script ]]------------------------------
Shutdown = {};
function Shutdown.Abort()
	DLL.CallFunction("AutoPlay\\Docs\\Shutdown.dll", "Abort", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Shutdown.Permit()
	DLL.CallFunction("AutoPlay\\Docs\\Shutdown.dll", "Permit", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Shutdown.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\Shutdown.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonPermit, Event: On Click Script ]]------------------------------
Shutdown.Permit();
Input.SetText("Input1", "Permit");

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonAbort, Event: On Click Script ]]------------------------------
Shutdown.Abort();
Input.SetText("Input1", "Abort");

