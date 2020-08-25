------------------------------[[ SCRIPT: Global Script ]]------------------------------
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

DnsMx = {};
function DnsMx.GetDnsServers()
	dnsServers = DLL.CallFunction("AutoPlay\\Docs\\DnsMx.dll", "GetDnsServers", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return DelimitedStringToTable(dnsServers, "\r\n");
end
function DnsMx.GetMxServers(dnsServer, domain)
	mxServers = DLL.CallFunction("AutoPlay\\Docs\\DnsMx.dll", "GetMxServers", "\""..dnsServer.."\""..",".."\""..domain.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return DelimitedStringToTable(mxServers, "\r\n");
end
function DnsMx.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\DnsMx.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetDnsServers, Event: On Click Script ]]------------------------------
dnsServers = DnsMx.GetDnsServers();
error = DnsMx.GetError();

if (error == "") then
	for i, v in dnsServers do
		ListBox.AddItem("ListBox1", v, "");
	end
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetMxServers, Event: On Click Script ]]------------------------------
mxServers = DnsMx.GetMxServers("", "cnn.com");
error = DnsMx.GetError();

if (error == "") then
	for i, v in mxServers do
		ListBox.AddItem("ListBox1", v, "");
	end
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

