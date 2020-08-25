------------------------------[[ SCRIPT: Global Script ]]------------------------------
Whois = {};
function Whois.Lookup(host)
	return DLL.CallFunction("AutoPlay\\Docs\\Whois.dll", "Lookup", "\""..host.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Whois.LookupEx(host, whoisServer, port)
	return DLL.CallFunction("AutoPlay\\Docs\\Whois.dll", "LookupEx", "\""..host.."\""..",".."\""..whoisServer.."\""..","..port, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Whois.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\Whois.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonLookup, Event: On Click Script ]]------------------------------
whoisResult = Whois.Lookup(Input.GetText("InputHost"));
error = Whois.GetError();

if (error == "") then
	Input.SetText("InputWhoisResult", whoisResult);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

