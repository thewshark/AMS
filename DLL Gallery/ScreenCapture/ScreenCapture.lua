------------------------------[[ SCRIPT: Global Script ]]------------------------------
ScreenCapture = {};
function ScreenCapture.GetCapturedScreen()
	return DLL.CallFunction("AutoPlay\\Docs\\ScreenCapture.dll", "GetCapturedScreen", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function ScreenCapture.ShowCaptureWindow()
	DLL.CallFunction("AutoPlay\\Docs\\ScreenCapture.dll", "ShowCaptureWindow", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function ScreenCapture.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\ScreenCapture.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

images = {};

------------------------------[[ SCRIPT: Page: Page1, Event: On Show Script ]]------------------------------
Page.StartTimer(100);


------------------------------[[ SCRIPT: Page: Page1, Event: On Timer Script ]]------------------------------
capturedScreen = ScreenCapture.GetCapturedScreen();
error = ScreenCapture.GetError();

if (error == "") then
	if (capturedScreen ~= "") then
		Table.Insert(images, Table.Count(images) + 1, capturedScreen);
		ThumbList.Clear("ThumbList");
		ThumbList.AddFiles("ThumbList", images, nil);
		Image.Load("Image1", capturedScreen);
	end
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonShowCaptureWindow, Event: On Click Script ]]------------------------------
ScreenCapture.ShowCaptureWindow();
error = ScreenCapture.GetError();

if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ThumbList, Event: On Select Script ]]------------------------------
index = ThumbList.GetSelectedItems("ThumbList")[1];
image = ThumbList.GetItemInfo("ThumbList", index).filepath;
Image.Load("Image1", image);


