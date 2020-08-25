------------------------------[[ SCRIPT: Global Script ]]------------------------------
--Specifies which dialog boxes to show when copying, deleting, or moving files or directories.
UIOption = {
        --Only show error dialog boxes and hide progress dialog boxes.
        OnlyErrorDialogs = 2,
        --Show progress dialog box and any error dialog boxes.
        AllDialogs = 3,
    };

--Specifies whether a file should be deleted permanently or placed in the Recycle Bin.
RecycleOption = {
        --Delete the file or directory permanently.
        DeletePermanently = 2,
        --Send the file or directory to the Recycle Bin.
        SendToRecycleBin = 3,
    }

FileSystem = {};
function FileSystem.CopyDirectory(sourceDirectoryName, destinationDirectoryName, showUI)
	DLL.CallFunction("AutoPlay\\Docs\\FileSystem.dll", "CopyDirectory", "\""..sourceDirectoryName.."\""..",".."\""..destinationDirectoryName.."\""..","..showUI, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function FileSystem.CopyFile(sourceFileName, destinationFileName, showUI)
	DLL.CallFunction("AutoPlay\\Docs\\FileSystem.dll", "CopyFile", "\""..sourceFileName.."\""..",".."\""..destinationFileName.."\""..","..showUI, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function FileSystem.DeleteDirectory(directory, showUI, recycle)
	DLL.CallFunction("AutoPlay\\Docs\\FileSystem.dll", "DeleteDirectory", "\""..directory.."\""..","..showUI..","..recycle, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function FileSystem.DeleteFile(file, showUI, recycle)
	DLL.CallFunction("AutoPlay\\Docs\\FileSystem.dll", "DeleteFile", "\""..file.."\""..","..showUI..","..recycle, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function FileSystem.MoveDirectory(sourceDirectoryName, destinationDirectoryName, showUI)
	DLL.CallFunction("AutoPlay\\Docs\\FileSystem.dll", "MoveDirectory", "\""..sourceDirectoryName.."\""..",".."\""..destinationDirectoryName.."\""..","..showUI, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function FileSystem.MoveFile(sourceFileName, destinationFileName, showUI)
	DLL.CallFunction("AutoPlay\\Docs\\FileSystem.dll", "MoveFile", "\""..sourceFileName.."\""..",".."\""..destinationFileName.."\""..","..showUI, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function FileSystem.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\FileSystem.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCopyDirectory, Event: On Click Script ]]------------------------------
FileSystem.CopyDirectory("AutoPlay\\Dir1", "AutoPlay\\Dir2", UIOption.AllDialogs);
error = FileSystem.GetError();

if (error == "") then
	Dialog.Message("Success", "Done.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCopyFile, Event: On Click Script ]]------------------------------
FileSystem.CopyFile("AutoPlay\\Docs\\File.txt", "AutoPlay\\Images\\File.txt", UIOption.AllDialogs);
error = FileSystem.GetError();

if (error == "") then
	Dialog.Message("Success", "Done.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDeleteDirectory, Event: On Click Script ]]------------------------------
FileSystem.DeleteDirectory("AutoPlay\\Dir1", UIOption.AllDialogs, RecycleOption.SendToRecycleBin);
error = FileSystem.GetError();

if (error == "") then
	Dialog.Message("Success", "Done.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDeleteFile, Event: On Click Script ]]------------------------------
FileSystem.DeleteFile("AutoPlay\\Docs\\File.txt", UIOption.AllDialogs, RecycleOption.SendToRecycleBin);
error = FileSystem.GetError();

if (error == "") then
	Dialog.Message("Success", "Done.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonMoveDirectory, Event: On Click Script ]]------------------------------
FileSystem.MoveDirectory("AutoPlay\\Dir1", "AutoPlay\\Dir2", UIOption.AllDialogs);
error = FileSystem.GetError();

if (error == "") then
	Dialog.Message("Success", "Done.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonMoveFile, Event: On Click Script ]]------------------------------
FileSystem.MoveFile("AutoPlay\\Docs\\File.txt", "AutoPlay\\Images\\File.txt", UIOption.AllDialogs);
error = FileSystem.GetError();

if (error == "") then
	Dialog.Message("Success", "Done.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

