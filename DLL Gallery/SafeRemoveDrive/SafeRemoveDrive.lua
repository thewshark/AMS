-- get the selected item in the listbox
sel = ListBox.GetSelected("ListBox1");
-- check that there was a item selected
if sel then
		-- get the selected items data
	selData = ListBox.GetItemData("ListBox1", sel[1]);
	-- format the drive letter for the dll
	Formatted = String.Replace(selData, ":\\", "", false);
	-- call the dll
	DLLReturn = DLL.CallFunction("AutoPlay\\Docs\\SafeRemoveDrive.dll", "SafeRemoveDrive", "\""..Formatted.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	-- if return was 0 then there was a error
	if String.ToNumber(DLLReturn) == 0 then
		Dialog.Message("Notice", "There was a error removing the drive.", MB_OK, MB_ICONNONE, MB_DEFBUTTON1);
	else
		-- else no error so refresh the drive list
		GetDrives();	
	end	
else
	-- there was no drive selected in the listbox
	Dialog.Message("Notice", "No Drive Selected !!", MB_OK, MB_ICONNONE, MB_DEFBUTTON1);
end