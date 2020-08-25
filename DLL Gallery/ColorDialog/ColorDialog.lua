------------------------------[[ SCRIPT: Global Script ]]------------------------------
ColorFormat = {
		Argb = 0,
		Hex = 1,
		Html = 2,
		Ole = 3,
		Win32 = 4,
		Name = 5,
	};
	
DialogResult = {
        OK = 1,
        Cancel = 2,
    }

ColorDialog = {};
function ColorDialog.ShowDialog()
	dr = DLL.CallFunction("AutoPlay\\Docs\\ColorDialog.dll", "ShowDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	return String.ToNumber(dr);
end
function ColorDialog.GetSelectedColor(colorFormat)
	return DLL.CallFunction("AutoPlay\\Docs\\ColorDialog.dll", "GetSelectedColor", colorFormat, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function ColorDialog.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\ColorDialog.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonShowDialog, Event: On Click Script ]]------------------------------
if (ColorDialog.ShowDialog() == DialogResult.OK) then
	Dialog.Message("Notice", ColorDialog.GetSelectedColor(ColorFormat.Win32), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

