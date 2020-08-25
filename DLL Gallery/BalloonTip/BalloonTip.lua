------------------------------[[ SCRIPT: Global Script ]]------------------------------
BalloonTipIcon = { None = 0, Info = 1, Warning = 2, Error = 3, }

BalloonTip = {};
function BalloonTip.Show(hWndEdit, icon, title, text)
	DLL.CallFunction("AutoPlay\\Docs\\BalloonTip.dll", "Show", hWndEdit..","..icon..",".."\""..title.."\""..",".."\""..text.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function BalloonTip.Hide(hWndEdit)
	DLL.CallFunction("AutoPlay\\Docs\\BalloonTip.dll", "Hide", hWndEdit, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function BalloonTip.GetEditHandle(hWndCombo)
	return DLL.CallFunction("AutoPlay\\Docs\\BalloonTip.dll", "GetEditHandle", hWndCombo, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function BalloonTip.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\BalloonTip.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonHide, Event: On Click Script ]]------------------------------
BalloonTip.Hide(Input.GetText("InputHandle"));
--BalloonTip.Hide(BalloonTip.GetEditHandle(Input.GetText("InputHandle")));

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonShow, Event: On Click Script ]]------------------------------
BalloonTip.Show(Input.GetText("InputHandle"), BalloonTipIcon.Info, "Title", "Text");
--BalloonTip.Show(BalloonTip.GetEditHandle(Input.GetText("InputHandle")), BalloonTipIcon.Info, "Title", "Text");


