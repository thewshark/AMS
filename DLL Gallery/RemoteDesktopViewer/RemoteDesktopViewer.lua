-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
---------------------------------------- Server APZ
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

------------------------------[[ SCRIPT: Global Script ]]------------------------------
Channels = { Http = 0, Tcp = 1 };

RemoteDesktopViewer = { Client = {}, Server = {} };

function RemoteDesktopViewer.Server.Start(channel)
	DLL.CallFunction("RemoteDesktopViewer.dll", "Start", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function RemoteDesktopViewer.Server.Stop(channel)
	DLL.CallFunction("RemoteDesktopViewer.dll", "Stop", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function RemoteDesktopViewer.Server.GetError()
	return DLL.CallFunction("RemoteDesktopViewer.dll", "GetServerError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStop, Event: On Click Script ]]------------------------------
RemoteDesktopViewer.Server.Stop(Channels.Http);

error = RemoteDesktopViewer.Server.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Input.SetText("Input1", "Not Active");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStart, Event: On Click Script ]]------------------------------
RemoteDesktopViewer.Server.Start(Channels.Http);

error = RemoteDesktopViewer.Server.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Input.SetText("Input1", "Active");
end

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
---------------------------------------- Client APZ
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------



------------------------------[[ SCRIPT: Global Script ]]------------------------------
Channels = { Http = 0, Tcp = 1 };

RemoteDesktopViewer = { Client = {}, Server = {} };

function RemoteDesktopViewer.Client.Connect(channel, host)
	DLL.CallFunction("RemoteDesktopViewer.dll", "Connect", channel..",".."\""..host.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function RemoteDesktopViewer.Client.Disconnect(channel)
	DLL.CallFunction("RemoteDesktopViewer.dll", "Disconnect", channel, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function RemoteDesktopViewer.Client.GetDesktopImage()
	return DLL.CallFunction("RemoteDesktopViewer.dll", "GetDesktopImage", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function RemoteDesktopViewer.Client.GetError()
	return DLL.CallFunction("RemoteDesktopViewer.dll", "GetClientError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonConnect, Event: On Click Script ]]------------------------------
RemoteDesktopViewer.Client.Connect(Channels.Http, "192.168.0.0");

error = RemoteDesktopViewer.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDisconnect, Event: On Click Script ]]------------------------------
RemoteDesktopViewer.Client.Disconnect(Channels.Http);

error = RemoteDesktopViewer.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetDesktopImage, Event: On Click Script ]]------------------------------
remoteDesktopImage = RemoteDesktopViewer.Client.GetDesktopImage();

error = RemoteDesktopViewer.Client.GetError();
if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Image.Load("Image1", remoteDesktopImage);
end


