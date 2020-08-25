------------------------------[[ SCRIPT: Global Script ]]------------------------------
function StringToTable(string)
	index1 = String.Find(string, ",", 1, false);
	index2 = String.Find(string, ",", index1 + 1, false);
	index3 = String.Find(string, ",", index2 + 1, false);
	index4 = String.Find(string, ",", index3 + 1, false);
	index5 = String.Find(string, ",", index4 + 1, false);
	index6 = String.Find(string, ",", index5 + 1, false);
	index7 = String.Find(string, ",", index6 + 1, false);

	Connection = {};
	Connection.ProcessName = String.Left(string, index1 - 1);
	Connection.ProcessId = String.Mid(string, index1 + 1, index2 - index1 - 1);
	Connection.ProcessLocation = String.Mid(string, index2 + 1, index3 - index2 - 1);
	Connection.LocalAddress = String.Mid(string, index3 + 1, index4 - index3 - 1);
	Connection.LocalPort = String.Mid(string, index4 + 1, index5 - index4 - 1);
	Connection.RemoteAddress = String.Mid(string, index5 + 1, index6 - index5 - 1);
	Connection.RemotePort = String.Mid(string, index6 + 1, index7 - index6 - 1);
	Connection.State = String.Right(string, String.Length(string) - index7);
	
	return Connection;
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
		tbReturn[nTableIndex] = StringToTable(strData);
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

ActiveConnections = {};

function ActiveConnections.GetActiveConnections()
	connections = DLL.CallFunction("AutoPlay\\Docs\\ActiveConnections.dll", "GetActiveConnections", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return DelimitedStringToTable(connections, "\r\n");
end

function ActiveConnections.CloseConnection(localAddr, localPort, remoteAddr, remotePort)
	DLL.CallFunction("AutoPlay\\Docs\\ActiveConnections.dll", "CloseConnection", "\""..localAddr.."\""..","..localPort..",".."\""..remoteAddr.."\""..","..remotePort, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function ActiveConnections.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\ActiveConnections.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetActiveConnections, Event: On Click Script ]]------------------------------
connections = ActiveConnections.GetActiveConnections();

ListBox.DeleteItem("ListBoxActiveConnections", -1);

for i, v in connections do
	ListBox.AddItem("ListBoxActiveConnections", v.ProcessName..","..v.ProcessId..","..v.ProcessLocation..","..v.LocalAddress..","..v.LocalPort..","..v.RemoteAddress..","..v.RemotePort..","..v.State, "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCloseConnection, Event: On Click Script ]]------------------------------
connection = StringToTable(ListBox.GetItemText("ListBoxActiveConnections", ListBox.GetSelected("ListBoxActiveConnections")[1]));

result = Dialog.Message("Notice", "Are you sure you want to close this connection? Click OK to continue or Cancel to cancel.\r\n\r\n"..connection.LocalAddress.."\t"..connection.LocalPort.."\r\n"..connection.RemoteAddress.."\t"..connection.RemotePort, MB_OKCANCEL, MB_ICONQUESTION, MB_DEFBUTTON1);
if (result == 1) then
	ActiveConnections.CloseConnection(connection.LocalAddress, connection.LocalPort, connection.RemoteAddress, connection.RemotePort);
	error = ActiveConnections.GetError();
	if (error ~= "") then
		Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
	else
		connections = ActiveConnections.GetActiveConnections();
		ListBox.DeleteItem("ListBoxActiveConnections", -1);
		for i, v in connections do
			ListBox.AddItem("ListBoxActiveConnections", v.ProcessName..","..v.ProcessId..","..v.ProcessLocation..","..v.LocalAddress..","..v.LocalPort..","..v.RemoteAddress..","..v.RemotePort..","..v.State, "");
		end
	end
end

