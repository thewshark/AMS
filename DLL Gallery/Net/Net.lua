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

------------------------------[[ SCRIPT: Page: Page1, Object: btPage5, Event: On Click Script ]]------------------------------
Page.Jump("Page5");


------------------------------[[ SCRIPT: Page: Page1, Object: btPage4, Event: On Click Script ]]------------------------------
Page.Jump("Page4");


------------------------------[[ SCRIPT: Page: Page1, Object: btPage3, Event: On Click Script ]]------------------------------
Page.Jump("Page3");


------------------------------[[ SCRIPT: Page: Page1, Object: btPage2, Event: On Click Script ]]------------------------------
Page.Jump("Page2");


------------------------------[[ SCRIPT: Page: Page1, Object: btGetWanAddress, Event: On Click Script ]]------------------------------
wanAddress = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetWanAddress", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

if(wanAddress ~= "")then
	Dialog.Message("WanAddress", wanAddress, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	lastKnownError = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	Dialog.Message("WanAddressError", lastKnownError, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btGetGatewayAddress, Event: On Click Script ]]------------------------------
gatewayAddress = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetGatewayAddress", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

if(gatewayAddress ~= "")then
	Dialog.Message("GatewayAddress", gatewayAddress, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	lastKnownError = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	Dialog.Message("GatewayAddressError", lastKnownError, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btGetHostAddress, Event: On Click Script ]]------------------------------
hostAddress = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetHostAddress", "\""..Input.GetText("tbHostName").."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

if(hostAddress ~= "")then
	Dialog.Message("HostAddress", hostAddress, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	lastKnownError = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	Dialog.Message("HostAddressError", lastKnownError, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btGetHostName, Event: On Click Script ]]------------------------------
hostName = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetHostName", "\""..Input.GetText("tbHostAddress").."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

if(hostName ~= "")then
	Dialog.Message("HostName", hostName, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	lastKnownError = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	Dialog.Message("HostNameError", lastKnownError, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page2, Object: btPage5, Event: On Click Script ]]------------------------------
Page.Jump("Page5");


------------------------------[[ SCRIPT: Page: Page2, Object: btPage4, Event: On Click Script ]]------------------------------
Page.Jump("Page4");


------------------------------[[ SCRIPT: Page: Page2, Object: btPage3, Event: On Click Script ]]------------------------------
Page.Jump("Page3");


------------------------------[[ SCRIPT: Page: Page2, Object: btPage1, Event: On Click Script ]]------------------------------
Page.Jump("Page1");


------------------------------[[ SCRIPT: Page: Page2, Object: btGetWebPageContent, Event: On Click Script ]]------------------------------
webPageContent = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetWebPageContent", "\""..Input.GetText("tbUrl").."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

if(webPageContent ~= "")then
	Input.SetText("tbWebPageContent", webPageContent);
else
	lastKnownError = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	Dialog.Message("WebPageContentError", lastKnownError, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page3, Object: btPage5, Event: On Click Script ]]------------------------------
Page.Jump("Page5");


------------------------------[[ SCRIPT: Page: Page3, Object: btPage4, Event: On Click Script ]]------------------------------
Page.Jump("Page4");


------------------------------[[ SCRIPT: Page: Page3, Object: btPage2, Event: On Click Script ]]------------------------------
Page.Jump("Page2");


------------------------------[[ SCRIPT: Page: Page3, Object: btPage1, Event: On Click Script ]]------------------------------
Page.Jump("Page1");


------------------------------[[ SCRIPT: Page: Page3, Object: btSend, Event: On Click Script ]]------------------------------
DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "SendEmail", "\""..Input.GetText("tbFrom").."\""..",".."\""..Input.GetText("tbTo").."\""..",".."\""..Input.GetText("tbSubject").."\""..",".."\""..Input.GetText("tbMessage").."\""..",".."\""..Input.GetText("tbAttachment").."\""..",".."\""..Input.GetText("tbSmtpServer").."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

lastKnownError = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
if(lastKnownError ~= "")then
	Dialog.Message("WebPageContentError", lastKnownError, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page3, Object: btBrowse, Event: On Click Script ]]------------------------------
