------------------------------[[ SCRIPT: Global Script ]]------------------------------
IconSize = { Large = 0, Small = 1, Open = 2 };

FileIcon = {};
function FileIcon.GetFileIcon(fileName)
	return DLL.CallFunction("AutoPlay\\Docs\\FileIcon.dll", "GetFileIcon", "\""..fileName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function FileIcon.GetFileIconEx(fileName, iconSize)
	return DLL.CallFunction("AutoPlay\\Docs\\FileIcon.dll", "GetFileIconEx", "\""..fileName.."\""..","..iconSize, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function FileIcon.GetFolderIcon(folderName)
	return DLL.CallFunction("AutoPlay\\Docs\\FileIcon.dll", "GetFolderIcon", "\""..folderName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function FileIcon.GetFolderIconEx(folderName, iconSize)
	return DLL.CallFunction("AutoPlay\\Docs\\FileIcon.dll", "GetFolderIconEx", "\""..folderName.."\""..","..iconSize, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function FileIcon.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\FileIcon.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetFolderIconEx, Event: On Click Script ]]------------------------------
result = Dialog.FolderBrowse("Please select a folder:", "AutoPlay\\Docs");

if (result ~= "CANCEL") then
	Image.Load("Image1", FileIcon.GetFolderIconEx(result, IconSize.Large));
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetFolderIcon, Event: On Click Script ]]------------------------------
result = Dialog.FolderBrowse("Please select a folder:", "AutoPlay\\Docs");

if (result ~= "CANCEL") then
	Image.Load("Image1", FileIcon.GetFolderIcon(result));
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetFileIconEx, Event: On Click Script ]]------------------------------
result = Dialog.FileBrowse(true, "Locate File", _DesktopFolder, "All Files (*.*)|*.*|", "", "dat", false, false);

if (result[1] ~= "CANCEL") then
	Image.Load("Image1", FileIcon.GetFileIconEx(result[1], IconSize.Large));
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetFileIcon, Event: On Click Script ]]------------------------------
result = Dialog.FileBrowse(true, "Locate File", _DesktopFolder, "All Files (*.*)|*.*|", "", "dat", false, false);

if (result[1] ~= "CANCEL") then
	Image.Load("Image1", FileIcon.GetFileIcon(result[1]));
end

