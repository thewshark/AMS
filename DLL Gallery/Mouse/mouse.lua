function GetCurrentXY()
	CurX=String.ToNumber(DLL.CallFunction("AutoPlay\\Docs\\mouse.dll", "GetMouseX", Application.GetWndHandle(), DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL))
	CurY=String.ToNumber(DLL.CallFunction("AutoPlay\\Docs\\mouse.dll", "GetMouseY", Application.GetWndHandle(), DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL))
	return CurX, CurY
end