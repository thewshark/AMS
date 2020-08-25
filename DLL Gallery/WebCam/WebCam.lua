------------------------------[[ SCRIPT: Global Script ]]------------------------------
function StringToLocation(string)
	location = {};
	index = String.Find(string, ",", 1, false);
  	location.x = String.ToNumber(String.Left(string, index - 1));
	location.y = String.ToNumber(String.Right(string, String.Length(string) - index));
	return location;
end
function StringToSize(string)
	size = {};
	index = String.Find(string, ",", 1, false);
  	size.width = String.ToNumber(String.Left(string, index - 1));
	size.height = String.ToNumber(String.Right(string, String.Length(string) - index));
	return size;
end

--WebCam Library.
WebCam = {};
--Connect to webcam. Specify parent window handle.
function WebCam.Connect(hWndParent)
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "Connect", hWndParent, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Connect to webcam. Specify parent window handle, location (x, y), size (width, height).
function WebCam.ConnectEx(hWndParent, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "ConnectEx", hWndParent..",".. x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Disconnect from webcam.
function WebCam.Disconnect()
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "Disconnect", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Take a photo.
function WebCam.Photo(fileName)
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "Photo", "\""..fileName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Start video capturing.
function WebCam.CaptureStart(fileName)
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "CaptureStart", "\""..fileName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Stop video capturing.
function WebCam.CaptureStop()
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "CaptureStop", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Get webcam window location (x, y).
function WebCam.GetLocation()
	location = DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "GetLocation", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToLocation(location);
end
--Get webcam window size (width, height).
function WebCam.GetSize()
	size = DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "GetSize", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToSize(size);
end
--Set webcam window location.
function WebCam.SetLocation(x, y)
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "SetLocation", x..","..y, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Set webcam window size.
function WebCam.SetSize(width, height)
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "SetSize", width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
--Gets a value whether webcam has a video source dialog.
function WebCam.HasVideoSourceDialog()
	value = DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "HasVideoSourceDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Gets a value whether webcam has a video format dialog.
function WebCam.HasVideoFormatDialog()
	value = DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "HasVideoFormatDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Gets a value whether webcam has a video display dialog.
function WebCam.HasVideoDisplayDialog()
	value = DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "HasVideoDisplayDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Gets a value whether webcam is connected.
function WebCam.IsInitialized()
	value = DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "IsInitialized", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Gets a value whether webcam is capturing.
function WebCam.IsCapturing()
	value = DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "IsCapturing", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Gets a value whether ui is locked. Default is true. That means user interface will be locked during capture. If false ui will not be locked during capture.
function WebCam.IsUiLocked()
	value = DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "IsUiLocked", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	value = String.ToNumber(value);
	if (value == 0) then return false; else return true; end
end
--Sets a value whether to lock or not the ui during capture. Default is true. That means user interface will be locked during the capture. To stop capture click esc key or mouse keys. If false ui will not be locked during capture.
function WebCam.LockUi(lock)
	if (lock == true) then lock = 1; else lock = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "LockUi", lock, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Show video source dialog.
function WebCam.VideoSourceDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "VideoSourceDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Show video format dialog.
function WebCam.VideoFormatDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "VideoFormatDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Show video display dialog.
function WebCam.VideoDisplayDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "VideoDisplayDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Show video compression dialog.
function WebCam.VideoCompressionDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "VideoCompressionDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Show audio format dialog.
function WebCam.AudioFormatDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "AudioFormatDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Get webcam window handle.
function WebCam.GetHwnd()
	return DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "GetHwnd", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Get the error if any occur.
function WebCam.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\WebCam.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end


------------------------------[[ SCRIPT: Page: Page1, Object: btAudioFormatDialog, Event: On Click Script ]]------------------------------
WebCam.AudioFormatDialog();


------------------------------[[ SCRIPT: Page: Page1, Object: btVideoCompressionDialog, Event: On Click Script ]]------------------------------
WebCam.VideoCompressionDialog();


------------------------------[[ SCRIPT: Page: Page1, Object: btVideoDisplayDialog, Event: On Click Script ]]------------------------------
if (WebCam.HasVideoDisplayDialog() == true) then
	WebCam.VideoDisplayDialog();
end


------------------------------[[ SCRIPT: Page: Page1, Object: btVideoFormatDialog, Event: On Click Script ]]------------------------------
if (WebCam.HasVideoFormatDialog() == true) then
	WebCam.VideoFormatDialog();
end


------------------------------[[ SCRIPT: Page: Page1, Object: btVideoSourceDialog, Event: On Click Script ]]------------------------------
if (WebCam.HasVideoSourceDialog() == true) then
	WebCam.VideoSourceDialog();
end


------------------------------[[ SCRIPT: Page: Page1, Object: btSize, Event: On Click Script ]]------------------------------
WebCam.SetSize(320, 240);


------------------------------[[ SCRIPT: Page: Page1, Object: btLocation, Event: On Click Script ]]------------------------------
WebCam.SetLocation(0, 0);


------------------------------[[ SCRIPT: Page: Page1, Object: btVideo, Event: On Click Script ]]------------------------------
fileName = "AutoPlay\\Videos\\video.avi";
WebCam.CaptureStart(fileName);
if (WebCam.IsUiLocked() == true) then
	Video.Load("Video", fileName, true, false);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btPhoto, Event: On Click Script ]]------------------------------
fileName = "AutoPlay\\Images\\photo.bmp"; --Supported formats: bmp, gif, jpeg, png.
WebCam.Photo(fileName);
Image.Load("Image", fileName);


------------------------------[[ SCRIPT: Page: Page1, Object: btDisonnect, Event: On Click Script ]]------------------------------
WebCam.Disconnect();


------------------------------[[ SCRIPT: Page: Page1, Object: btConnect, Event: On Click Script ]]------------------------------
--WebCam.Connect(Application.GetWndHandle());
WebCam.ConnectEx(Application.GetWndHandle(), 10, 10, 400, 300);


