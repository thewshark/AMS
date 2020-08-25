-- FadeOutApp Example

FadeOutTime = 1000
Handle = Application.GetWndHandle();
Args = FadeOutTime..","..Handle


DLL.CallFunction("AutoPlay\\Docs\\FadeOutApp.dll", "FadeOut", Args, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);