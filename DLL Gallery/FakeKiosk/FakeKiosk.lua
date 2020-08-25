Window.SetOrder(Application.GetWndHandle(),  HWND_TOPMOST)

local sDLLPATH="AutoPlay\\Docs\\FakeKiosk.dll"
local sLOGO="AutoPlay\\Images\\630A03104.jpg"
hDLL = DLL.CallFunction("kernel32.dll", "LoadLibraryA", "\""..sDLLPATH.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL); 
if (hDLL ~= 0) then
	DLL.CallFunction(sDLLPATH, "FakeKiosk","\""..sLOGO.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)
end