attachment = Dialog.FileBrowse(true, "Locate File", _DesktopFolder, "All Files (*.*)|*.*|", "", "", false, false);
if(attachment[1] ~= "CANCEL")then
	Input.SetText("tbAttachment", attachment[1]);
end

------------------------------[[ SCRIPT: Page: Page4, Object: btPage5, Event: On Click Script ]]------------------------------
Page.Jump("Page5");


------------------------------[[ SCRIPT: Page: Page4, Object: btPage3, Event: On Click Script ]]------------------------------
Page.Jump("Page3");


------------------------------[[ SCRIPT: Page: Page4, Object: btPage2, Event: On Click Script ]]------------------------------
Page.Jump("Page2");


------------------------------[[ SCRIPT: Page: Page4, Object: btPage1, Event: On Click Script ]]------------------------------
Page.Jump("Page1");


------------------------------[[ SCRIPT: Page: Page4, Object: btWhois, Event: On Click Script ]]------------------------------
whoisSearchResult = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "Whois", "\""..Input.GetText("tbDomain").."\""..",".."\""..Input.GetText("tbWhoisServer").."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

if(whoisSearchResult ~= "")then
	Input.SetText("tbwhoisSearchResult", whoisSearchResult);
else
	lastKnownError = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	Dialog.Message("HostNameError", lastKnownError, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page5, Event: On Show Script ]]------------------------------
domains = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetDomains", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

ListBox.DeleteItem("lbDomains", -1);
ListBox.DeleteItem("lbComputers", -1);
ListBox.DeleteItem("lbShares", -1);

if (domains ~= "") then
	for i, v in DelimitedStringToTable(domains, "\r\n") do
		ListBox.AddItem("lbDomains", v, "");
	end
else
	lastKnownError = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	Dialog.Message("Error", lastKnownError, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page5, Object: btPage4, Event: On Click Script ]]------------------------------
Page.Jump("Page4");


------------------------------[[ SCRIPT: Page: Page5, Object: btPage3, Event: On Click Script ]]------------------------------
Page.Jump("Page3");


------------------------------[[ SCRIPT: Page: Page5, Object: btPage2, Event: On Click Script ]]------------------------------
Page.Jump("Page2");


------------------------------[[ SCRIPT: Page: Page5, Object: lbShares, Event: On Select Script ]]------------------------------
selectedComputer = ListBox.GetItemText("lbComputers", ListBox.GetSelected("lbComputers")[1]); 
selectedShare = ListBox.GetItemText("lbShares", ListBox.GetSelected("lbShares")[1]);
location = "\\\\"..selectedComputer.."\\"..selectedShare;

Label.SetText("Label5", location);
ListBox.DeleteItem("lbFilesFolders", -1);

folders = Folder.Find(location, "*", false, nil);

if (folders ~= nill and Table.Count(folders) > 0) then
	for i, v in folders do
		ListBox.AddItem("lbFilesFolders", v, "");
	end
end


files = File.Find(location, "*.*", false, false, nil, nil);

if (files ~= nill and Table.Count(files) > 0) then
	for i, v in files do
		ListBox.AddItem("lbFilesFolders", v, "");
	end
end


------------------------------[[ SCRIPT: Page: Page5, Object: lbComputers, Event: On Select Script ]]------------------------------
shares = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetShares", "\""..ListBox.GetItemText("lbComputers", ListBox.GetSelected("lbComputers")[1]).."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

ListBox.DeleteItem("lbShares", -1);

if (shares ~= "") then
	for i, v in DelimitedStringToTable(shares, "\r\n") do
		ListBox.AddItem("lbShares", v, "");
	end
else
	lastKnownError = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	Dialog.Message("Error", lastKnownError, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page5, Object: lbDomains, Event: On Select Script ]]------------------------------
computers = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetComputers", "\""..ListBox.GetItemText("lbDomains", ListBox.GetSelected("lbDomains")[1]).."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

ListBox.DeleteItem("lbComputers", -1);
ListBox.DeleteItem("lbShares", -1);

if (computers ~= "") then
	for i, v in DelimitedStringToTable(computers, "\r\n") do
		ListBox.AddItem("lbComputers", v, "");
	end
else
	lastKnownError = DLL.CallFunction("AutoPlay\\Docs\\Net.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	Dialog.Message("Error", lastKnownError, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

