-- Get the folder
sFolder = String.TrimRight(Input.GetText("Input1"), nil);
-- If an invalid entry, then exit
if ((sFolder == "") or (not Folder.DoesExist(sFolder))) then
	Dialog.Message("No Target Folder Data", "Please enter a valid folder path");
	return;
end
-- Call the dll to get the size, converting the return value(type "string") to a number
nSize = String.ToNumber(DLL.CallFunction(_SourceFolder.."\\AutoPlay\\Docs\\xFolderSize.dll", "GetFolderSize", "\""..sFolder.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL));
sSize = String.GetFormattedSize(nSize, FMTSIZE_AUTOMATIC, false);
-- Show the result
Label.SetText("result", "Size: "..sSize);