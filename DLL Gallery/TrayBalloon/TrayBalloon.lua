------------------------------------------------------------------------------------TrayBalloon.txt
--[[-- Begin TrayTip --]]--
function TrayBalloon(Title, Message, Delay, Icon, bIcon)
	if File.DoesExist(Icon) == false then
	    Icon = "0";
	end
	sArg = Application.GetWndHandle()..",\""..Title.."\",\""..Message.."\","..Delay..",\""..Icon.."\","..bIcon;
	result = DLL.CallFunction("AutoPlay\\Docs\\TrayBalloon.dll","TrayBalloon", sArg, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
--[[-- End TrayTip --]]--

--[[Tray Icon
	---------
	If you would like to use a custom tray icon, enter the icon files path else enter "0" for default icon

	Balloon Icons
	-------------
	1 = None
	2 = Information
	3 = Warning
	4 = Error]]

-- TrayBalloon(Title, Message, Delay, Tray Icon, Balloon Icon);

TrayBalloon("TrayBalloon", "This is a free DLL by:\n\nMZ241508\nmz.phpnet.us/MZ-Soft/", 3000, "AutoPlay\\Icons\\1.ico", 1)


------------------------------------------------------------------------------------TrayTip.txt

-- TrayTip Title
strTitle ="Title";

-- TrayTip Body Text
strText = "Body Text...";
---- TrayTip Icon
-- 0 = None
-- 1 = Information
-- 2 = Exclaimation
-- 3 = Error
-- 4 = Default
-- 7 = Question
-- 13 = EXE Window

strIcon = "4";

-- TrayTip Delay (milliseconds)
strDelay = "3000";

strArgument = '"'..strTitle..'" "'..strText..'" '..strIcon..' '..strDelay;

result = File.Run("AutoPlay\\Docs\\TrayTip.exe", strArgument, "", SW_SHOWNORMAL, false);