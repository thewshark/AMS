function SendKeys(sSendString)
sSendString = "\"" ..sSendString.."\""
result = DLL.CallFunction(_SourceFolder.. "\\AutoPlay\\Docs\\dll\\KeyStokes.dll", "KEYSTROKE", sSendString, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL)
end

Page.SetFocus("Web1");
SendKeys("\"^+\"")



--other
CurX, CurY = GetCurrentXY();

X, Y = GetObjectLocation("Web1", 790, 545);

DLL.CallFunction("AutoPlay\\Docs\\KEYSTROKES.DLL", "KEYSTROKE", "\"{LMOUSECLICK " .. X  .. " " .. Y .. "}\"", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);


DLL.CallFunction("AutoPlay\\Docs\\KEYSTROKES.DLL", "KEYSTROKE", "\"{\^+\"}\"", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);


DLL.CallFunction("AutoPlay\\Docs\\KEYSTROKES.DLL", "KEYSTROKE", "\"{RMOUSECLICK " .. CurX  .. " " .. CurY .. "}\"", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);

