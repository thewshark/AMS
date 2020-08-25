------------------------------[[ SCRIPT: Global Script ]]------------------------------
TextFormat = { Text = 0, UnicodeText = 1, Rtf = 2, Html = 3, CommaSeparatedValue = 4 };

ImageFormat = { Bmp = 1, Gif = 2, Jpeg = 3, Png = 4 };

Clipboard = {};
function Clipboard.ContainsText()
	return DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "ContainsText", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Clipboard.ContainsTextEx(textFormat)
	return DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "ContainsTextEx", textFormat, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Clipboard.ContainsImage()
	return DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "ContainsImage", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Clipboard.ContainsFileList()
	return DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "ContainsFileList", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Clipboard.GetText()
	return DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "GetText", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Clipboard.GetTextEx(textFormat)
	return DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "GetTextEx", textFormat, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Clipboard.GetImage()
	return DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "GetImage", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Clipboard.GetImageEx(imageFormat)
	return DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "GetImageEx", imageFormat, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Clipboard.GetFileList()
	return DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "GetFileList", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Clipboard.SetText(text)
	DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "SetText", "\""..text.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Clipboard.SetTextEx(text, textFormat)
	DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "SetTextEx", "\""..text.."\""..","..textFormat, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Clipboard.SetImage(image)
	DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "SetImage", "\""..image.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Clipboard.SetFileList(fileList)
	DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "SetFileList", "\""..fileList.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Clipboard.Clear()
	DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "Clear", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Clipboard.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\Clipboard.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end



------------------------------[[ SCRIPT: Page: Page1, Object: ButtonBrowse, Event: On Click Script ]]------------------------------
result = Dialog.FileBrowse(true, "Locate File", _DesktopFolder, "All Files (*.*)|*.*|", "", "dat", false, false);

if (result[1] ~= "CANCEL") then
	if (Input.GetText("Input1") == "") then
		Input.SetText("Input1", result[1]);
	else
		Input.SetText("Input1", Input.GetText("Input1").."\r\n"..result[1]);
	end
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonClear, Event: On Click Script ]]------------------------------
Clipboard.Clear();


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetFileList, Event: On Click Script ]]------------------------------
Clipboard.SetFileList(Input.GetText("Input1"));


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetImage, Event: On Click Script ]]------------------------------
Clipboard.SetImage(Image.GetFilename("Image1"));


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetTextEx, Event: On Click Script ]]------------------------------
Clipboard.SetTextEx(Input.GetText("Input1"), TextFormat.Text);
error = Clipboard.GetError();

if (error ~= "") then
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetText, Event: On Click Script ]]------------------------------
Clipboard.SetText(Input.GetText("Input1"));
error = Clipboard.GetError();

if (error ~= "") then
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetFileList, Event: On Click Script ]]------------------------------
Dialog.Message("Notice", Clipboard.GetFileList(), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetImageEx, Event: On Click Script ]]------------------------------
Image.Load("Image1", Clipboard.GetImageEx(ImageFormat.Bmp));


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetImage, Event: On Click Script ]]------------------------------
Image.Load("Image1", Clipboard.GetImage());


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetTextEx, Event: On Click Script ]]------------------------------
Dialog.Message("Notice", Clipboard.GetText(TextFormat.Text), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetText, Event: On Click Script ]]------------------------------
Dialog.Message("Notice", Clipboard.GetText(), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonContainsFileList, Event: On Click Script ]]------------------------------
Dialog.Message("Notice", Clipboard.ContainsFileList(), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonContainsImage, Event: On Click Script ]]------------------------------
Dialog.Message("Notice", Clipboard.ContainsImage(), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonContainsTextEx, Event: On Click Script ]]------------------------------
Dialog.Message("Notice", Clipboard.ContainsText(TextFormat.Text), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonContainsText, Event: On Click Script ]]------------------------------
Dialog.Message("Notice", Clipboard.ContainsText(), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


