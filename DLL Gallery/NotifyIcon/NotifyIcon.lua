------------------------------[[ SCRIPT: Global Script ]]------------------------------
ToolTipIcon = { None = 0, Info = 1, Warning = 2, Error = 3 };

NotifyIcon = {};
function NotifyIcon.SetIcon(icon)
	DLL.CallFunction("AutoPlay\\Docs\\NotifyIcon.dll", "SetIcon", "\""..icon.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function NotifyIcon.SetText(text)
	DLL.CallFunction("AutoPlay\\Docs\\NotifyIcon.dll", "SetText", "\""..text.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function NotifyIcon.ShowIcon()
	DLL.CallFunction("AutoPlay\\Docs\\NotifyIcon.dll", "ShowIcon", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function NotifyIcon.HideIcon()
	DLL.CallFunction("AutoPlay\\Docs\\NotifyIcon.dll", "HideIcon", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function NotifyIcon.SetBalloonTipIcon(icon)
	DLL.CallFunction("AutoPlay\\Docs\\NotifyIcon.dll", "SetBalloonTipIcon", icon, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function NotifyIcon.SetBalloonTipTitle(title)
	DLL.CallFunction("AutoPlay\\Docs\\NotifyIcon.dll", "SetBalloonTipTitle", "\""..title.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function NotifyIcon.SetBalloonTipText(text)
	DLL.CallFunction("AutoPlay\\Docs\\NotifyIcon.dll", "SetBalloonTipText", "\""..text.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function NotifyIcon.ShowBalloonTip(timeOut)
	DLL.CallFunction("AutoPlay\\Docs\\NotifyIcon.dll", "ShowBalloonTip", timeOut, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function NotifyIcon.ShowBalloonTipEx(icon, title, text, timeOut)
	DLL.CallFunction("AutoPlay\\Docs\\NotifyIcon.dll", "ShowBalloonTipEx", icon..",".."\""..title.."\""..",".."\""..text.."\""..","..timeOut, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function NotifyIcon.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\NotifyIcon.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonTest, Event: On Click Script ]]------------------------------
NotifyIcon.SetIcon(12); --Icon index from shell.32.dll
--NotifyIcon.SetIcon("AutoPlay\\Icons\\configure.ico");
NotifyIcon.SetText("This is the tooltip of the taskbar icon.");
NotifyIcon.ShowIcon();

NotifyIcon.SetBalloonTipIcon(ToolTipIcon.Info);
NotifyIcon.SetBalloonTipTitle("The Title");
for i = 1, 100 do
	NotifyIcon.SetBalloonTipText("This is the first line of text\r\nthis is the second line of text\r\nthis is the third line of text.\r\n\r\n"..i);
	NotifyIcon.ShowBalloonTip(10000);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonShowBalloonTip, Event: On Click Script ]]------------------------------
NotifyIcon.SetBalloonTipIcon(ToolTipIcon.Info);
NotifyIcon.SetBalloonTipTitle("The Title");
NotifyIcon.SetBalloonTipText("This is the first line of text\r\nthis is the second line of text\r\nthis is the third line of text.");
NotifyIcon.ShowBalloonTip(10000);

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonHideIcon, Event: On Click Script ]]------------------------------
NotifyIcon.HideIcon();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonShowIcon, Event: On Click Script ]]------------------------------
NotifyIcon.SetIcon(12); --Icon index from shell.32.dll
--NotifyIcon.SetIcon("AutoPlay\\Icons\\configure.ico");
NotifyIcon.SetText("This is the tooltip of the taskbar icon.");
NotifyIcon.ShowIcon();

