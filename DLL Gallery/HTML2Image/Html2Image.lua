------------------------------[[ SCRIPT: Global Script ]]------------------------------
Html2Image = {};
function Html2Image.Load(url)
	DLL.CallFunction("AutoPlay\\Docs\\Html2Image.dll", "Load", "\""..url.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Html2Image.GetState()
	return DLL.CallFunction("AutoPlay\\Docs\\Html2Image.dll", "GetState", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function Html2Image.GetImage(fileName)
	DLL.CallFunction("AutoPlay\\Docs\\Html2Image.dll", "GetImage", "\""..fileName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function Html2Image.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\Html2Image.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Event: On Show Script ]]------------------------------
Page.StartTimer(1000);

------------------------------[[ SCRIPT: Page: Page1, Event: On Timer Script ]]------------------------------
Window.SetText(Application.GetWndHandle(), "Html2Image ["..Html2Image.GetState().."]");

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetImage, Event: On Click Script ]]------------------------------
if (Html2Image.GetState() == "Complete") then
	Html2Image.GetImage("C:\\html.jpeg");
	Image.Load("Image1", "C:\\html.jpeg");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonLoad, Event: On Click Script ]]------------------------------
Html2Image.Load(ListBox.GetItemText("ListBox1", ListBox.GetSelected("ListBox1")[1]));

