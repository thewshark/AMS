
-- Get the handle to the AMS window. Need to pass this to the dll
hWnd = Application.GetWndHandle()

-- Set the title for the message box
sTitle = "Welcome"

-- Set the message to display
sMsg = "How are you today? I hope you are having a great day.\nWe hope you enjoy using our very cool program.\n\nWould you like to hear the joke of the day?"

-- Set the text for the checkbox
-- Set to "NONE" to have no checkbox
sCheckText = "Please don't show this message again"
--sCheckText = "NONE"

-- Set the button type
	-- Options are:
		-- OK
		-- OK_CANCEL
		-- YES_NO
		-- YES_NO_CANCEL
		-- RETRY_CANCEL
		-- ABORT_RETRY_IGNORE
Buttons = "YES_NO_CANCEL"

-- Set the Icon
	-- Options are:
		-- ICON_NONE
		-- ICON_STOP
		-- ICON_QUESTION
		-- ICON_EXCLAMATION
		-- ICON_INFORMATION
		-- ICON_CUSTOM  (Set Icon_File to the full path and file nme of the icon you want to use. Must be 48 x 48 or less )
Icon = "ICON_CUSTOM"

-- If you set the icon to "ICON_CUSTOM" then you must specify an icon file to use. 
-- If you are not using a custom icon. just set it to ""
Icon_File = _SourceFolder.."\\AutoPlay\\Icons\\Custom_1.ico"

-- Set the font size. Set to "" to use the default size
Font_Size = "10"

-- Set the font bold or noRMAL. "YES" for bold. "NO" or "' for normal
Font_Bold = "YES"

-- Set window background color. Set to -1 for default windows color
nBG_Color = 7854236

-- Set the message text color. Set to -1 for default windows color
nText_Color = 255

-- Set the window style
	-- Options are:
		-- "NORMAL"
		-- "TOOL"
Style = "NORMAL"

-- Hide or show the title bar
HideTitleBar = "NO"

-- Set the width and height of the message box
sWidth = 440
sHeight = 150

-- Call the dll and pass the variables
result = DLL.CallFunction("AutoPlay\\Docs\\xDialog_Message.dll", "Show_Msg", "\""..sTitle.."\",\""..sMsg.."\",\""..sCheckText.."\",\""..Buttons.."\",\""..Icon.."\",\""..Icon_File.."\",\""..Font_Size.."\",\""..Font_Bold.."\",\""..nBG_Color.."\",\""..nText_Color.."\",\""..Style.."\",\""..HideTitleBar.."\",\""..sWidth.."\",\""..sHeight.."\",\""..hWnd.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)

-- Display the result
-- If there is a "|" in the result then there was a checkbox displayed. If so then we need to get the value of the checkbox
nPos = String.Find(result, "|", 1, false)

if nPos == -1 then

	Button = result
	Label.SetText("Label1", "The "..Button.." button was clicked")
	
else

	Button = String.Left(result, nPos-1)
	Checked = String.Mid(result, nPos+1, 11)
	
	if Checked == "CHECKED" then
		sText = "The "..Button.." button was clicked and the check box was checked"
	else
		sText = "The "..Button.." button was clicked and the check box was not checked"
	end
	
	Label.SetText("Label1", sText)
end








-- Get the handle to the AMS window. Need to pass this to the dll
hWnd = Application.GetWndHandle()

-- Set the title for the message box
sTitle = "Save Your Work"

-- Set the message to display
sMsg = "Please save your work first"

-- Set the text for the checkbox
-- Set to "NONE" to have no checkbox
--sCheckText = "Please don't show this message again"
sCheckText = "NONE"

-- Set the button type
	-- Options are:
		-- OK
		-- OK_CANCEL
		-- YES_NO
		-- YES_NO_CANCEL
		-- RETRY_CANCEL
		-- ABORT_RETRY_IGNORE
Buttons = "OK"

-- Set the Icon
	-- Options are:
		-- ICON_NONE
		-- ICON_STOP
		-- ICON_QUESTION
		-- ICON_EXCLAMATION
		-- ICON_INFORMATION
		-- ICON_CUSTOM  (Set Icon_File to the full path and file nme of the icon you want to use. Must be 48 x 48 or less )
