------------------------------[[ SCRIPT: Global Script ]]------------------------------
function StringToTable(DelimitedString, Delimiter)
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

TextToSpeech = {};
function TextToSpeech.GetVoices()
	voices = DLL.CallFunction("AutoPlay\\Docs\\TextToSpeech.dll", "GetVoices", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(voices, "\r\n");
end
function TextToSpeech.GetVoice()
	return DLL.CallFunction("AutoPlay\\Docs\\TextToSpeech.dll", "GetVoice", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function TextToSpeech.SetVoice(name)
	DLL.CallFunction("AutoPlay\\Docs\\TextToSpeech.dll", "SetVoice", "\""..name.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function TextToSpeech.GetVolume()
	return DLL.CallFunction("AutoPlay\\Docs\\TextToSpeech.dll", "GetVolume", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
-- Volume is a value from 0 to 100.
function TextToSpeech.SetVolume(volume)
	DLL.CallFunction("AutoPlay\\Docs\\TextToSpeech.dll", "SetVolume", volume, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function TextToSpeech.GetRate()
	return DLL.CallFunction("AutoPlay\\Docs\\TextToSpeech.dll", "GetRate", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
-- Rate is a value from -10 to 10
function TextToSpeech.SetRate(rate)
	DLL.CallFunction("AutoPlay\\Docs\\TextToSpeech.dll", "SetRate", rate, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function TextToSpeech.Speak(text)
	DLL.CallFunction("AutoPlay\\Docs\\TextToSpeech.dll", "Speak", "\""..text.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function TextToSpeech.Pause()
	DLL.CallFunction("AutoPlay\\Docs\\TextToSpeech.dll", "Pause", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function TextToSpeech.Resume()
	DLL.CallFunction("AutoPlay\\Docs\\TextToSpeech.dll", "Resume", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function TextToSpeech.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\TextToSpeech.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Event: On Show Script ]]------------------------------
voices = TextToSpeech.GetVoices();

for i, v in voices do
	ListBox.AddItem("ListBoxVoices", v, "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonResume, Event: On Click Script ]]------------------------------
TextToSpeech.Resume();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonPause, Event: On Click Script ]]------------------------------
TextToSpeech.Pause();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSpeak, Event: On Click Script ]]------------------------------
TextToSpeech.Speak(Input.GetText("InputText"));

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetRate, Event: On Click Script ]]------------------------------
TextToSpeech.SetRate(10);

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetVoice, Event: On Click Script ]]------------------------------
TextToSpeech.SetVoice(ListBox.GetItemText("ListBoxVoices", ListBox.GetSelected("ListBoxVoices")[1]));

