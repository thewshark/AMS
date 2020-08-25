-- 	Index: 1	Name: CopyFolder
-- 	Index: 2	Name: DeleteFolder
-- 	Index: 3	Name: FolderExist
-- 	Index: 4	Name: MoveFolder
-- 	Index: 5	Name: RenameFolder
-- 	Index: 6	Name: UnReadOnly

-------------------------------
----------- CopyFolder
-------------------------------
local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\FldrActn.dll"

Source = _SourceFolder.."\\Autoplay\\Docs"
Destination = _SourceFolder.."\\Autoplay\\Destination"

result = DLL.CallFunction(DLLFile, "CopyFolder", "\"" .. Source .. "\""..",\""..Destination .."\",0,0", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
-- Return Failed or Sucess
Dialog.Message("Notice", result, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


-------------------------------
----------- DeleteFolder
-------------------------------

local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\FldrActn.dll"

DeleteFolder = _SourceFolder.."\\Autoplay\\Doc2"

DLL.CallFunction(DLLFile, "DeleteFolder", "\"" .. DeleteFolder .. "\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);


-------------------------------
----------- FolderExist
-------------------------------

local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\FldrActn.dll"

FolderExist = _SourceFolder.."\\Autoplay\\Docs"

result = DLL.CallFunction(DLLFile, "FolderExist", "\"" .. FolderExist .. "\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

-- Return Failed or Sucess
Dialog.Message("Notice", result, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);



-------------------------------
----------- MoveFolder
-------------------------------

local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\FldrActn.dll"

Source = _SourceFolder.."\\Autoplay\\Docs2"
Destination = _SourceFolder.."\\Autoplay\\Docs3"

result = DLL.CallFunction(DLLFile, "MoveFolder", "\"" .. Source .. "\""..",\""..Destination .."\",0,0", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
-- Return Failed or Sucess
Dialog.Message("Notice", result, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);



-------------------------------
----------- RenameFolder
-------------------------------
local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\FldrActn.dll"

SourceFolder = _SourceFolder.."\\Autoplay\\Docs\\Folder"
NewNameFolder = _SourceFolder.."\\Autoplay\\Docs\\newName"

result = DLL.CallFunction(DLLFile, "RenameFolder", "\"" .. SourceFolder .. "\""..",\""..NewNameFolder .."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
-- Return Failed or Sucess
Dialog.Message("Notice", result, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);