Icon = "ICON_EXCLAMATION"

-- If you set the icon to "ICON_CUSTOM" then you must specify an icon file to use. 
-- If you are not using a custom icon. just set it to ""
Icon_File = ""

-- Set the font size. Set to "" to use the default size
Font_Size = "12"

-- Set the font bold or noRMAL. "YES" for bold. "NO" or "' for normal
Font_Bold = "YES"

-- Set window background color. Set to -1 for default windows color
nBG_Color = 7628121

-- Set the message text color. Set to -1 for default windows color
nText_Color = 255785

-- Set the window style
	-- Options are:
		-- "NORMAL"
		-- "TOOL"
Style = "NORMAL"

-- Hide or show the title bar
HideTitleBar = "NO"

-- Set the width and height of the message box
sWidth = 300
sHeight = 100

-- Call the dll and pass the variables
result = DLL.CallFunction("AutoPlay\\Docs\\xDialog_Message.dll", "Show_Msg", "\""..sTitle.."\",\""..sMsg.."\",\""..sCheckText.."\",\""..Buttons.."\",\""..Icon.."\",\""..Icon_File.."\",\""..Font_Size.."\",\""..Font_Bold.."\",\""..nBG_Color.."\",\""..nText_Color.."\",\""..Style.."\",\""..HideTitleBar.."\",\""..sWidth.."\",\""..sHeight.."\",\""..hWnd.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)

-- Display the result
-- If there is a "|" in the result then there was a checkbox displayed. If so then we need to get the value of the checkbox
nPos = String.Find(result, "|", 1, false)

if nPos == -1 then

	Button = result
	Label.SetText("Label1", "The "..Button.." button was clicked")
	
else

	Button = String.Left(result, nPos-1)
	Checked = String.Mid(result, nPos+1, 20)
	
	if Checked == "CHECKED" then
		sText = "The "..Button.." button was clicked and the check box was checked"
	else
		sText = "The "..Button.." button was clicked and the check box was not checked"
	end
	
	Label.SetText("Label1", sText)
end








-- Get the handle to the AMS window. Need to pass this to the dll
hWnd = Application.GetWndHandle()

-- Set the title for the message box
sTitle = "Leaving So Soon?"

-- Set the message to display
sMsg = "Are you sure you want exit this cool program?"

-- Set the text for the checkbox. Set to "NONE" to have no checkbox
sCheckText = "Don't show this message again"

-- Set the button type
	-- Options are:
		-- OK
		-- OK_CANCEL
		-- YES_NO
		-- YES_NO_CANCEL
		-- RETRY_CANCEL
		-- ABORT_RETRY_IGNORE
Buttons = "YES_NO"

-- Set the Icon
	-- Options are:
		-- ICON_NONE
		-- ICON_STOP
		-- ICON_QUESTION
		-- ICON_EXCLAMATION
		-- ICON_INFORMATION
		-- ICON_CUSTOM  (Set Icon_File to the full path and file nme of the icon you want to use. Must be 48 x 48 or less )
Icon = "ICON_CUSTOM"

-- If you set the icon to "ICON_CUSTOM" then you must specify an icon file to use. 
-- If you are not using a custom icon. just set it to ""
Icon_File = _SourceFolder.."\\AutoPlay\\Icons\\Custom_4.ico"

-- Set the font size. Set to "" to use the default size
Font_Size = "8"

-- Set the font bold or noRMAL. "YES" for bold. "NO" or "' for normal
Font_Bold = "No"

-- Set window background color. Set to -1 for default windows color
nBG_Color = -1

-- Set the message text color. Set to -1 for default windows color
nText_Color = -1

-- Set the window style
	-- Options are:
		-- "NORMAL"
		-- "TOOL"
Style = "NORMAL"

-- Hide or show the title bar
HideTitleBar = "NO"

-- Set the width and height of the message box
sWidth = 360
sHeight = 110

