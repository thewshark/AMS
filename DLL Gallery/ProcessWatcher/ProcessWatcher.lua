------------------------------[[ SCRIPT: Global Script ]]------------------------------
Events = {};
function Events:ProcessStart(sender, e)
	ListBox.AddItem("ListBox1", "ProcessStart: "..e:ProcessName()..", "..e:ProcessId(), "");
end
function Events:ProcessStop(sender, e)
	ListBox.AddItem("ListBox1", "ProcessStop: "..e:ProcessName()..", "..e:ProcessId(), "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonUnregisterActiveX, Event: On Click Script ]]------------------------------
System.UnregisterActiveX(Folder.GetCurrent().."\\AutoPlay\\Docs\\ProcessWatcher.dll");

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStop, Event: On Click Script ]]------------------------------
pw:Stop();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStart, Event: On Click Script ]]------------------------------
pw:Start();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCreate, Event: On Click Script ]]------------------------------
pw = luacom.CreateObject("ProcessWatcher.ProcessWatcherClass");
luacom.Connect(pw, Events);

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonRegisterActiveX, Event: On Click Script ]]------------------------------
System.RegisterActiveX(Folder.GetCurrent().."\\AutoPlay\\Docs\\ProcessWatcher.dll");

