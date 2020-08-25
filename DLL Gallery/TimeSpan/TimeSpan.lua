------------------------------[[ SCRIPT: Global Script ]]------------------------------
TimeSpan = {};
function TimeSpan.Parse(timeSpan)
	return DLL.CallFunction("AutoPlay\\Docs\\ts.dll", "Parse", "\""..timeSpan.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function TimeSpan.GetTimeSpan(days, hours, minutes, seconds)
	return DLL.CallFunction("AutoPlay\\Docs\\ts.dll", "GetTimeSpan", days..","..hours..","..minutes..","..seconds, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function TimeSpan.GetDays(timeSpan)
	return DLL.CallFunction("AutoPlay\\Docs\\ts.dll", "GetDays", "\""..timeSpan.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function TimeSpan.GetHours(timeSpan)
	return DLL.CallFunction("AutoPlay\\Docs\\ts.dll", "GetHours", "\""..timeSpan.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function TimeSpan.GetMinutes(timeSpan)
	return DLL.CallFunction("AutoPlay\\Docs\\ts.dll", "GetMinutes", "\""..timeSpan.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function TimeSpan.GetSeconds(timeSpan)
	return DLL.CallFunction("AutoPlay\\Docs\\ts.dll", "GetSeconds", "\""..timeSpan.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function TimeSpan.AddTimeSpan(timeSpan1, timeSpan2)
	return DLL.CallFunction("AutoPlay\\Docs\\ts.dll", "AddTimeSpan", "\""..timeSpan1.."\""..",".."\""..timeSpan2.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function TimeSpan.SubstractTimeSpan(timeSpan1, timeSpan2)
	return DLL.CallFunction("AutoPlay\\Docs\\ts.dll", "SubstractTimeSpan", "\""..timeSpan1.."\""..",".."\""..timeSpan2.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function TimeSpan.Equals(timeSpan1, timeSpan2)
	return DLL.CallFunction("AutoPlay\\Docs\\ts.dll", "Equals", "\""..timeSpan1.."\""..",".."\""..timeSpan2.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function TimeSpan.Compare(timeSpan1, timeSpan2)
	return DLL.CallFunction("AutoPlay\\Docs\\ts.dll", "Compare", "\""..timeSpan1.."\""..",".."\""..timeSpan2.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function TimeSpan.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\ts.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCompare, Event: On Click Script ]]------------------------------
result = TimeSpan.Compare(Input.GetText("InputTimeSpanA"), Input.GetText("InputTimeSpanB"));
error = TimeSpan.GetError();

if (error == "") then
	Dialog.Message("Notice", result, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonEquals, Event: On Click Script ]]------------------------------
result = TimeSpan.Equals(Input.GetText("InputTimeSpanA"), Input.GetText("InputTimeSpanB"));
error = TimeSpan.GetError();

if (error == "") then
	Dialog.Message("Notice", result, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSubstractTimeSpan, Event: On Click Script ]]------------------------------
timeSpan = TimeSpan.SubstractTimeSpan(Input.GetText("InputTimeSpanA"), Input.GetText("InputTimeSpanB"));
error = TimeSpan.GetError();

if (error == "") then
	Dialog.Message("Notice", timeSpan, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonAddTimeSpan, Event: On Click Script ]]------------------------------
timeSpan = TimeSpan.AddTimeSpan(Input.GetText("InputTimeSpanA"), Input.GetText("InputTimeSpanB"));
error = TimeSpan.GetError();

if (error == "") then
	Dialog.Message("Notice", timeSpan, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetSeconds, Event: On Click Script ]]------------------------------
seconds = TimeSpan.GetSeconds(Input.GetText("InputTimeSpanA"));
error = TimeSpan.GetError();

if (error == "") then
	Dialog.Message("Notice", seconds, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetMinutes, Event: On Click Script ]]------------------------------
minutes = TimeSpan.GetMinutes(Input.GetText("InputTimeSpanA"));
error = TimeSpan.GetError();

if (error == "") then
	Dialog.Message("Notice", minutes, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetHours, Event: On Click Script ]]------------------------------
hours = TimeSpan.GetHours(Input.GetText("InputTimeSpanA"));
error = TimeSpan.GetError();

if (error == "") then
	Dialog.Message("Notice", hours, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetDays, Event: On Click Script ]]------------------------------
days = TimeSpan.GetDays(Input.GetText("InputTimeSpanA"));
error = TimeSpan.GetError();

if (error == "") then
	Dialog.Message("Notice", days, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetTimeSpan, Event: On Click Script ]]------------------------------
timeSpan = TimeSpan.GetTimeSpan(12, 50, 75, 155);
error = TimeSpan.GetError();

if (error == "") then
	Dialog.Message("Notice", timeSpan, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonParse, Event: On Click Script ]]------------------------------
timeSpan = TimeSpan.Parse(Input.GetText("InputTimeSpanA"));
error = TimeSpan.GetError();

if (error == "") then
	Dialog.Message("Notice", timeSpan, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

