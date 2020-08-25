--[[
Functions:  BeepUp (Frequency (beep sound) goes from low to high pitch <AND> BeepDown (Frequency (beep sound) goes from hight to low pitch

Works on Win98/ME/2000/XP
]]

-- This an example of calling the function 'BeepUp' in the DLLCustomBeel.dll
-- args. (frequency min (start) number, frequency max (end) number, duration)
DLL.CallFunction("AutoPlay\\Docs\\CustomBeep.dll", "BeepUp", "0,20,50", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)

-- This an example of calling the function 'BeepDown' in the DLLCustomBeel.dll
-- args. (frequency min (start) number, frequency max (end) number, duration)
DLL.CallFunction("AutoPlay\\Docs\\CustomBeep.dll", "BeepDown", "0,50,20", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)