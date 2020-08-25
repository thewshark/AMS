--[[

function name: 	ChangeDisplaySettings

Arguments:  	width, height, Depth, Freq, Permanent (0 false, 1 = true)

Returns: 		  0 = The settings change was successful.
				  1 = The computer must be restarted in order for the graphics mode to work.
				 -4 = An invalid set of flags was passed in.
				 -1 = The display driver failed the specified graphics mode.
				 -2 = The graphics mode is not supported.
				 -3 = Windows NT only: Unable to write settings to the registry.

Description		sets the users screen res
]]


-- Global function for the screen settings, !!!DO NOT EDIT!!!
function ChangeDisplaySettings(width,height,Depth,Freq,Permanent)
args = width..", "..height..", "..Depth..", "..Freq..", "..Permanent
result = DLL.CallFunction("AutoPlay\\Docs\\DisplaySettings.dll", "ChangeDisplaySettings", args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	if result == "0" then
		local hWnd = Application.GetWndHandle();
		local WndSize = Window.GetSize(hWnd);
		local ScreenRes = System.GetDisplayInfo();
		local NewPos_X = (ScreenRes.Width - WndSize.Width)/2;
		local NewPos_Y = (ScreenRes.Height - WndSize.Height)/2;
		Window.SetPos(hWnd, NewPos_X, NewPos_Y);
	else
		if result == 1 then err = "The computer must be restarted in order for the graphics mode to work"
			elseif result == "-4" then err = "An invalid set of flags was passed in"
			elseif result == "-1" then err = "The display driver failed the specified graphics mode"
			elseif result == "-2" then err = "The graphics mode is not supported"
			elseif result == "-3" then err = "Unable to write settings to the registry"
		end
		Dialog.Message("Error", err, MB_OK, MB_ICONNONE, MB_DEFBUTTON1);
	end
end


-- arguments: width, height, Depth, Freq, Permanent (0 false, 1 = true)
ChangeDisplaySettings(800,600,16,70,0)