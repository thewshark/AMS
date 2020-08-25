---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
-- Server APZ
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


------------------------------[[ SCRIPT: Global Script ]]------------------------------
function StringToTable(string)
	index1 = String.Find(string, ",", 1, false);
	index2 = String.Find(string, ",", index1 + 1, false);
	index3 = String.Find(string, ",", index2 + 1, false);
	index4 = String.Find(string, ",", index3 + 1, false);

	Message = {};
	Message.Sender = String.Left(string, index1 - 1);
	Message.Receiver = String.Mid(string, index1 + 1, index2 - index1 - 1);
	Message.Text = String.Mid(string, index2 + 1, index3 - index2 - 1);
	Message.Data = String.Mid(string, index3 + 1, index4 - index3 - 1);
	Message.Time = String.Right(string, String.Length(string) - index4);
	
	return Message;
end

--Avaliable channels.
Channels = {};
Channels.Http = 0;
Channels.Tcp = 1;
Channels.Ipc = 2;

--Application message center library.
ApplicationMessageCenter = {};
ApplicationMessageCenter.Client = {};
ApplicationMessageCenter.Server = {};

--Client.
--Connect to server.
function ApplicationMessageCenter.Client.Connect(channel, host)
	DLL.CallFunction("ApplicationMessageCenter.dll", "Connect", channel..",".."\""..host.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Disconnect from server.
function ApplicationMessageCenter.Client.Disconnect(channel)
	DLL.CallFunction("ApplicationMessageCenter.dll", "Disconnect", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Creates an entry at server (kind of message box) to receive messages. This is where messages will be stored. AppId must be an unique value.
function ApplicationMessageCenter.Client.AddEntry(appId)
	DLL.CallFunction("ApplicationMessageCenter.dll", "AddEntry", "\""..appId.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Removes the entry created if not interested to get messages.
function ApplicationMessageCenter.Client.RemoveEntry(appId)
	DLL.CallFunction("ApplicationMessageCenter.dll", "RemoveEntry", "\""..appId.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Gets a value (true, false) whether an entry exists.
function ApplicationMessageCenter.Client.ExistsEntry(appId)
	value = DLL.CallFunction("ApplicationMessageCenter.dll", "ExistsEntry", "\""..appId.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Send a message at another client.
function ApplicationMessageCenter.Client.SendMessage(appIdSender, appIdReceiver, messageText, messageData)
	DLL.CallFunction("ApplicationMessageCenter.dll", "SendMessage", "\""..appIdSender.."\""..",".."\""..appIdReceiver.."\""..",".."\""..messageText.."\""..",".."\""..messageData.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Receive a message.
function ApplicationMessageCenter.Client.ReceiveMessage(appId)
	messageInfo = DLL.CallFunction("ApplicationMessageCenter.dll", "ReceiveMessage", "\""..appId.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(messageInfo);
end
--Gets a value (true, false) whether a channel is already in use.
function ApplicationMessageCenter.Client.IsChannelRegistered(channel)
	value = DLL.CallFunction("ApplicationMessageCenter.dll", "IsClientChannelRegistered", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Get an error if any occur.
function ApplicationMessageCenter.Client.GetError()
	return DLL.CallFunction("ApplicationMessageCenter.dll", "GetClientError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Server.
--Start server listening for incoming connections.
function ApplicationMessageCenter.Server.Start(channel)
	DLL.CallFunction("ApplicationMessageCenter.dll", "Start", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Stop server from listening for incoming connections.
function ApplicationMessageCenter.Server.Stop(channel)
	DLL.CallFunction("ApplicationMessageCenter.dll", "Stop", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Gets a value (true, false) whether a channel is already in use.
function ApplicationMessageCenter.Server.IsChannelRegistered(channel)
	value = DLL.CallFunction("ApplicationMessageCenter.dll", "IsServerChannelRegistered", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Get an error if any occur.
function ApplicationMessageCenter.Server.GetError()
	return DLL.CallFunction("ApplicationMessageCenter.dll", "GetServerError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonIpcStop, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Server.Stop(Channels.Ipc)
error = ApplicationMessageCenter.Server.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

if (ApplicationMessageCenter.Server.IsChannelRegistered(Channels.Ipc) == true) then
	Input.SetText("InputIpcChannelStatus", "Active");
else
	Input.SetText("InputIpcChannelStatus", "Not Active");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonIpcStart, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Server.Start(Channels.Ipc);
error = ApplicationMessageCenter.Server.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

if (ApplicationMessageCenter.Server.IsChannelRegistered(Channels.Ipc) == true) then
	Input.SetText("InputIpcChannelStatus", "Active");
else
	Input.SetText("InputIpcChannelStatus", "Not Active");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonTcpStop, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Server.Stop(Channels.Tcp)
error = ApplicationMessageCenter.Server.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

if (ApplicationMessageCenter.Server.IsChannelRegistered(Channels.Tcp) == true) then
	Input.SetText("InputTcpChannelStatus", "Active");
else
	Input.SetText("InputTcpChannelStatus", "Not Active");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonTcpStart, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Server.Start(Channels.Tcp);
error = ApplicationMessageCenter.Server.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

if (ApplicationMessageCenter.Server.IsChannelRegistered(Channels.Tcp) == true) then
	Input.SetText("InputTcpChannelStatus", "Active");
else
	Input.SetText("InputTcpChannelStatus", "Not Active");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonHttpStop, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Server.Stop(Channels.Http)
error = ApplicationMessageCenter.Server.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

if (ApplicationMessageCenter.Server.IsChannelRegistered(Channels.Http) == true) then
	Input.SetText("InputHttpChannelStatus", "Active");
else
	Input.SetText("InputHttpChannelStatus", "Not Active");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonHttpStart, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Server.Start(Channels.Http);
error = ApplicationMessageCenter.Server.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

if (ApplicationMessageCenter.Server.IsChannelRegistered(Channels.Http) == true) then
	Input.SetText("InputHttpChannelStatus", "Active");
else
	Input.SetText("InputHttpChannelStatus", "Not Active");
end
error = ApplicationMessageCenter.Server.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end


---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
-- Client 1 APZ
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------



------------------------------[[ SCRIPT: Global Script ]]------------------------------
function StringToTable(string)
	index1 = String.Find(string, ",", 1, false);
	index2 = String.Find(string, ",", index1 + 1, false);
	index3 = String.Find(string, ",", index2 + 1, false);
	index4 = String.Find(string, ",", index3 + 1, false);

	Message = {};
	Message.Sender = String.Left(string, index1 - 1);
	Message.Receiver = String.Mid(string, index1 + 1, index2 - index1 - 1);
	Message.Text = String.Mid(string, index2 + 1, index3 - index2 - 1);
	Message.Data = String.Mid(string, index3 + 1, index4 - index3 - 1);
	Message.Time = String.Right(string, String.Length(string) - index4);
	
	return Message;
end

--Avaliable channels.
Channels = {};
Channels.Http = 0;
Channels.Tcp = 1;
Channels.Ipc = 2;

--Application message center library.
ApplicationMessageCenter = {};
ApplicationMessageCenter.Client = {};
ApplicationMessageCenter.Server = {};

--Client.
--Connect to server.
function ApplicationMessageCenter.Client.Connect(channel, host)
	DLL.CallFunction("ApplicationMessageCenter.dll", "Connect", channel..",".."\""..host.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Disconnect from server.
function ApplicationMessageCenter.Client.Disconnect(channel)
	DLL.CallFunction("ApplicationMessageCenter.dll", "Disconnect", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Creates an entry at server (kind of message box) to receive messages. This is where messages will be stored. AppId must be an unique value.
function ApplicationMessageCenter.Client.AddEntry(appId)
	DLL.CallFunction("ApplicationMessageCenter.dll", "AddEntry", "\""..appId.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Removes the entry created if not interested to get messages.
function ApplicationMessageCenter.Client.RemoveEntry(appId)
	DLL.CallFunction("ApplicationMessageCenter.dll", "RemoveEntry", "\""..appId.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Gets a value (true, false) whether an entry exists.
function ApplicationMessageCenter.Client.ExistsEntry(appId)
	value = DLL.CallFunction("ApplicationMessageCenter.dll", "ExistsEntry", "\""..appId.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Send a message at another client.
function ApplicationMessageCenter.Client.SendMessage(appIdSender, appIdReceiver, messageText, messageData)
	DLL.CallFunction("ApplicationMessageCenter.dll", "SendMessage", "\""..appIdSender.."\""..",".."\""..appIdReceiver.."\""..",".."\""..messageText.."\""..",".."\""..messageData.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Receive a message.
function ApplicationMessageCenter.Client.ReceiveMessage(appId)
	messageInfo = DLL.CallFunction("ApplicationMessageCenter.dll", "ReceiveMessage", "\""..appId.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(messageInfo);
end
--Gets a value (true, false) whether a channel is already in use.
function ApplicationMessageCenter.Client.IsChannelRegistered(channel)
	value = DLL.CallFunction("ApplicationMessageCenter.dll", "IsClientChannelRegistered", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Get an error if any occur.
function ApplicationMessageCenter.Client.GetError()
	return DLL.CallFunction("ApplicationMessageCenter.dll", "GetClientError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Server.
--Start server listening for incoming connections.
function ApplicationMessageCenter.Server.Start(channel)
	DLL.CallFunction("ApplicationMessageCenter.dll", "Start", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Stop server from listening for incoming connections.
function ApplicationMessageCenter.Server.Stop(channel)
	DLL.CallFunction("ApplicationMessageCenter.dll", "Stop", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Gets a value (true, false) whether a channel is already in use.
function ApplicationMessageCenter.Server.IsChannelRegistered(channel)
	value = DLL.CallFunction("ApplicationMessageCenter.dll", "IsServerChannelRegistered", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Get an error if any occur.
function ApplicationMessageCenter.Server.GetError()
	return DLL.CallFunction("ApplicationMessageCenter.dll", "GetServerError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonReceiveMessage, Event: On Click Script ]]------------------------------
message = ApplicationMessageCenter.Client.ReceiveMessage("Client1");
error = ApplicationMessageCenter.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	if (message.Sender ~= "") then
		ListBox.AddItem("ListBoxMessages", message.Sender.."-"..message.Receiver.."-"..message.Text.."-"..message.Data.."-"..message.Time, "");
	end
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSendMessage, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Client.SendMessage("Client1", "Client2", "MessageText", "MessageData");
error = ApplicationMessageCenter.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonRemoveEntry, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Client.RemoveEntry("Client1");
error = ApplicationMessageCenter.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonAddEntry, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Client.AddEntry("Client1");
error = ApplicationMessageCenter.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDisconnect, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Client.Disconnect(Channels.Http);
error = ApplicationMessageCenter.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonConnect, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Client.Connect(Channels.Http, "localhost");
error = ApplicationMessageCenter.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end



---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
-- Client 2 APZ
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


------------------------------[[ SCRIPT: Global Script ]]------------------------------
function StringToTable(string)
	index1 = String.Find(string, ",", 1, false);
	index2 = String.Find(string, ",", index1 + 1, false);
	index3 = String.Find(string, ",", index2 + 1, false);
	index4 = String.Find(string, ",", index3 + 1, false);

	Message = {};
	Message.Sender = String.Left(string, index1 - 1);
	Message.Receiver = String.Mid(string, index1 + 1, index2 - index1 - 1);
	Message.Text = String.Mid(string, index2 + 1, index3 - index2 - 1);
	Message.Data = String.Mid(string, index3 + 1, index4 - index3 - 1);
	Message.Time = String.Right(string, String.Length(string) - index4);
	
	return Message;
end

--Avaliable channels.
Channels = {};
Channels.Http = 0;
Channels.Tcp = 1;
Channels.Ipc = 2;

--Application message center library.
ApplicationMessageCenter = {};
ApplicationMessageCenter.Client = {};
ApplicationMessageCenter.Server = {};

--Client.
--Connect to server.
function ApplicationMessageCenter.Client.Connect(channel, host)
	DLL.CallFunction("ApplicationMessageCenter.dll", "Connect", channel..",".."\""..host.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Disconnect from server.
function ApplicationMessageCenter.Client.Disconnect(channel)
	DLL.CallFunction("ApplicationMessageCenter.dll", "Disconnect", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Creates an entry at server (kind of message box) to receive messages. This is where messages will be stored. AppId must be an unique value.
function ApplicationMessageCenter.Client.AddEntry(appId)
	DLL.CallFunction("ApplicationMessageCenter.dll", "AddEntry", "\""..appId.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Removes the entry created if not interested to get messages.
function ApplicationMessageCenter.Client.RemoveEntry(appId)
	DLL.CallFunction("ApplicationMessageCenter.dll", "RemoveEntry", "\""..appId.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Gets a value (true, false) whether an entry exists.
function ApplicationMessageCenter.Client.ExistsEntry(appId)
	value = DLL.CallFunction("ApplicationMessageCenter.dll", "ExistsEntry", "\""..appId.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Send a message at another client.
function ApplicationMessageCenter.Client.SendMessage(appIdSender, appIdReceiver, messageText, messageData)
	DLL.CallFunction("ApplicationMessageCenter.dll", "SendMessage", "\""..appIdSender.."\""..",".."\""..appIdReceiver.."\""..",".."\""..messageText.."\""..",".."\""..messageData.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Receive a message.
function ApplicationMessageCenter.Client.ReceiveMessage(appId)
	messageInfo = DLL.CallFunction("ApplicationMessageCenter.dll", "ReceiveMessage", "\""..appId.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(messageInfo);
end
--Gets a value (true, false) whether a channel is already in use.
function ApplicationMessageCenter.Client.IsChannelRegistered(channel)
	value = DLL.CallFunction("ApplicationMessageCenter.dll", "IsClientChannelRegistered", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Get an error if any occur.
function ApplicationMessageCenter.Client.GetError()
	return DLL.CallFunction("ApplicationMessageCenter.dll", "GetClientError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Server.
--Start server listening for incoming connections.
function ApplicationMessageCenter.Server.Start(channel)
	DLL.CallFunction("ApplicationMessageCenter.dll", "Start", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Stop server from listening for incoming connections.
function ApplicationMessageCenter.Server.Stop(channel)
	DLL.CallFunction("ApplicationMessageCenter.dll", "Stop", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Gets a value (true, false) whether a channel is already in use.
function ApplicationMessageCenter.Server.IsChannelRegistered(channel)
	value = DLL.CallFunction("ApplicationMessageCenter.dll", "IsServerChannelRegistered", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Get an error if any occur.
function ApplicationMessageCenter.Server.GetError()
	return DLL.CallFunction("ApplicationMessageCenter.dll", "GetServerError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonReceiveMessage, Event: On Click Script ]]------------------------------
message = ApplicationMessageCenter.Client.ReceiveMessage("Client1");
error = ApplicationMessageCenter.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	if (message.Sender ~= "") then
		ListBox.AddItem("ListBoxMessages", message.Sender.."-"..message.Receiver.."-"..message.Text.."-"..message.Data.."-"..message.Time, "");
	end
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSendMessage, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Client.SendMessage("Client2", "Client1", "MessageText", "MessageData");
error = ApplicationMessageCenter.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonRemoveEntry, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Client.RemoveEntry("Client2");
error = ApplicationMessageCenter.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonAddEntry, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Client.AddEntry("Client2");
error = ApplicationMessageCenter.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDisconnect, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Client.Disconnect(Channels.Http);
error = ApplicationMessageCenter.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonConnect, Event: On Click Script ]]------------------------------
ApplicationMessageCenter.Client.Connect(Channels.Http, "localhost");
error = ApplicationMessageCenter.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

