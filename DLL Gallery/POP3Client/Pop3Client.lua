------------------------------[[ SCRIPT: Global Script ]]------------------------------
function MailboxStatsStringToTable(string)
	mailboxStats = {};
	index = String.Find(string, ",", 1, false);
	mailboxStats.EmailCount = String.Left(string, index - 1);
	mailboxStats.MailboxSize = String.Right(string, String.Length(string) - index);
	return mailboxStats;
end
function EmailStatsStringToTable(string)
	emailStats = {};
	index = String.Find(string, ",", 1, false);
	emailStats.Index = String.Left(string, index - 1);
	emailStats.Size = String.Right(string, String.Length(string) - index);
	return mailboxStats;
end

Pop3Client = {};
--Connect to a pop server, Ssl supported.
function Pop3Client.Connect(server, port, username, password, ssl)
	if ssl == false then ssl = 0 else ssl = 1 end
	DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "Connect", "\""..server.."\""..","..port..",".."\""..username.."\""..",".."\""..password.."\""..","..ssl, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Disconnect
function Pop3Client.Disconnect()
	DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "Disconnect", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Get mailbox stats. This is the total number of the e-mails and the size.
function Pop3Client.GetMailboxStats()
	msString = DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetMailboxStats", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return MailboxStatsStringToTable(msString);
end
--Returns a list with e-mail index and size.
function Pop3Client.GetEmailStatsList()
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetEmailStatsList", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Returns the e-mail index and size for a e-mail with the specified index.
function Pop3Client.GetEmailStats(index)
	esString = DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetEmailStats", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return EmailStatsStringToTable(esString);
end
--Gets the raw e-mail (headers, body, attachments (base64)) by specifing e-mail index.
function Pop3Client.GetRawEmail(index)
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetRawEmail", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Gets the raw e-mail part by specifing e-mail index and number of body lines.
function Pop3Client.GetRawEmailPart(index, lines)
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetRawEmailPart", index..","..lines, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Gets the e-mail at a given index. If html is true then returns the body as html otherwise as text.
function Pop3Client.GetEmail(index, html)
	if html == false then html = 0 else html = 1 end
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetEmail", index..","..html, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Gets the header value by specifing the header name.
function Pop3Client.GetHeader(headerName)
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetHeader", "\""..headerName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Gets the e-mail body as html (html = true) or text (html = false). This must be called after GetMail.
function Pop3Client.GetBody(html)
	if html == false then html = 0 else html = 1 end
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetBody", html, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Gets the attachment count. Zero based. This must be called after GetMail.
function Pop3Client.GetAttachmentCount()
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetAttachmentCount", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Gets the attachment name at a given (zero based) index. This must be called after GetMail.
function Pop3Client.GetAttachmentName(index)
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetAttachmentName", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Get the attachment at a given (zero based) index. This must be called after GetMail.
function Pop3Client.GetAttachment(index)
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetAttachment", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Delete an e-mail at a certain index. Email will be deleted after connection is ended.
function Pop3Client.DeleteEmail(index)
	DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "DeleteEmail", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Undelete any e-mail marked to be deleted.
function Pop3Client.UnDeleteEmail()
	DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "UnDeleteEmail", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Gets an list of e-mail index and unique e-mail id.
function Pop3Client.GetUniqueEmailIdList()
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetUniqueEmailIdList", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Gets the e-mail index and e-mail unique id at a specified index.
function Pop3Client.GetUniqueEmailId(index)
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetUniqueEmailId", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Raises or stops raising the log event.
function Pop3Client.RaiseLogEvent(raise)
	if raise == true then raise = 1 else raise = 0 end
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "RaiseLogEvent", raise, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Raises or stops raising the progress event. GetRawEmail, GetRawEmailPart, GetEmail will raise the progress event if subscribed.
function Pop3Client.RaiseProgressEvent(raise)
	if raise == true then raise = 1 else raise = 0 end
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "RaiseProgressEvent", raise, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Gets the server response.
function Pop3Client.GetLog()
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetLog", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--Gets download progress of an e-mail.
function Pop3Client.GetProgress()
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetProgress", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Get error.
function Pop3Client.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\Pop3Client.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end


------------------------------[[ SCRIPT: Page: Page1, Event: On Show Script ]]------------------------------
Pop3Client.RaiseLogEvent(true);
Page.StartTimer(100);


------------------------------[[ SCRIPT: Page: Page1, Event: On Timer Script ]]------------------------------
serverResponse = Pop3Client.GetLog();

if (serverResponse ~= "") then
	ListBox.AddItem("ListBoxLog", serverResponse, "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetAttachment, Event: On Click Script ]]------------------------------
attachment = Pop3Client.GetAttachment(2);

error = Pop3Client.GetError();
if (error == "") then
	Dialog.Message("attachment", attachment, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
	File.Open(attachment, "", SW_SHOWNORMAL);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetAttachmentName, Event: On Click Script ]]------------------------------
attachmentName = Pop3Client.GetAttachmentName(2);

error = Pop3Client.GetError();
if (error == "") then
	Dialog.Message("GetAttachmentName", attachmentName, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetAttachmentCount, Event: On Click Script ]]------------------------------
attachmentCount = Pop3Client.GetAttachmentCount();

error = Pop3Client.GetError();
if (error == "") then
	Dialog.Message("AttachmentCount", attachmentCount, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetEmail, Event: On Click Script ]]------------------------------
email = Pop3Client.GetEmail(3, false);
from = Pop3Client.GetHeader("From");
to = Pop3Client.GetHeader("To");
subject = Pop3Client.GetHeader("Subject");
date = Pop3Client.GetHeader("Date");
body = Pop3Client.GetBody(false);

error = Pop3Client.GetError();
if (error == "") then
	--Input.SetText("InputBody", email);
	Input.SetText("InputFrom", from);
	Input.SetText("InputTo", to);
	Input.SetText("InputSubject", subject);
	Input.SetText("InputDate", date);
	Input.SetText("InputBody", body);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetRawEmailPart, Event: On Click Script ]]------------------------------
rawEmailPart = Pop3Client.GetRawEmailPart(1, 0);

error = Pop3Client.GetError();
if (error == "") then
	Input.SetText("InputBody", rawEmailPart);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetRawEmail, Event: On Click Script ]]------------------------------
rawEmail = Pop3Client.GetRawEmail(1);

error = Pop3Client.GetError();
if (error == "") then
	Input.SetText("InputBody", rawEmail);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetEmailStats, Event: On Click Script ]]------------------------------
mailboxStats = Pop3Client.GetEmailStats(1)

error = Pop3Client.GetError();
if (error == "") then
	Input.SetText("InputBody", "E-mail count: "..emailStats.Index.."\r\nMailbox size: "..emailStats.Size);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetMailboxStats, Event: On Click Script ]]------------------------------
mailboxStats = Pop3Client.GetMailboxStats();

error = Pop3Client.GetError();
if (error == "") then
	Input.SetText("InputBody", "E-mail count: "..mailboxStats.EmailCount.."\r\nMailbox size: "..mailboxStats.MailboxSize);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDisconnect, Event: On Click Script ]]------------------------------
Pop3Client.Disconnect();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonConnect, Event: On Click Script ]]------------------------------
Pop3Client.Connect("pop.server.com", 110, "username", "password", false);

error = Pop3Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

