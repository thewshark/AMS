------------------------------[[ SCRIPT: Global Script ]]------------------------------
PrintType = {};			--PrintType enumeration.
PrintType.Text = 1;		--Set printing type to print text.
PrintType.Image = 2;	--Set printing type to print image.

--Escape unwanted characters text may contain.
function EscapeChr(text)
	return String.Replace(text, "\"", "\"\"", false);
end

--Set printing type.
function SetPrintingType(printType)
	DLL.CallFunction("AutoPlay\\Docs\\Print.dll", "SetPrintingType", printType, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Set text to print.
function SetText(text)
	DLL.CallFunction("AutoPlay\\Docs\\Print.dll", "SetText", "\""..EscapeChr(text).."\"", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Set image to print.
function SetImage(image)
	DLL.CallFunction("AutoPlay\\Docs\\Print.dll", "SetImage", "\""..image.."\"", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Show page setup dialog
function PageSetupDialog()
	DLL.CallFunction("AutoPlay\\Docs\\Print.dll", "PageSetupDialog", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Show print preview dialog.
function PrintPreviewDialog()
	DLL.CallFunction("AutoPlay\\Docs\\Print.dll", "PrintPreviewDialog", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Show print dialog.
function PrintDialog()
	DLL.CallFunction("AutoPlay\\Docs\\Print.dll", "PrintDialog", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Show font dialog.
function FontDialog()
	DLL.CallFunction("AutoPlay\\Docs\\Print.dll", "FontDialog", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Show color dialog.
function ColorDialog()
	DLL.CallFunction("AutoPlay\\Docs\\Print.dll", "ColorDialog", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Print.
function PrintIt()
	DLL.CallFunction("AutoPlay\\Docs\\Print.dll", "PrintIt", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Get any error may occur.
function GetError()
	DLL.CallFunction("AutoPlay\\Docs\\Print.dll", "GetError", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end


--[[
	With Kind Regards
	sside
]]--

------------------------------[[ SCRIPT: Page: PageMenu, Object: btPrintText, Event: On Click Script ]]------------------------------
Page.Jump("PagePrintText");


------------------------------[[ SCRIPT: Page: PageMenu, Object: btPrintImage, Event: On Click Script ]]------------------------------
Page.Jump("PagePrintImage");


------------------------------[[ SCRIPT: Page: PagePrintText, Event: On Show Script ]]------------------------------
Input.SetText("tbText", TextFile.ReadToString("AutoPlay\\Docs\\TedSellers.txt"));


------------------------------[[ SCRIPT: Page: PagePrintText, Object: btMenu, Event: On Click Script ]]------------------------------
Page.Jump("PageMenu");


------------------------------[[ SCRIPT: Page: PagePrintText, Object: btPrint, Event: On Click Script ]]------------------------------
PrintIt();

------------------------------[[ SCRIPT: Page: PagePrintText, Object: btColorDialog, Event: On Click Script ]]------------------------------
ColorDialog();

------------------------------[[ SCRIPT: Page: PagePrintText, Object: btFontDialog, Event: On Click Script ]]------------------------------
FontDialog();

------------------------------[[ SCRIPT: Page: PagePrintText, Object: btPrintDialog, Event: On Click Script ]]------------------------------
PrintDialog();

------------------------------[[ SCRIPT: Page: PagePrintText, Object: btPrintPreviewDialog, Event: On Click Script ]]------------------------------
SetPrintingType(PrintType.Text);
SetText(Input.GetText("tbText"));
PrintPreviewDialog();

------------------------------[[ SCRIPT: Page: PagePrintText, Object: btPageSetupDialog, Event: On Click Script ]]------------------------------
PageSetupDialog();

------------------------------[[ SCRIPT: Page: PagePrintImage, Object: btMenu, Event: On Click Script ]]------------------------------
Page.Jump("PageMenu");


------------------------------[[ SCRIPT: Page: PagePrintImage, Object: btPrint, Event: On Click Script ]]------------------------------
PrintIt();

------------------------------[[ SCRIPT: Page: PagePrintImage, Object: btPrintDialog, Event: On Click Script ]]------------------------------
PrintDialog();

------------------------------[[ SCRIPT: Page: PagePrintImage, Object: btPrintPreviewDialog, Event: On Click Script ]]------------------------------
SetPrintingType(PrintType.Image)
SetImage(Image.GetFilename("pbImage"));
PrintPreviewDialog();

------------------------------[[ SCRIPT: Page: PagePrintImage, Object: btPageSetupDialog, Event: On Click Script ]]------------------------------
PageSetupDialog();

