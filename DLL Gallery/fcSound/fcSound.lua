-- + Vol

local wvol;
local mvol;
wvol = 0;
wvol = DLL.CallFunction("AutoPlay\\DLL\\fcSound.dll", "GetWaveVol", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
wvol = wvol + 10;
if wvol > 100 then
	wvol=100;
	mvol = DLL.CallFunction("AutoPlay\\DLL\\fcSound.dll", "GetMasterVol", "", DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
	mvol= mvol + 10;
	if mvol > 100 then
		mvol=100;
	end
	result = DLL.CallFunction("AutoPlay\\DLL\\fcSound.DLL", "SetWaveVol", wvol, DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
	result = DLL.CallFunction("AutoPlay\\DLL\\fcSound.DLL", "SetMasterVol", mvol, DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
else
	result = DLL.CallFunction("AutoPlay\\DLL\\fcSound.DLL", "SetWaveVol", wvol, DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
end

-- - Vol

wvol=0;
wvol = DLL.CallFunction("AutoPlay\\DLL\\fcSound.dll", "GetWaveVol", "", DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
wvol= wvol - 10;
if wvol < 0 then
	wvol=0;
	mvol = DLL.CallFunction("AutoPlay\\DLL\\fcSound.dll", "GetMasterVol", "", DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
	mvol= mvol - 10;
	if mvol < 0 then
		mvol=0;
	end
	result = DLL.CallFunction("AutoPlay\\DLL\\fcSound.DLL", "SetWaveVol", wvol, DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
	result = DLL.CallFunction("AutoPlay\\DLL\\fcSound.DLL", "SetMasterVol", mvol, DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
else
	result = DLL.CallFunction("AutoPlay\\DLL\\fcSound.DLL", "SetWaveVol", wvol, DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
end

