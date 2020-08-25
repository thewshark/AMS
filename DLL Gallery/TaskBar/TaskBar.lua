------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- TasBar Tool DLL Functions
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- Edit the path in this function to reflect the path to the dll in your project
function DLLFilePath()
	return "AutoPlay\\Docs\\TaskBar.dll"
end
------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE !!  DO NOT EDIT BELOW THIS LINE !! DO NOT EDIT BELOW THIS LINE
------------------------------------------------------------------------------------------------
function HideTaskbar()
	result = DLL.CallFunction(DLLFilePath(), "HideTaskbar", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return result
end

function ShowTaskbar()
	result = DLL.CallFunction(DLLFilePath(), "ShowTaskbar", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return result
end

function IsTaskbarAutoHideOn()
	result = DLL.CallFunction(DLLFilePath(), "IsTaskbarAutoHideOn", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return result
end

function TaskBarPos()
	result = DLL.CallFunction(DLLFilePath(), "GetTaskBarPos", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return result
end

function RealTaskBarHeight()
	result = DLL.CallFunction(DLLFilePath(), "GetTaskBarRealHeight", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function RealTaskBarWidth()
	result = DLL.CallFunction(DLLFilePath(), "GetTaskBarRealWidth", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function VisableTaskBarHeight()
	result = DLL.CallFunction(DLLFilePath(), "GetTaskBarVisableHeight", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function VisableTaskBarWidth()
	result = DLL.CallFunction(DLLFilePath(), "GetTaskBarVisableWidth", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function RealTaskbarLeftX()
	result = DLL.CallFunction(DLLFilePath(), "GetTaskbarRealLeftX", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function RealTaskbarLeftY()
	result = DLL.CallFunction(DLLFilePath(), "GetTaskbarRealLeftY", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function RealTaskbarRightX()
	result = DLL.CallFunction(DLLFilePath(), "GetTaskbarRealRightX", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function RealTaskbarRightY()
	result = DLL.CallFunction(DLLFilePath(), "GetTaskbarRealRightY", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function VisableTaskbarLeftX()
	result = DLL.CallFunction(DLLFilePath(), "GetTaskbarVisableLeftX", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function VisableTaskbarLeftY()
	result = DLL.CallFunction(DLLFilePath(), "GetTaskbarVisableLeftY", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function VisableTaskbarRightX()
	result = DLL.CallFunction(DLLFilePath(), "GetTaskbarVisableRightX", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function VisableTaskbarRightY()
	result = DLL.CallFunction(DLLFilePath(), "GetTaskbarVisableRightY", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function ScreenWidthWithoutTaskbar()
	result = DLL.CallFunction(DLLFilePath(), "ScreenWidthWithoutTaskbar", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function ScreenHeightWithoutTaskbar()
	result = DLL.CallFunction(DLLFilePath(), "ScreenHeightWithoutTaskbar", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function ShowTaskbarPropsDialog()
	result = DLL.CallFunction(DLLFilePath(), "ShowTaskbarPropsDialog", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function ShowClockPropsDialog()
	result = DLL.CallFunction(DLLFilePath(), "ShowClockPropsDialog", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function UnLockTaskbar()
	result = DLL.CallFunction(DLLFilePath(), "UnLockTaskbar", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function LockTaskbar()
	result = DLL.CallFunction(DLLFilePath(), "LockTaskbar", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function TileWindows()
	result = DLL.CallFunction(DLLFilePath(), "TileWindows", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function TileWindowsHorizontally()
	result = DLL.CallFunction(DLLFilePath(), "TileWindowsHorizontally", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function CascadeWindows()
	result = DLL.CallFunction(DLLFilePath(), "CascadeWindows", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function MinimizeAllWindows()
	result = DLL.CallFunction(DLLFilePath(), "MinimizeAllWindows", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end

function UndoMinimizeAllWindows()
	result = DLL.CallFunction(DLLFilePath(), "UndoMinimizeAllWindows", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return String.ToNumber(result)
end
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- End TasBar Tool DLL Functions
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------
-- Taskbar Info Test
------------------------------------------------------------------------------------------------
strTest="IsAutoHideOn: "..IsTaskbarAutoHideOn().."\r\n"
strTest=strTest.."TaskBar Pos: "..TaskBarPos().."\r\n"
strTest=strTest.."Real TaskBar Width: "..RealTaskBarWidth().."\r\n"
strTest=strTest.."Real TaskBar Height: "..RealTaskBarHeight().."\r\n"
strTest=strTest.."Visable TaskBar Width: "..VisableTaskBarWidth().."\r\n"
strTest=strTest.."Visable TaskBar Height: "..VisableTaskBarHeight().."\r\n"
strTest=strTest.."Real Left X: "..RealTaskbarLeftX().."\r\n"
strTest=strTest.."Real Left Y: "..RealTaskbarLeftY().."\r\n"
strTest=strTest.."Real Right X: "..RealTaskbarRightX().."\r\n"
strTest=strTest.."Real Right Y: "..RealTaskbarRightY().."\r\n"
strTest=strTest.."Visable Left X: "..VisableTaskbarLeftX().."\r\n"
strTest=strTest.."Visable Left Y: "..VisableTaskbarLeftY().."\r\n"
strTest=strTest.."Visable Right X: "..VisableTaskbarRightX().."\r\n"
strTest=strTest.."Visable Right Y: "..VisableTaskbarRightY().."\r\n"
strTest=strTest.."Screen Width Without Taskbar: "..ScreenWidthWithoutTaskbar().."\r\n"
strTest=strTest.."Screen Height Without Taskbar: "..ScreenHeightWithoutTaskbar().."\r\n"

-- Test hide taskbar
Dialog.Message("Notice", "Will now hide the taskbar.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
HideTaskbar()

-- Test show taskbar
Dialog.Message("Notice", "Will now show the taskbar.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
ShowTaskbar()

-- Test get taskbar info
Dialog.Message("Notice", strTest, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);

-- Test show taskbar props window
Dialog.Message("Notice", "Will now show taskbar properties window.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
ShowTaskbarPropsDialog()

-- Test show clock props window
Dialog.Message("Notice", "Will now show the clock properties window.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
ShowClockPropsDialog()

-- Test lock the taskbar
Dialog.Message("Notice", "Will now lock the taskbar.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
LockTaskbar()

-- Test unlock the taskbar
Dialog.Message("Notice", "Will now unlock the taskbar.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
UnLockTaskbar()


-- Test tile windows
Dialog.Message("Notice", "Will now tile all active windows.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
TileWindows()

-- Test tile windows
Dialog.Message("Notice", "Will now tile horizontally all active windows.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
TileWindowsHorizontally()

-- Test tile windows
Dialog.Message("Notice", "Will now cascade all active windows.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
CascadeWindows()

-- Test minimize all windows
Dialog.Message("Notice", "Will now minimize all active windows.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
MinimizeAllWindows()

-- Test undo minimize all windows
Dialog.Message("Notice", "Will now undo minimize all active windows.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
UndoMinimizeAllWindows()

