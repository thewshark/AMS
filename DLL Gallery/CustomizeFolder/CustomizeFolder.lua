-----------------------------------
-- GetIconedFolderInfo 
-----------------------------------
local FolderPath = Dialog.FolderBrowse("Please select a folder:", "");
if (FolderPath ~= "CANCEL") then
	local IconFile = Dialog.FileBrowse(true, "Locate File", "", "ICO Files (*.ico)|*.ico|", "", "ico", false, true);
	if (IconFile[1] ~= "CANCEL") then
		local IconIndex = 0;
		local InfoTip = "Sample tooltip for this folder";
		local NoSharing = 0;
		local ConfirmFileOp = 0;
		local arg = "\""..FolderPath.."\",\""..IconFile[1].."\","..IconIndex..",\""..InfoTip.."\","..NoSharing..","..ConfirmFileOp
		local DLLFile = "Autoplay\\Docs\\CustomizeFolder.dll"
		local result = DLL.CallFunction(DLLFile, "CreateIconedFolder", arg, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
		
		-- if result 1 file as been build successful, else return 0 file not been build successful.
		Dialog.Message("", result);
	end
end

-----------------------------------
-- UndoIconedFolder
-----------------------------------
local FolderPath = Shell.GetFolder(SHF_MYMUSIC);
File.Copy(FolderPath.."\\desktop.ini", FolderPath.."\\desktop.bak", true, true, false, true, nil);

local DLLFile = "Autoplay\\Docs\\CustomizeFolder.dll"
local result = DLL.CallFunction(DLLFile, "UndoIconedFolder", "\""..FolderPath.."\"", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);

-- if result 1 file as been delete, else if return 0 file not been delete or not exist.
Dialog.Message("", result) 

-- this is for restore "desktop.bak" to "desktop.ini"
File.Rename(FolderPath.."\\desktop.bak", FolderPath.."\\desktop.ini");


-----------------------------------
-- IsIconedFolder
-----------------------------------
local FolderPath = Shell.GetFolder(SHF_COMMONFILES); -- return 0 is "desktop.ini" file not exist.
--local FolderPath = Shell.GetFolder(SHF_MYDOCUMENTS); -- return 1 is "desktop.ini" file exist.

local DLLFile = "Autoplay\\Docs\\CustomizeFolder.dll"
local result = DLL.CallFunction(DLLFile, "IsIconedFolder", "\""..FolderPath.."\"", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);

Dialog.Message("", result)


-----------------------------------
-- GetIconedFolderInfo
-----------------------------------
local FolderPath = Shell.GetFolder(SHF_MYDOCUMENTS);

local DLLFile = "Autoplay\\Docs\\CustomizeFolder.dll"
local result = DLL.CallFunction(DLLFile, "GetIconedFolderInfo", "\""..FolderPath.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

Dialog.Message("", result)