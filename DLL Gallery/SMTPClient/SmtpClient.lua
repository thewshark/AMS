------------------------------[[ SCRIPT: Global Script ]]------------------------------
SmtpClient = {};
function SmtpClient.Settings(server, port, username, password, ssl)
	if (ssl == true) then ssl = 1; else ssl = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\SmtpClient.dll", "Settings", "\""..server.."\""..","..port..",".."\""..username.."\""..",".."\""..password.."\""..","..ssl, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function SmtpClient.Send(from, to, subject, body, attachments)
	DLL.CallFunction("AutoPlay\\Docs\\SmtpClient.dll", "Send", "\""..from.."\""..",".."\""..to.."\""..",".."\""..subject.."\""..",".."\""..body.."\""..",".."\""..attachments.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function SmtpClient.Geterror()
	DLL.CallFunction("AutoPlay\\Docs\\SmtpClient.dll", "Geterror", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSend, Event: On Click Script ]]------------------------------
--SmtpClient.Settings("smtp.server.com", 25, "username", "password", false);
SmtpClient.Settings("smtp.server.com", 25, "", "", false); --Minimum settings

--SmtpClient.Send("from@user.com", "to@user.net", "Smtp e-mail from ams.", "This is a smtp e-mail from ams.", "C:\\image1.jpeg\r\nC:\\image2.jpeg\r\nC:\\file.doc");
SmtpClient.Send(Input.GetText("InputFrom"), Input.GetText("InputTo"), Input.GetText("InputSubject"), Input.GetText("InputBody"), "");


