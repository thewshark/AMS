------------------------------[[ SCRIPT: Global Script ]]------------------------------
function StringToTable(string)
	index1 = String.Find(string, ",", 1, false);
	index2 = String.Find(string, ",", index1 + 1, false);
	
	audioSettings = {};
	audioSettings.Channels = String.Left(string, index1 - 1);
	audioSettings.SamplesPerSec = String.Mid(string, index1 + 1, index2 - index1 - 1);
	audioSettings.BitsPerSample = String.Right(string, String.Length(string) - index2);
	
	return audioSettings;
end

function DelimitedStringToTable(DelimitedString, Delimiter)
	tbReturn = {};
	local strWorking;
	local nPos = nil;
	local strData;
	local nTableIndex = 1;
	local nDelimiterLength = String.Length(Delimiter);
	
	if(nDelimiterLength < 1)then
		tbReturn[nTableIndex] = DelimitedString;
		return tbReturn;
	end
	
	strWorking = DelimitedString;
	nPos = String.Find(strWorking,Delimiter);
	while(nPos ~= -1)do
		strData = String.Left(strWorking,nPos-1);
		tbReturn[nTableIndex] = strData;
		nTableIndex = nTableIndex + 1;
		local nLength = String.Length(strWorking);
		strWorking = String.Right(strWorking,nLength - (nPos + (nDelimiterLength-1)));
		nPos = String.Find(strWorking,Delimiter);
	end
	if(strWorking ~= "")then
		tbReturn[nTableIndex] = strWorking;
	end
	
	return tbReturn;
end

--Audio capture quality settings.
AudioCaptureQuality = {};
--channels=1, samplesPerSec=11025, bitsPerSample=8);
AudioCaptureQuality.Low = 0;
--channels=2, samplesPerSec=22050, bitsPerSample=16);
AudioCaptureQuality.Medium = 1;
--channels=2, samplesPerSec=44100, bitsPerSample=16);
AudioCaptureQuality.High = 2;

AudioCapture = {};
--Gets audio capture quality.
function AudioCapture.GetQuality()
	return DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "GetQuality", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Gets audio capture settings. [channels = 1 (mono), 2 (stereo); samplesPerSec = 8000 (hz), 11025 (hz), 22050 (hz), 44100 (hz); bitsPerSample = 8, 16;]
function AudioCapture.GetSettings()
	settings = DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "GetSettings", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(settings);
end
--Gets audio capture time position in milliseconds.
function AudioCapture.GetPosition()
	return DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "GetPosition", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Gets audio capture length in milliseconds.
function AudioCapture.GetLength()
	return DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "GetLength", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Gets audio capture size in bytes.
function AudioCapture.GetSize()
	return DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "GetSize", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Gets audio capture mode status.
function AudioCapture.GetStatus()
	return DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "GetStatus", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Gets audio capture input devices.
function AudioCapture.GetInputDevices()
	inputDevices = DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "GetInputDevices", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return DelimitedStringToTable(inputDevices, "\r\n");
end
--Gets audio capture default input device.
function AudioCapture.GetDefaultInputDevice()
	return DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "GetDefaultInputDevice", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Sets audio capture quality.
function AudioCapture.SetQuality(quality)
	DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "SetQuality", quality, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Sets audio capture settings. [channels = 1 (mono), 2 (stereo); samplesPerSec = 8000 (hz), 11025 (hz), 22050 (hz), 44100 (hz); bitsPerSample = 8, 16;]
function AudioCapture.SetSettings(channels, samplesPerSec, bitsPerSample)
	DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "SetSettings", channels..","..samplesPerSec..","..bitsPerSample, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Sets audio capture time position in milliseconds.
function AudioCapture.SetPosition(position)
	DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "SetPosition", position, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Sets audio capture default input device.
function AudioCapture.SetDefaultInputDevice(device)
	DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "SetDefaultInputDevice", "\""..device.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Shows sounds and audio devices dialog. The same one from control panel.
function AudioCapture.SoundsAndAudioDevicesDialog()
	DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "SoundsAndAudioDevicesDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Start audio capture.
function AudioCapture.CaptureStart()
	DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "CaptureStart", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Stop audio capture.
function AudioCapture.CaptureStop()
	DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "CaptureStop", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Start playing captured audio.
function AudioCapture.PlayStart()
	DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "PlayStart", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Stop playing captured audio.
function AudioCapture.PlayStop()
	DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "PlayStop", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Save captured audio.
function AudioCapture.Save(fileName)
	DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "Save", "\""..fileName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Clear captured audio.
function AudioCapture.Clear()
	DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "Clear", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Get error if any occur.
function AudioCapture.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\AudioCapture.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end


------------------------------[[ SCRIPT: Page: Page1, Event: On Show Script ]]------------------------------
inputDevices = AudioCapture.GetInputDevices();
defaultInputDevice = AudioCapture.GetDefaultInputDevice();

for i, v in inputDevices do
	ListBox.AddItem("ListBoxInputDevices", v, "");
	if (v == defaultInputDevice) then
		ListBox.SelectItem("ListBoxInputDevices", i);
	end
end

Page.StartTimer(100);


------------------------------[[ SCRIPT: Page: Page1, Event: On Timer Script ]]------------------------------
Input.SetText("InputLength", AudioCapture.GetLength());
Input.SetText("InputSize", AudioCapture.GetSize());
Input.SetText("InputStatus", AudioCapture.GetStatus());


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetDefault, Event: On Click Script ]]------------------------------
deviceName = ListBox.GetItemText("ListBoxInputDevices", ListBox.GetSelected("ListBoxInputDevices")[1]);
AudioCapture.SetDefaultInputDevice(deviceName);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetDefault, Event: On Click Script ]]------------------------------
Dialog.Message("DefaultInputDevice", AudioCapture.GetDefaultInputDevice(), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSoundsAndAudioDevicesDialog, Event: On Click Script ]]------------------------------
AudioCapture.SoundsAndAudioDevicesDialog();


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetSettings, Event: On Click Script ]]------------------------------
settings = AudioCapture.GetSettings();
Dialog.Message("Notice", "Channels:\t"..settings.Channels.."\r\nSamplesPerSec:\t"..settings.SamplesPerSec.."\r\nBitsPerSample:\t"..settings.BitsPerSample, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetQuality, Event: On Click Script ]]------------------------------
Dialog.Message("Notice", AudioCapture.GetQuality(), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonClear, Event: On Click Script ]]------------------------------
AudioCapture.Clear();


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSave, Event: On Click Script ]]------------------------------
fileName = Dialog.FileBrowse(false, "Locate File", _DesktopFolder, "Wav File (*.wav)|*.wav|", "", "wav", false, false)[1];
if (fileName ~= "CANCEL") then
	AudioCapture.Save(fileName);
end


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonPlayStop, Event: On Click Script ]]------------------------------
AudioCapture.PlayStop();


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonPlayStart, Event: On Click Script ]]------------------------------
AudioCapture.PlayStart();


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCaptureStop, Event: On Click Script ]]------------------------------
AudioCapture.CaptureStop();


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCaptureStart, Event: On Click Script ]]------------------------------
AudioCapture.CaptureStart();


