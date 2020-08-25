------------------------------[[ SCRIPT: Global Script ]]------------------------------
WinCmd = {};

function WinCmd.Input(cmd)
	DLL.CallFunction("AutoPlay\\Docs\\WinCmd.dll", "Input", "\""..cmd.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function WinCmd.Output()
	return DLL.CallFunction("AutoPlay\\Docs\\WinCmd.dll", "Output", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function WinCmd.Error()
	return DLL.CallFunction("AutoPlay\\Docs\\WinCmd.dll", "Error", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btRun, Event: On Click Script ]]------------------------------
WinCmd.Input(Input.GetText("tbInput"));
output = WinCmd.Output()
error = WinCmd.Error();


if (error == "") then
	Input.SetText("tbOutput", output);
else
	Input.SetText("tbOutput", error);
end

