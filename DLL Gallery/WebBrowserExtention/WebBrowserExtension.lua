------------------------------[[ SCRIPT: Global Script ]]------------------------------
function StringToTable(DelimitedString, Delimiter)
	tbReturn = {};
	local strWorking;
	local nPos = nil;
	local strData;
	local nTableIndex = 1;
	local nDelimiterLength = String.Length(Delimiter);
	
	if(nDelimiterLength < 1)then
		tbReturn[nTableIndex] = DelimitedString;
		return tbReturn;
	end
	
	strWorking = DelimitedString;
	nPos = String.Find(strWorking,Delimiter);
	while(nPos ~= -1)do
		strData = String.Left(strWorking,nPos-1);
		tbReturn[nTableIndex] = strData;
		nTableIndex = nTableIndex + 1;
		local nLength = String.Length(strWorking);
		strWorking = String.Right(strWorking,nLength - (nPos + (nDelimiterLength-1)));
		nPos = String.Find(strWorking,Delimiter);
	end
	if(strWorking ~= "")then
		tbReturn[nTableIndex] = strWorking;
	end
	
	return tbReturn;
end

WebBrowserExtension = {};
function WebBrowserExtension.Initialize(hWnd)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "Initialize", hWnd, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WebBrowserExtension.ShowPageSetupDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "ShowPageSetupDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WebBrowserExtension.ShowPrintDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "ShowPrintDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WebBrowserExtension.ShowPrintPreviewDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "ShowPrintPreviewDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WebBrowserExtension.ShowPropertiesDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "ShowPropertiesDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WebBrowserExtension.ShowSaveAsDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "ShowSaveAsDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WebBrowserExtension.GetReadyState()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "GetReadyState", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function WebBrowserExtension.GetTitle()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "GetTitle", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function WebBrowserExtension.GetHtmlSource()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "GetHtmlSource", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function WebBrowserExtension.GetTextSource()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "GetTextSource", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function WebBrowserExtension.GetHtmlSelection()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "GetHtmlSelection", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function WebBrowserExtension.GetTextSelection()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "GetTextSelection", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function WebBrowserExtension.GetImages()
	images = DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "GetImages", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(images, "\r\n");
end
function WebBrowserExtension.GetLinks()
	links = DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "GetLinks", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return StringToTable(links, "\r\n");
end
function WebBrowserExtension.Scroll(x, y)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "Scroll", x..","..y, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function WebBrowserExtension.DesignModeOn()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "DesignModeOn", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WebBrowserExtension.DesignModeOff()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "DesignModeOff", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WebBrowserExtension.Alert(message)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "Alert", "\""..message.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WebBrowserExtension.Confirm(message)
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "Confirm", "\""..message.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WebBrowserExtension.Prompt(message, defString)
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "Prompt", "\""..message.."\""..",".."\""..defString.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function WebBrowserExtension.UnInitialize()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "UnInitialize", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WebBrowserExtension.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserExtension.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetError, Event: On Click Script ]]------------------------------
error = WebBrowserExtension.GetError();
Dialog.Message("GetError", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonUnInitialize, Event: On Click Script ]]------------------------------
WebBrowserExtension.UnInitialize();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonPrompt, Event: On Click Script ]]------------------------------
prompt = WebBrowserExtension.Prompt("Message", "default string");
Dialog.Message("Prompt", prompt, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonConfirm, Event: On Click Script ]]------------------------------
confirm = WebBrowserExtension.Confirm("Message");
Dialog.Message("Confirm", confirm, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonAlert, Event: On Click Script ]]------------------------------
WebBrowserExtension.Alert("Message");

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDesignModeOff, Event: On Click Script ]]------------------------------
WebBrowserExtension.DesignModeOff();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDesignModeOn, Event: On Click Script ]]------------------------------
WebBrowserExtension.DesignModeOn();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonScroll, Event: On Click Script ]]------------------------------
WebBrowserExtension.Scroll(100, 100);

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetLinks, Event: On Click Script ]]------------------------------
links = WebBrowserExtension.GetLinks();
for i, v in links do
	ListBox.AddItem("ListBox1", v, "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetImages, Event: On Click Script ]]------------------------------
images = WebBrowserExtension.GetImages();
for i, v in images do
	ListBox.AddItem("ListBox1", v, "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetTextSelection, Event: On Click Script ]]------------------------------
textSelection = WebBrowserExtension.GetTextSelection();
Dialog.Message("GetTextSelection", textSelection, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetHtmlSelection, Event: On Click Script ]]------------------------------
htmlSelection = WebBrowserExtension.GetHtmlSelection();
Dialog.Message("GetHtmlSelection", htmlSelection, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetTextSource, Event: On Click Script ]]------------------------------
textSource = WebBrowserExtension.GetTextSource();
Dialog.Message("GetTextSource", textSource, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetHtmlSource, Event: On Click Script ]]------------------------------
htmlSource = WebBrowserExtension.GetHtmlSource();
Dialog.Message("GetHtmlSource", htmlSource, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetTitle, Event: On Click Script ]]------------------------------
title = WebBrowserExtension.GetTitle();
Dialog.Message("GetTitle", title, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetReadyState, Event: On Click Script ]]------------------------------
readyState = WebBrowserExtension.GetReadyState();
Dialog.Message("GetReadyState", readyState, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonShowSaveAsDialog, Event: On Click Script ]]------------------------------
WebBrowserExtension.ShowSaveAsDialog();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonShowPropertiesDialog, Event: On Click Script ]]------------------------------
WebBrowserExtension.ShowPropertiesDialog();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonShowPrintPreviewDialog, Event: On Click Script ]]------------------------------
WebBrowserExtension.ShowPrintPreviewDialog();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonShowPrintDialog, Event: On Click Script ]]------------------------------
WebBrowserExtension.ShowPrintDialog();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonShowPageSetupDialog, Event: On Click Script ]]------------------------------
WebBrowserExtension.ShowPageSetupDialog();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonInitialize, Event: On Click Script ]]------------------------------
WebBrowserExtension.Initialize(Application.GetWndHandle());

