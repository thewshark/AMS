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

ForwardAction = { Forward = 0, Drop = 1 };

Firewall = {}
function Firewall.GetNetworkInterfaces()
	networkInterfaces = DLL.CallFunction("AutoPlay\\Docs\\Firewall.dll", "GetNetworkInterfaces", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return DelimitedStringToTable(networkInterfaces, "\r\n");
end

function Firewall.Start(interfaceIpAddr, inAction, outAction)
	DLL.CallFunction("AutoPlay\\Docs\\Firewall.dll", "Start", "\""..interfaceIpAddr.."\""..","..inAction..","..outAction, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function Firewall.Stop()
	DLL.CallFunction("AutoPlay\\Docs\\Firewall.dll", "Stop", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function Firewall.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\Firewall.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Event: On Show Script ]]------------------------------
for i, v in Firewall.GetNetworkInterfaces() do
	ListBox.AddItem("ListBoxNetworkInterfaces", v, "");
end

if (ListBox.GetCount("ListBoxNetworkInterfaces") > 0) then
	ListBox.SelectItem("ListBoxNetworkInterfaces", 1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStop, Event: On Click Script ]]------------------------------
Firewall.Stop();

error = Firewall.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStart, Event: On Click Script ]]------------------------------
netInterfaceIpAddr = ListBox.GetItemText("ListBoxNetworkInterfaces", ListBox.GetSelected("ListBoxNetworkInterfaces")[1]);
inAction = ForwardAction.Drop;
outAction = ForwardAction.Drop;
Firewall.Start(netInterfaceIpAddr, inAction, outAction);

error = Firewall.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

