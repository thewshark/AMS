------------------------------[[ SCRIPT: Global Script ]]------------------------------
function StringToTable(string)
	traceData = {};
	
	index1 = String.Find(string, ",", 1, false);
	index2 = String.Find(string, ",", index1 + 1, false);

	traceData.HopNr = String.Left(string, index1 - 1);
	traceData.HostAddress = String.Mid(string, index1 + 1, index2 - index1 - 1);
	traceData.HostName = String.Right(string, String.Length(string) - index2);
	
	return traceData;
end

TraceRoute = {};
function TraceRoute.Trace(host)
	DLL.CallFunction("AutoPlay\\Docs\\TraceRoute.dll", "Trace", "\""..host.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function TraceRoute.GetStatus()
	return DLL.CallFunction("AutoPlay\\Docs\\TraceRoute.dll", "GetStatus", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function TraceRoute.GetTraceData()
	traceData = DLL.CallFunction("AutoPlay\\Docs\\TraceRoute.dll", "GetTraceData", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(traceData);
end
function TraceRoute.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\TraceRoute.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Event: On Timer Script ]]------------------------------
status = TraceRoute.GetStatus();
traceData = TraceRoute.GetTraceData();

Window.SetText(Application.GetWndHandle(), "TraceRoute [Status = "..status.."]");

if (status == "Started") then
	--Button.SetEnabled("ButtonTrace", false);
elseif (status == "Working" and traceData.HopNr ~= "") then
	ListBox.AddItem("ListBoxTraceResults", traceData.HopNr.."\t"..traceData.HostAddress.."\t"..traceData.HostName, "");
elseif (status == "Stopped") then
	Page.StopTimer();
	Button.SetEnabled("ButtonTrace", true);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonTrace, Event: On Click Script ]]------------------------------
TraceRoute.Trace(Input.GetText("InputHost"));
error = TraceRoute.GetError();

if (error == "") then
	Page.StartTimer(10);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

