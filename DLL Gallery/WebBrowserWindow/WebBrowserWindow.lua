------------------------------[[ SCRIPT: Global Script ]]------------------------------
--Window state.
WindowState = { Minimized = 0, Normal = 1, Maximized = 2, FullScreen = 3 };

--Window style.
WindowStyle = { Fixed = 0, Sizable = 1 };

--Web browser window
WebBrowserWindow = {};

--Get web browser window title.
function WebBrowserWindow.GetTitle()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "GetTitle", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Get web browser window position.
function WebBrowserWindow.GetPosition()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "GetPosition", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Get web browser window size.
function WebBrowserWindow.GetSize()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "GetSize", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Get web browser window state.
function WebBrowserWindow.GetWindowState()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "GetWindowState", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Get web browser window style.
function WebBrowserWindow.GetWindowStyle()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "GetWindowStyle", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Returns the web browser window current state. The current state can be one of the following values: Complete, Interactive, Loaded, Loading, Uninitialized.
function WebBrowserWindow.GetReadyState()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "GetReadyState", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Returns the web browser window navigation status. The navigation status can be one of the following values: Uninitialized, Navigating, Navigated, PageLoaded.
function WebBrowserWindow.GetNavigationStatus()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "GetNavigationStatus", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Returns the html contents of the displayed page.
function WebBrowserWindow.GetHtmlContent()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "GetHtmlContent", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Returns the text contents of the displayed page.
function WebBrowserWindow.GetTextContent()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "GetTextContent", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Returns the url of the displayed page.
function WebBrowserWindow.GetUrl()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "GetUrl", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Returns the opacity (transparency) of the web browser window.
function WebBrowserWindow.GetOpacity()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "GetOpacity", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Returns the iconfile of the web browser window that was previosly set with WebBrowserWindow.SetIcon.
function WebBrowserWindow.GetIcon()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "GetIcon", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Returns the error if any occur.
function WebBrowserWindow.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Set web browser window title.
function WebBrowserWindow.SetTitle(title)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "SetTitle", "\""..title.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Set web browser window position.
function WebBrowserWindow.SetPosition(x, y)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "SetPosition", x..","..y, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

--Set web browser window size.
function WebBrowserWindow.SetSize(width, height)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "SetSize", width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

--Set web browser window state.
function WebBrowserWindow.SetWindowState(state)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "SetWindowState", state, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

--Set web browser window style.
function WebBrowserWindow.SetWindowStyle(style)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "SetWindowStyle", style, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

--Set the html contents of the displayed page.
function WebBrowserWindow.SetHtmlContent(htmlContent)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "SetHtmlContent", "\""..htmlContent.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Set the text contents of the displayed page.
function WebBrowserWindow.SetTextContent(textContent)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "SetTextContent", "\""..textContent.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Set the url of the web browser window.
function WebBrowserWindow.SetUrl(url)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "SetUrl", "\""..url.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Set the opacity (transparency) of the web browser window.
function WebBrowserWindow.SetOpacity(opacity)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "SetOpacity", opacity, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

--Set the icon of the web browser window.
function WebBrowserWindow.SetIcon(icon)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "SetIcon", "\""..icon.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Show web browser window.
function WebBrowserWindow.Show()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "Show", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Show web browser window (modal).
function WebBrowserWindow.ShowDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "ShowDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Hide web browser window.
function WebBrowserWindow.Hide()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "Hide", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Close web browser window.
function WebBrowserWindow.Close()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "Close", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Navigate at the specified url.
function WebBrowserWindow.Navigate(url)
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "Navigate", "\""..url.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Navigate back.
function WebBrowserWindow.Back()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "Back", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Navigate forward.
function WebBrowserWindow.Forward()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "Forward", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Navigate at home page.
function WebBrowserWindow.Home()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "Home", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Navigate at search page.
function WebBrowserWindow.Search()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "Search", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Stop navigation and other page activities.
function WebBrowserWindow.Stop()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "Stop", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Print current page.
function WebBrowserWindow.Print()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "Print", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Refresh current page.
function WebBrowserWindow.Refresh()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "Refresh", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Show PageSetupDialog.
function WebBrowserWindow.PageSetupDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "PageSetupDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Show PrintPreviewDialog.
function WebBrowserWindow.PrintPreviewDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "PrintPreviewDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Show PrintDialog.
function WebBrowserWindow.PrintDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "PrintDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function WebBrowserWindow.PropertiesDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "PropertiesDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Show SaveAsDialog.
function WebBrowserWindow.SaveAsDialog()
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "SaveAsDialog", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

--Enable or disable web browser window navigation.
function WebBrowserWindow.EnableNavigation(value)
	if (value == true) then value = 1; else value = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "EnableNavigation", value, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

--Enable or disable web browser window document drop.
function WebBrowserWindow.EnableDrop(value)
	if (value == true) then value = 1; else value = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "EnableDrop", value, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

--Enable or disable web browser window context menu (enable or disable mouse right click)
function WebBrowserWindow.EnableContextMenu(value)
	if (value == true) then value = 1; else value = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "EnableContextMenu", value, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

--Enable or disable web browser window scroll bars.
function WebBrowserWindow.EnableScrollBars(value)
	if (value == true) then value = 1; else value = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "EnableScrollBars", value, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

--Enable or disable web browser window keyboard shortcuts.
function WebBrowserWindow.EnableShortcuts(value)
	if (value == true) then value = 1; else value = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "EnableShortcuts", value, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

--Enable or disable web browser window error dialogs for script errors.
function WebBrowserWindow.EnableScriptErrors(value)
	if (value == true) then value = 1; else value = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "EnableScriptErrors", value, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

--Enable or disable popup windows.
function WebBrowserWindow.EnablePopupWindow(value)
	if (value == true) then value = 1; else value = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "EnablePopupWindow", value, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

--Enable or disable loading popup windows in main window.
function WebBrowserWindow.EnableLoadPopupInMainWindow(value)
	if (value == true) then value = 1; else value = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "EnableLoadPopupInMainWindow", value, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end

--Returns a value whether navigation is enabled.
function WebBrowserWindow.IsNavigationEnabled()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "IsNavigationEnabled", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Returns a value whether document drop is enabled.
function WebBrowserWindow.IsDropEnabled()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "IsDropEnabled", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Returns a value whether context menu is enabled.
function WebBrowserWindow.IsContextMenuEnabled()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "IsContextMenuEnabled", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Returns a value whether scroll bars are enabled.
function WebBrowserWindow.IsScrollBarsEnabled()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "IsScrollBarsEnabled", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Returns a value whether keyboard shortcuts are enabled.
function WebBrowserWindow.IsShortcutsEnabled()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "IsShortcutsEnabled", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Returns a value whether error dialogs for script errors are enabled.
function WebBrowserWindow.IsScriptErrorsEnabled()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "IsScriptErrorsEnabled", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Returns a value whether error dialogs for script errors are enabled.
function WebBrowserWindow.IsPopupWindowEnabled()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "IsPopupWindowEnabled", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Returns a value whether error dialogs for script errors are enabled.
function WebBrowserWindow.IsLoadPopupInMainWindowEnabled()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "IsLoadPopupInMainWindowEnabled", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Returns a value whether web browser window is busy loading an page.
function WebBrowserWindow.IsBusy()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "IsBusy", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Returns a value whether web browser window is in offline mode.
function WebBrowserWindow.IsOffline()
	return DLL.CallFunction("AutoPlay\\Docs\\WebBrowserWindow.dll", "IsOffline", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end