-- Call the dll and pass the variables
result = DLL.CallFunction("AutoPlay\\Docs\\xDialog_Message.dll", "Show_Msg", "\""..sTitle.."\",\""..sMsg.."\",\""..sCheckText.."\",\""..Buttons.."\",\""..Icon.."\",\""..Icon_File.."\",\""..Font_Size.."\",\""..Font_Bold.."\",\""..nBG_Color.."\",\""..nText_Color.."\",\""..Style.."\",\""..HideTitleBar.."\",\""..sWidth.."\",\""..sHeight.."\",\""..hWnd.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)

-- Display the result
-- If there is a "|" in the result then there was a checkbox displayed. If so then we need to get the value of the checkbox
nPos = String.Find(result, "|", 1, false)

if nPos == -1 then

	Button = result
	Label.SetText("Label1", "The "..Button.." button was clicked")
	
else

	Button = String.Left(result, nPos-1)
	Checked = String.Mid(result, nPos+1, 20)
	
	if Checked == "CHECKED" then
		sText = "The "..Button.." button was clicked and the check box was checked"
	else
		sText = "The "..Button.." button was clicked and the check box was not checked"
	end
	
	Label.SetText("Label1", sText)
end


-- Get the handle to the AMS window. Need to pass this to the dll
hWnd = Application.GetWndHandle()

-- Set the title for the message box
sTitle = "Welcome"

-- Set the message to display
sMsg = "How are you today? I hope you are having a great day.\nWe hope you enjoy using our very cool program.\n\nWould you like to hear the joke of the day?"

-- Set the text for the checkbox
-- Set to "NONE" to have no checkbox
sCheckText = "Please don't show this message again"
--sCheckText = "NONE"

-- Set the button type
	-- Options are:
		-- OK
		-- OK_CANCEL
		-- YES_NO
		-- YES_NO_CANCEL
		-- RETRY_CANCEL
		-- ABORT_RETRY_IGNORE
Buttons = "YES_NO_CANCEL"

-- Set the Icon
	-- Options are:
		-- ICON_NONE
		-- ICON_STOP
		-- ICON_QUESTION
		-- ICON_EXCLAMATION
		-- ICON_INFORMATION
		-- ICON_CUSTOM  (Set Icon_File to the full path and file nme of the icon you want to use. Must be 48 x 48 or less )
Icon = "ICON_CUSTOM"

-- If you set the icon to "ICON_CUSTOM" then you must specify an icon file to use. 
-- If you are not using a custom icon. just set it to ""
Icon_File = _SourceFolder.."\\AutoPlay\\Icons\\Custom_2.ico"

-- Set the font size. Set to "" to use the default size
Font_Size = "10"

-- Set the font bold or noRMAL. "YES" for bold. "NO" or "' for normal
Font_Bold = "YES"

-- Set window background color. Set to -1 for default windows color
nBG_Color = 7854236

-- Set the message text color. Set to -1 for default windows color
nText_Color = 255

-- Set the window style
	-- Options are:
		-- "NORMAL"
		-- "TOOL"
Style = "NORMAL"

-- Hide or show the title bar
HideTitleBar = "YES"

-- Set the width and height of the message box
sWidth = 440
sHeight = 150

-- Call the dll and pass the variables
result = DLL.CallFunction("AutoPlay\\Docs\\xDialog_Message.dll", "Show_Msg", "\""..sTitle.."\",\""..sMsg.."\",\""..sCheckText.."\",\""..Buttons.."\",\""..Icon.."\",\""..Icon_File.."\",\""..Font_Size.."\",\""..Font_Bold.."\",\""..nBG_Color.."\",\""..nText_Color.."\",\""..Style.."\",\""..HideTitleBar.."\",\""..sWidth.."\",\""..sHeight.."\",\""..hWnd.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)

-- Display the result
-- If there is a "|" in the result then there was a checkbox displayed. If so then we need to get the value of the checkbox
nPos = String.Find(result, "|", 1, false)

if nPos == -1 then

	Button = result
	Label.SetText("Label1", "The "..Button.." button was clicked")
	
else

	Button = String.Left(result, nPos-1)
	Checked = String.Mid(result, nPos+1, 11)
	
	if Checked == "CHECKED" then
		sText = "The "..Button.." button was clicked and the check box was checked"
	else
		sText = "The "..Button.." button was clicked and the check box was not checked"
	end
	
	Label.SetText("Label1", sText)
end

