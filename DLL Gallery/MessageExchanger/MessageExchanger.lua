------------------------------[[ SCRIPT: Global Script ]]------------------------------
function StringToTable(DelimitedString, Delimiter)
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
	
	message = {};
	message.Sender = tbReturn[1];
	message.Text = tbReturn[2];
	message.Data = tbReturn[3];
	message.Time = tbReturn[4];
	
	return message;
end

MessageExchanger = {};
--Listen to a specified port. If you don't you will not receive messages.
function MessageExchanger.ListenToPort(port)
	DLL.CallFunction("MessageExchanger.dll", "ListenToPort", port, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Send a message to a host at a specified port. The port is the port the host is listening at.
function MessageExchanger.SendMessage(host, port, sender, text, data)
	DLL.CallFunction("MessageExchanger.dll", "SendMessage", "\""..host.."\""..","..port..",".."\""..sender.."\""..",".."\""..text.."\""..",".."\""..data.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Receive message.
function MessageExchanger.ReceiveMessage()
	message = DLL.CallFunction("MessageExchanger.dll", "ReceiveMessage", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(message, "\r\n\r\n.\r\n\r\n");
end
--Get message number.
function MessageExchanger.GetMessageCount()
	return DLL.CallFunction("MessageExchanger.dll", "GetMessageCount", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Get error if any occurs.
function MessageExchanger.GetError()
	return DLL.CallFunction("MessageExchanger.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

sender = System.GetLANInfo().Host;


------------------------------[[ SCRIPT: Page: Page1, Event: On Show Script ]]------------------------------
MessageExchanger.ListenToPort(11772);
Page.StartTimer(1000);


------------------------------[[ SCRIPT: Page: Page1, Event: On Timer Script ]]------------------------------
message = MessageExchanger.ReceiveMessage();

if (message.Sender ~= nil) then
	ListBox.AddItem("ListBoxMessages", message.Sender..": "..message.Text, "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSendMessage, Event: On Click Script ]]------------------------------
MessageExchanger.SendMessage(Input.GetText("InputHost"), 11772, sender, "This is a message from "..sender, "0123456789");
error = MessageExchanger.GetError();

if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

