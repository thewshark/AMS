------------------------------[[ SCRIPT: Global Script ]]------------------------------
Events = {};
function Events:IdleTimeStart(sender, e)
	ListBox.AddItem("ListBox1", "IdleTimeStart: "..System.GetTime(TIME_FMT_MIL), "");
end
function Events:IdleTimeStop(sender, e)
	ListBox.AddItem("ListBox1", "IdleTimeStop: "..System.GetTime(TIME_FMT_MIL), "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonUnregisterActiveX, Event: On Click Script ]]------------------------------
System.UnregisterActiveX(Folder.GetCurrent().."\\AutoPlay\\Docs\\IdleTimeWatcher.dll");

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStop, Event: On Click Script ]]------------------------------
itw:Stop();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStart, Event: On Click Script ]]------------------------------
itw:Start();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCreate, Event: On Click Script ]]------------------------------
itw = luacom.CreateObject("IdleTimeWatcher.IdleTimeWatcherClass");
luacom.Connect(itw, Events);
itw.Time = 3 * 1000; --ms

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonRegisterActiveX, Event: On Click Script ]]------------------------------
System.RegisterActiveX(Folder.GetCurrent().."\\AutoPlay\\Docs\\IdleTimeWatcher.dll");

