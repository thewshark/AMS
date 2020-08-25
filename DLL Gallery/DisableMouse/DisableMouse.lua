------------------------------[[ SCRIPT: Global Script ]]------------------------------
--Enter global declarations and functions here...


------------------------------[[ SCRIPT: Page: Page1, Object: checkBoxDisableMouse, Event: On Click Script ]]------------------------------
DLL.CallFunction("AutoPlay\\Docs\\DisableMouse.dll", "DisableMouse", Button.GetState("checkBoxDisableMouse"), DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);


------------------------------[[ SCRIPT: Page: Page1, Object: checkBoxDisableXButton, Event: On Click Script ]]------------------------------
DLL.CallFunction("AutoPlay\\Docs\\DisableMouse.dll", "DisableXButton", Button.GetState("checkBoxDisableXButton"), DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);


------------------------------[[ SCRIPT: Page: Page1, Object: checkBoxDisableMButton, Event: On Click Script ]]------------------------------
DLL.CallFunction("AutoPlay\\Docs\\DisableMouse.dll", "DisableMButton", Button.GetState("checkBoxDisableMButton"), DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);


------------------------------[[ SCRIPT: Page: Page1, Object: checkBoxDisableRightClick, Event: On Click Script ]]------------------------------
DLL.CallFunction("AutoPlay\\Docs\\DisableMouse.dll", "DisableRightClick", Button.GetState("checkBoxDisableRightClick"), DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);


------------------------------[[ SCRIPT: Page: Page1, Object: checkBoxDisableLeftClick, Event: On Click Script ]]------------------------------
DLL.CallFunction("AutoPlay\\Docs\\DisableMouse.dll", "DisableLeftClick", Button.GetState("checkBoxDisableLeftClick"), DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);


------------------------------[[ SCRIPT: Page: Page1, Object: checkBoxDisableMouseWheel, Event: On Click Script ]]------------------------------
DLL.CallFunction("AutoPlay\\Docs\\DisableMouse.dll", "DisableMouseWheel", Button.GetState("checkBoxDisableMouseWheel"), DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);


------------------------------[[ SCRIPT: Page: Page1, Object: checkBoxDisableMouseMove, Event: On Click Script ]]------------------------------
DLL.CallFunction("AutoPlay\\Docs\\DisableMouse.dll", "DisableMouseMove", Button.GetState("checkBoxDisableMouseMove"), DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);


