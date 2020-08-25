------------------------------[[ SCRIPT: Global Script ]]------------------------------
function StringToTable(string)
	index = String.Find(string, ",", 1, false);
	eventData = {};
	eventData.EventType = String.Left(string, index - 1);
	eventData.EventInfo = String.Right(string, String.Length(string) - index);
	return eventData;
end


EventType = {};
EventType.DisplaySettingsChanging = 0;
EventType.DisplaySettingsChanged = 1;
EventType.InstalledFontsChanged = 2;
EventType.LowMemory = 3;
EventType.PaletteChanged = 4;
EventType.PowerModeChanged = 5;
EventType.SessionSwitch = 6;
EventType.SessionEnding = 7;
EventType.SessionEnded = 8;
EventType.TimeChanged = 9;
EventType.UserPreferenceChanging = 10;
EventType.UserPreferenceChanged = 11;


Events = {};

function Events.Subscribe(eventType)
	DLL.CallFunction("AutoPlay\\Docs\\Events.dll", "Subscribe", eventType, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

function Events.Unsubscribe(eventType)
	DLL.CallFunction("AutoPlay\\Docs\\Events.dll", "Unsubscribe", eventType, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

function Events.GetCancelSessionEnding()
	return DLL.CallFunction("AutoPlay\\Docs\\Events.dll", "GetCancelSessionEnding", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function Events.SetCancelSessionEnding(value)
	if (value == true) then value = 1; else value = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\Events.dll", "SetCancelSessionEnding", value, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

function Events.GetEventData()
	eventData = DLL.CallFunction("AutoPlay\\Docs\\Events.dll", "GetEventData", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	if (eventData ~= "") then
		return StringToTable(eventData);
	else
		return { EventType = "", EventInfo = "" };
	end
end

function Events.GetEventCount()
	return DLL.CallFunction("AutoPlay\\Docs\\Events.dll", "GetEventCount", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function Events.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\Events.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end


------------------------------[[ SCRIPT: Page: Page1, Event: On Show Script ]]------------------------------
Page.StartTimer(100);


------------------------------[[ SCRIPT: Page: Page1, Event: On Timer Script ]]------------------------------
eventData = Events.GetEventData();
if (eventData.EventType == "SessionEnding") then
	--Page.StopTimer();
	--ListBox.AddItem("ListBoxEvents", "["..eventData.EventType..","..eventData.EventInfo.."]", "");
	--File.Run("cmd.exe", "shutdown"..",".."/?", "", SW_SHOWNORMAL, false);
	if (eventData.EventInfo == "Logoff") then
		for i = 0, 10, 1 do
			ListBox.AddItem("ListBoxEvents", i.." Logoff", "");
		end
	elseif (eventData.EventInfo == "SystemShutdown") then
		for i = 0, 10, 1 do
			ListBox.AddItem("ListBoxEvents", i.." Logoff", "");
		end
	end
end


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonUnsubscribe, Event: On Click Script ]]------------------------------
Events.Unsubscribe(EventType.UserPreferenceChanging);
--Events.Unsubscribe(EventType.TimeChanged);
--Events.Unsubscribe(EventType.SessionEnding);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSubscribe, Event: On Click Script ]]------------------------------
Events.Subscribe(EventType.UserPreferenceChanging);
--Events.Subscribe(EventType.TimeChanged);
--Events.Subscribe(EventType.SessionEnding);
--Events.SetCancelSessionEnding(true);


