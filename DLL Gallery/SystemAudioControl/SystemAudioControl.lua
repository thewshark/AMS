--GetCDVol
CDVol = DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "GetCDVol", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
--GetLineVol
LineVol = DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "GetLineVol", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
--GetMasterVol
MasterVol = DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "GetMasterVol", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
--GetWaveVol
WaveVol = DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "GetWaveVol", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);

--IsCDMuteOn
IsCDMuteOn = tonumber(DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "IsCDMuteOn", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL));
--IsLineMuteOn
IsLineMuteOn = tonumber(DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "IsLineMuteOn", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL));
--IsMasterMuteOn
IsMasterMuteOn = tonumber(DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "IsMasterMuteOn", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL));
--IsMicMuteOn
IsMicMuteOn = tonumber(DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "IsMicMuteOn", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL));
--IsWaveMuteOn
IsWaveMuteOn = tonumber(DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "IsWaveMuteOn", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL));

--SetCDMuteOff
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetMasterMuteOff", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
--SetCDMuteOn
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetCDMuteOn", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
--SetCDVol
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetCDVol", num, DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);

--SetLineMuteOff
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetMasterMuteOff", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
--SetLineMuteOn
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetLineMuteOn", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
--SetLineVol
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetLineVol", num, DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);

--SetMasterMuteOff
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetMasterMuteOff", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
--SetMasterMuteOn
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetMasterMuteOn", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
--SetMasterVol
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetMasterVol", num, DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);

--SetMicMuteOff
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetMicMuteOff", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
--SetMicMuteOn
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetMicMuteOn", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
--SetMicVol
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetMicVol", num, DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);

--SetWaveMuteOff
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetWaveMuteOff", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
--SetWaveMuteOn
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetWaveMuteOn", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
--SetWaveVol
DLL.CallFunction("Autoplay\\Docs\\SystemAudioControl.dll", "SetWaveVol", num, DLL_RETURN_TYPE_INTEGER, DLL_CALL_CDECL);
