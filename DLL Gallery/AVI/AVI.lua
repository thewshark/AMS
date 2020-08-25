------------------------------[[ SCRIPT: Global Script ]]------------------------------
Avi = {};
function Avi.Create(fileName, frameRate)
	DLL.CallFunction("AutoPlay\\Docs\\Avi.dll", "Create", "\""..fileName.."\""..","..frameRate, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Avi.Open(fileName)
	DLL.CallFunction("AutoPlay\\Docs\\Avi.dll", "Open", "\""..fileName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Avi.AddFrame(imageFile)
	DLL.CallFunction("AutoPlay\\Docs\\Avi.dll", "AddFrame", "\""..imageFile.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--FileName plus extension (e.g. c:\frame.bmp). Formats supported: .bmp, .gif, .jpg, .jpeg, .png. If fileName == "clipboard" then avi frame will be saved in clipboard.
function Avi.GetFrame(position, fileName)
	DLL.CallFunction("AutoPlay\\Docs\\Avi.dll", "GetFrame", position..",".."\""..fileName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Avi.GetFrameRate()
	return DLL.CallFunction("AutoPlay\\Docs\\Avi.dll", "GetFrameRate", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Avi.GetFrameCount()
	return DLL.CallFunction("AutoPlay\\Docs\\Avi.dll", "GetFrameCount", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Avi.GetBitmapSize()
	return DLL.CallFunction("AutoPlay\\Docs\\Avi.dll", "GetBitmapSize", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Avi.Close()
	DLL.CallFunction("AutoPlay\\Docs\\Avi.dll", "Close", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Avi.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\Avi.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetInfo, Event: On Click Script ]]------------------------------
result = Dialog.FileBrowse(true, "Locate File", _DesktopFolder, "All Files (*.avi)|*.avi|", "", "avi", false, false);

if (result[1] ~= "CANCEL") then
	Avi.Open(result[1]);
	Dialog.Message("Notice", "FrameRate:\t"..Avi.GetFrameRate().."\r\nFrameCount:\t"..Avi.GetFrameCount().."\r\nBitmapSize:\t"..Avi.GetBitmapSize(), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
	Avi.Close();
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetFrame, Event: On Click Script ]]------------------------------
result = Dialog.FileBrowse(true, "Locate File", _DesktopFolder, "All Files (*.avi)|*.avi|", "", "avi", false, false);

if (result[1] ~= "CANCEL") then
	Avi.Open(result[1]);
	Avi.GetFrame(1, "frame.bmp")
	Image.Load("Image1",  "frame.bmp");
	Avi.Close();
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonOpen, Event: On Click Script ]]------------------------------
result = Dialog.FileBrowse(true, "Locate File", _DesktopFolder, "All Files (*.avi)|*.avi|", "", "avi", false, false);

if (result[1] ~= "CANCEL") then
	Avi.Open(result[1]);
	for i = 1, ListBox.GetCount("ListBox1") do
		Avi.AddFrame(ListBox.GetItemData("ListBox1", i));
	end
	Avi.Close();
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCreate, Event: On Click Script ]]------------------------------
result = Dialog.FileBrowse(false, "Locate File", _DesktopFolder, "All Files (*.avi)|*.avi|", "", "avi", false, false);

if (result[1] ~= "CANCEL") then
	Avi.Create(result[1], 2);
	for i = 1, ListBox.GetCount("ListBox1") do
		Avi.AddFrame(ListBox.GetItemData("ListBox1", i));
	end
	Avi.Close();
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonBrowse, Event: On Click Script ]]------------------------------
result = Dialog.FolderBrowse("Please select a folder:", "AutoPlay\\Images");

if (result ~= "CANCEL") then
	images = File.Find(result, "*.jpg", false, false, nil, nil);
	for i, v in images do
		fileParts = String.SplitPath(v);
		ListBox.AddItem("ListBox1", fileParts.Filename..fileParts.Extension, v);
	end
end

