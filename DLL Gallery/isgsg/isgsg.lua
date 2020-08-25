local Dll = "AutoPlay\\Docs\\isgsg.dll"; 
local hWnd = Application.GetWndHandle();
local SplashFile = "AutoPlay\\Docs\\logo.png";
local FadeInTime = 1000;
local FadeOutTime = 1000;
local TimeToShow = 5000;
local arg = hWnd..",\""..SplashFile.."\","..FadeInTime..","..TimeToShow..","..FadeOutTime..",0,255,False,$FFFFFF,10"

DLL.CallFunction(Dll, "ShowSplashScreen", arg, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL); 
