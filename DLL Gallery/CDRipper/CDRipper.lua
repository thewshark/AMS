------------------------------[[ SCRIPT: Global Script ]]------------------------------
CdRipper = { };
function CdRipper.LoadCd(cdDriveLetter)
	DLL.CallFunction("AutoPlay\\Docs\\CdRipper.dll", "LoadCd", "\""..cdDriveLetter.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function CdRipper.GetTrackSize(track)
	return DLL.CallFunction("AutoPlay\\Docs\\CdRipper.dll", "GetTrackSize", track, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CdRipper.RippTrack(index, fileName)
	return DLL.CallFunction("AutoPlay\\Docs\\CdRipper.dll", "RippTrack", index..",".."\""..fileName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CdRipper.RippTrackAsync(index, fileName)
	return DLL.CallFunction("AutoPlay\\Docs\\CdRipper.dll", "RippTrackAsync", index..",".."\""..fileName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
-- RippStart, Ripping, RippEnd,
function CdRipper.GetStatus()
	return DLL.CallFunction("AutoPlay\\Docs\\CdRipper.dll", "GetStatus", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CdRipper.GetBytesRipped()
	return DLL.CallFunction("AutoPlay\\Docs\\CdRipper.dll", "GetBytesRipped", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CdRipper.GetProgress()
	return DLL.CallFunction("AutoPlay\\Docs\\CdRipper.dll", "GetProgress", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CdRipper.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\CdRipper.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Event: On Timer Script ]]------------------------------
Input.SetText("InputStatus", CdRipper.GetStatus());
Input.SetText("InputBytesRipped", CdRipper.GetBytesRipped());
Input.SetText("InputProgress", CdRipper.GetProgress());

if (CdRipper.GetStatus() == "RippEnd") then
	Page.StopTimer();
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonRippTrack, Event: On Click Script ]]------------------------------
Page.StartTimer(100);

CdRipper.LoadCd("E:\\");

--trackSize = CdRipper.GetTrackSize(1);
Input.SetText("InputTrackSize", CdRipper.GetTrackSize(1));

--CdRipper.RippTrack(1, "Track1.wav");
CdRipper.RippTrackAsync(1, "Track1.wav");

