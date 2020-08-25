------------------------------[[ SCRIPT: Global Script ]]------------------------------
DateTime = {};

function DateTime.CurrentDateTime()
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "CurrentDateTime", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function DateTime.Parse(dt)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "Parse", "\""..dt.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function DateTime.AddTimeSpan(dt, ts)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "AddTimeSpan", "\""..dt.."\""..",".."\""..ts.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function DateTime.AddYears(dt, years)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "AddYears", "\""..dt.."\""..","..years, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function DateTime.AddMonths(dt, months)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "AddMonths", "\""..dt.."\""..","..months, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function DateTime.AddWeeks(dt, weeks)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "AddWeeks", "\""..dt.."\""..","..weeks, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function DateTime.AddDays(dt, days)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "AddDays", "\""..dt.."\""..","..days, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function DateTime.SubstractDateTime(dt1, dt2)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "SubstractDateTime", "\""..dt1.."\""..",".."\""..dt2.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function DateTime.SubstractTimeSpan(dt, ts)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "SubstractTimeSpan", "\""..dt.."\""..",".."\""..ts.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function DateTime.ToLocalTime(dt)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "ToLocalTime", "\""..dt.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function DateTime.ToUniversalTime(dt)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "ToUniversalTime", "\""..dt.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function DateTime.Format(dt, format)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "Format", "\""..dt.."\""..",".."\""..format.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function DateTime.GetDayOfWeek(dt)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "GetDayOfWeek", "\""..dt.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function DateTime.GetDayOfYear(dt, format)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "GetDayOfYear", "\""..dt.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function DateTime.GetDaysInYear(year)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "GetDaysInYear", year, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

function DateTime.GetDaysInMonth(year, month)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "GetDaysInMonth", year..","..month, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

function DateTime.GetWeekOfYear(dt)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "GetWeekOfYear", "\""..dt.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function DateTime.Equals(dt1, dt2)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "Equals", "\""..dt1.."\""..",".."\""..dt2.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function DateTime.Compare(dt1, dt2)
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "Compare", "\""..dt1.."\""..",".."\""..dt2.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function DateTime.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\dt.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end


------------------------------[[ SCRIPT: Page: Page1, Object: btCompare, Event: On Click Script ]]------------------------------
result = DateTime.Compare(Input.GetText("tbDateA"), Input.GetText("tbDateB"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", result, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btEquals, Event: On Click Script ]]------------------------------
result = DateTime.Equals(Input.GetText("tbDateA"), Input.GetText("tbDateB"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", result, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btGetWeekOfYear, Event: On Click Script ]]------------------------------
result = DateTime.GetWeekOfYear(System.GetDate(DATE_FMT_EUROPE));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", result, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btGetDaysInMonth, Event: On Click Script ]]------------------------------
result = DateTime.GetDaysInMonth(2007, 7);
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", result, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btGetDaysInYear, Event: On Click Script ]]------------------------------
result = DateTime.GetDaysInYear(2007);
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", result, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btGetDayOfYear, Event: On Click Script ]]------------------------------
dt = DateTime.GetDayOfYear(Input.GetText("tbDate"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", dt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btGetDayOfWeek, Event: On Click Script ]]------------------------------
dt = DateTime.GetDayOfWeek(Input.GetText("tbDate"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", dt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btFormat, Event: On Click Script ]]------------------------------
dt = DateTime.Format(Input.GetText("tbDate"), Input.GetText("tbFormat"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", dt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btToUniversalTime, Event: On Click Script ]]------------------------------
dt = DateTime.ToUniversalTime(Input.GetText("tbDate"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", dt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btToLocalTime, Event: On Click Script ]]------------------------------
dt = DateTime.ToLocalTime(Input.GetText("tbDate"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", dt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btSubstractTimeSpan, Event: On Click Script ]]------------------------------
dt = DateTime.SubstractTimeSpan(Input.GetText("tbDate"), Input.GetText("tbTimeSpan"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", dt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btSubstractDateTime, Event: On Click Script ]]------------------------------
ts = DateTime.SubstractDateTime(Input.GetText("tbDateA"), Input.GetText("tbDateB"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", ts, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btAddDays, Event: On Click Script ]]------------------------------
dt = DateTime.AddDays(Input.GetText("tbDateA"), Input.GetText("tbTime"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", dt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btAddWeeks, Event: On Click Script ]]------------------------------
dt = DateTime.AddWeeks(Input.GetText("tbDateA"), Input.GetText("tbTime"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", dt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btAddMonths, Event: On Click Script ]]------------------------------
dt = DateTime.AddMonths(Input.GetText("tbDateA"), Input.GetText("tbTime"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", dt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btAddYears, Event: On Click Script ]]------------------------------
dt = DateTime.AddYears(Input.GetText("tbDateA"), Input.GetText("tbTime"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", dt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btAddTimeSpan, Event: On Click Script ]]------------------------------
dt = DateTime.AddTimeSpan(Input.GetText("tbDate"), Input.GetText("tbTimeSpan"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", dt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btParse, Event: On Click Script ]]------------------------------
dt = DateTime.Parse(Input.GetText("tbDate"));
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", dt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btCurrentDateTime, Event: On Click Script ]]------------------------------
dt = DateTime.CurrentDateTime();
error = DateTime.GetError();

if (error == "") then
	Dialog.Message("Notice", dt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

