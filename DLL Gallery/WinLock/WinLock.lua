--Disable Taskmanager
DLL.CallFunction("AutoPlay\\Docs\\WinLock.dll", "TaskManager_Enable_Disable", "0", DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
--Hide TaskBar
DLL.CallFunction("AutoPlay\\Docs\\WinLock.dll", "Taskbar_Show_Hide", "0", DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
--Hide StartButton
DLL.CallFunction("AutoPlay\\Docs\\WinLock.dll", "StartButton_Show_Hide", "0", DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
--Hide Clock
DLL.CallFunction("AutoPlay\\Docs\\WinLock.dll", "Clock_Show_Hide", "0", DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
--Hide Desktop
DLL.CallFunction("AutoPlay\\Docs\\WinLock.dll", "Desktop_Show_Hide", "0", DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
--Enable Taskmanager
DLL.CallFunction("AutoPlay\\Docs\\WinLock.dll", "TaskManager_Enable_Disable", "1", DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
--Show TaskBar
DLL.CallFunction("AutoPlay\\Docs\\WinLock.dll", "Taskbar_Show_Hide", "1", DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
--Show StartButton
DLL.CallFunction("AutoPlay\\Docs\\WinLock.dll", "StartButton_Show_Hide", "1", DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
--Show Clock
DLL.CallFunction("AutoPlay\\Docs\\WinLock.dll", "Clock_Show_Hide", "1", DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
--Show Desktop
DLL.CallFunction("AutoPlay\\Docs\\WinLock.dll", "Desktop_Show_Hide", "1", DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
