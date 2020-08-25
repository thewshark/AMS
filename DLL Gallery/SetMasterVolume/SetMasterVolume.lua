v = 1

for i = 68000, v, -100 do
	DLL.CallFunction("AutoPlay\\Docs\\SetMasterVolume.dll", "SETMV", i, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)
end


-- DLL "call" (to use) that allows for the adjustment of the system's Master Volume. (did this set it to 50%?  Post a reply back to this offerings thread, please)
DLL.CallFunction("AutoPlay\\Docs\\SetMasterVolume.dll", "SETMV", "34000", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)

-- DLL "call" (to use) that allows for the adjustment of the system's Master Volume.  (did this set it to 100%?  Post a reply back to this offerings thread, please)
DLL.CallFunction("AutoPlay\\Docs\\SetMasterVolume.dll", "SETMV", "68000", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)

