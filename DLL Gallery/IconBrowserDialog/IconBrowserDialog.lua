------------------------------[[ SCRIPT: Global Script ]]------------------------------
DialogResult = { None = 0, OK = 1, Cancel = 2, };

IconBrowserDialog = {};
function IconBrowserDialog.Show(iconFile, iconIndex)
	result = DLL.CallFunction("AutoPlay\\Docs\\IconBrowserDialog.dll", "Show", "\""..iconFile.."\""..","..iconIndex, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	return String.ToNumber(result);
end
function IconBrowserDialog.ShowDialog(hWnd, iconFile, iconIndex)
	result = DLL.CallFunction("AutoPlay\\Docs\\IconBrowserDialog.dll", "ShowDialog", hWnd..",".."\""..iconFile.."\""..","..iconIndex, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	return String.ToNumber(result);
end
function IconBrowserDialog.GetIconIndex()
	return DLL.CallFunction("AutoPlay\\Docs\\IconBrowserDialog.dll", "GetIconIndex", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function IconBrowserDialog.GetIconHandle()
	return DLL.CallFunction("AutoPlay\\Docs\\IconBrowserDialog.dll", "GetIconHandle", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function IconBrowserDialog.GetIcon()
	return DLL.CallFunction("AutoPlay\\Docs\\IconBrowserDialog.dll", "GetIcon", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function IconBrowserDialog.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\IconBrowserDialog.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSelectIcon, Event: On Click Script ]]------------------------------
if (IconBrowserDialog.Show("c:\\windows\\system32\\shell32.dll", 0) == DialogResult.OK) then
--if (IconBrowserDialog.ShowDialog(Application.GetWndHandle(), "c:\\windows\\system32\\shell32.dll", 0) == DialogResult.OK) then
	Image.Load("Image1", IconBrowserDialog.GetIcon());
	Dialog.Message("Notice", "IconIndex:\t"..IconBrowserDialog.GetIconIndex().."\r\nIconHandle:\t"..IconBrowserDialog.GetIconHandle(), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

