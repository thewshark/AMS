--###################################################################################--
--  DialogEX V1.0.0.1, Dialog Extension Plugin For Autoplay Media Studio.			 --
--###################################################################################--
-------------------------------------------------------------------------|
-- DialogEX Contstants 													 |
-------------------------------------------------------------------------|
-- Message Type ---------------------------------------------------------|
DEX_OK = 0 ---------------- Shows a "OK" dialog (Default).			     |
DEX_OKCANCEL = 1 ---------- Shows a "OK|Cancel" dialog.					 |
DEX_ABORTRETRYIGNORE = 2 -- Shows a "Abort|Retry|Ignore" dialog.	     |
DEX_YESNOCANCEL = 3 ------- Shows a "Yes|No|Cancel" dialog.			     |
DEX_YESNO = 4 ------------- Shows a "Yes|No" dialog.					 |
DEX_RETRYCANCEL = 5 ------- Shows a "Retry|Cancel" dialog.				 |
-- 	Dialog Text Align ---------------------------------------------------
DEX_ALIGN_LEFT=0 ---------- Align dialog text to the left.				 
DEX_ALIGN_CENTER=1 -------- Align dialog text to the center.			 
DEX_ALIGN_RIGHT=2 --------- Align dialog text to the right.				 
-- Dialog Type ----------------------------------------------------------
DEX_NORM=0 ---------------- Normal window.								 
DEX_TOOL=1 ---------------- Tool window.								 
DEX_NOBORDER=2 ------------ Borderless window.							 
-- Dialog Animation -----------------------------------------------------
DEX_NO=0 ------------------ No animation								 
DEX_FADE=1 ---------------- Fades the dialog in/out.					 
DEX_ROLL_LEFT=2 ----------- Rolls the dialog in/out to the left.
DEX_SLIDE_LEFT=3 ---------- Slides the dialog in/out to the left.
DEX_ROLL_RIGHT=4 ---------- Rolls the dialog in/out to the right.
DEX_SLIDE_RIGHT=5 --------- Slides the dialog in/out to the right.
DEX_ROLL_TOP=6 ------------ Rolls the dialog in/out to the top.
DEX_SLIDE_TOP=7 ----------- Slides the dialog in/out to the top.
DEX_ROLL_BOTTOM=8 --------- Rolls the dialog in/out to the bottom.
DEX_SLIDE_BOTTOM=9 -------- Slides the dialog in/out to the bottom.
DEX_ROLL_TOPLEFT=10 ------- Rolls the dialog in/out to the top left.
DEX_SLIDE_TOPLEFT=11 ------ Slides the dialog in/out to the top left.
DEX_ROLL_BOTTOMLEFT=12 ---- Rolls the dialog in/out to the bottom left.
DEX_SLIDE_BOTTOMLEFT=13 --- Slides the dialog in/out to the bottom left.
DEX_ROLL_TOPRIGHT=14 ------ Rolls the dialog in/out to the top right.
DEX_SLIDE_TOPRIGHT=15 ----- Slides the dialog in/out to the top right.	
DEX_ROLL_BOTTOMRIGHT=16 --- Rolls the dialog in/out to the bottom right.
DEX_SLIDE_BOTTOMRIGHT=17 -- Slides the dialog in/out to the bottom right.
DEX_CENTER=18 ------------- Shows or hides the dialog from its center.	 
-- Input Types ----------------------------------------------------------
DEX_INPUT_NORM=0 ---------- Normal text input							 |
DEX_INPUT_NUMERIC=1 ------- Numeric input, only allows numbers.			 |
DEX_INPUT_PASSWORD=2 ------ Password input, masks the input eg: ********.|
DEX_INPUT_LOWERCASE=3 ----- Only allow lowercase input.					 |
DEX_INPUT_UPPERCASE=4 ----- Only allow uppercase input.					 |
-- Display type ---------------------------------------------------------|
DEX_SHOW_APP=0 ------------ Centers the dialog to the application window |
DEX_SHOW_SCREEN=1 --------- Centers the dialog to the users screen       |
DEX_SHOW_CUSTOM=2 --------- Shows the dialog at the coords set in X,Y    |
-------------------------------------------------------------------------|
									 
------------------------------------
if not DialogEX then DialogEX={} end
------------------------------------

----------------------------------------------------------------
-- DialogEX.Message()
----------------------------------------------------------------
--[[ Presents a dialog To the user With an informative message on it.
	
	-------------
	| Arguments |
	-------------
	Below is a list of the function arguments (In order)
	
	string Title 	= The title of the dialog window.
	string Message 	= The text that will appear on the dialog.
	number Align 	= Where To align the message text. (See Constants: "Dialog Text Align")
	number MsgType 	= The type of dialog To display. (See Constants: "Message Type")
	number Width 	= The width of the dialog.
	number Height 	= The height of the dialog.
	number Display 	= Where To display the dialog on the screen. (See Constants: "Display type")
	number X 		= The X position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number Y 		= The Y position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number BackCol  = The background color of the dialog. (Use -1 to disable else any decimal color)
	number FrontCol = The background color of the dialog. (Use -1 to disable else any decimal color)
	number WinType 	= What style To apply To the window. (See Constants: "Dialog Type")
	number IN 		= How To show the dialog. (See Constants: "Dialog Animation") 
	number DELAY 	= The time of the transition in miliseconds.
	number OUT 		= How To exit the dialog. (See Constants: "Dialog Animation") 
	number Timeout 	= How long To display the dialog for in miliseconds, (set To 0 To disable).
					  This can be used to end the dialog if the user takes to long to respond. 
					  
	--------------------
	|  Return (String) |
	--------------------
	Below is a list of the button return values
	
	OK 		= "OK"
	Cancel 	= "CANCEL"
	Abort 	= "ABORT"
	Retry 	= "RETRY"
	Ignore 	= "IGNORE"
	Yes 	= "YES"
	No 		= "NO"
	
	If the Timeout is not set to zero and timeout reached then "TIMEOUT" is returned
	Exit button on window also returns "CANCEL"
]]
----------------------------------------------------------------					
function DialogEX.Message(sTitle,sMessage,cAlign,cMsgType,nWidth,nHeight,cDisplay,nX,nY,nBackCol,nFrontCol,cWinType,cIN,cDELAY,cOUT,nTimeout)
	local args = "\""..sTitle.."\",\""..sMessage.."\","..cAlign..","..cMsgType..","..nWidth..","..nHeight..","..cDisplay..","..nX..","..nY..","..nBackCol..","..nFrontCol..","..cWinType..","..cIN..","..cDELAY..","..cOUT..","..nTimeout..","..Application.GetWndHandle()
	return DLL.CallFunction(DEX_DLLPATH, "Open_MessageDlg", args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end	
----------------------------------------------------------------
-- END DialogEX.Message()
----------------------------------------------------------------


----------------------------------------------------------------
-- DialogEX.Input()
----------------------------------------------------------------
--[[ Presents an input dialog To collect information from the user.
	
	-------------
	| Arguments |
	-------------
	Below is a list of the function arguments (In order)
	
	string Title 	 = The title of the dialog window.
	string Message 	 = The text that will appear on the dialog.
	number InputType = Sets the input type For the dialog.. (See Constants: "Input Types")
	number Align 	 = Where To align the message text. (See Constants: "Dialog Text Align")
	string Default 	 = The Default text To show in the input.
	number Display 	 = Where To display the dialog on the screen. (See Constants: "Display type")
	number X 		 = The X position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number Y 		 = The Y position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number BackCol   = The background color of the dialog. (Use -1 to disable else any decimal color)
	number FrontCol  = The background color of the dialog. (Use -1 to disable else any decimal color)
	number WinType 	 = What style To apply To the window. (See Constants: "Dialog Type")
	number IN 		 = How To show the dialog. (See Constants: "Dialog Animation") 
	number DELAY 	 = The time of the transition in miliseconds.
	number OUT 		 = How To exit the dialog. (See Constants: "Dialog Animation") 
	number Timeout 	 = How long To display the dialog for in miliseconds, (set To 0 To disable).
					   This can be used to end the dialog if the user takes to long to respond. 
					  
	--------------------
	|  Return (String) |
	--------------------
	
	OK = String from input, if input is blank then the dialog will not close (flashes dialog)
	Cancel = "CANCEL"
	
	If the Timeout is not set to zero and timeout reached then "TIMEOUT" is returned
	Exit button on window also returns "CANCEL"
]]
----------------------------------------------------------------
function DialogEX.Input(sTitle,sMessage,nInputType,cAlign,sDefault,cDisplay,nX,nY,nBackCol,nFrontCol,nWinType,cIN,cDELAY,cOUT,nTimeout)
	local args = "\""..sTitle.."\",\""..sMessage.."\","..nInputType..","..cAlign..",\""..sDefault.."\","..cDisplay..","..nX..","..nY..","..nBackCol..","..nFrontCol..","..nWinType..","..cIN..","..cDELAY..","..cOUT..","..nTimeout..","..Application.GetWndHandle()
	return DLL.CallFunction(DEX_DLLPATH, "Open_InputDlg", args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
----------------------------------------------------------------
-- END DialogEX.Input()
----------------------------------------------------------------


----------------------------------------------------------------
-- DialogEX.TimedInput()
----------------------------------------------------------------
--[[ Presents a timed input dialog To collect information from the user, the count down will be displayed in the "OK" button.
	
	-------------
	| Arguments |
	-------------
	Below is a list of the function arguments (In order)
	
	string Title 	 	 = The title of the dialog window.
	string Message 	 	 = The text that will appear on the dialog.
	number InputType 	 = Sets the input type For the dialog.. (See Constants: "Input Types")
	number Align 	 	 = Where To align the message text. (See Constants: "Dialog Text Align")
	number Time 		 = The time in miliseconds To show the dialog.
	string TimeoutReturn = The timeout override Return, set this string To override the timeout Return, 
						   if left blank and dialog timeout "TIMEOUT" is returned.				   
	string Default 	 	 = The Default text To show in the input.
	number Display 	 	 = Where To display the dialog on the screen. (See Constants: "Display type")
	number X 		 	 = The X position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number Y 		 	 = The Y position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number BackCol  	 = The background color of the dialog. (Use -1 to disable else any decimal color)
	number FrontCol  	 = The background color of the dialog. (Use -1 to disable else any decimal color)
	number WinType 	 	 = What style To apply To the window. (See Constants: "Dialog Type")
	number IN 			 = How To show the dialog. (See Constants: "Dialog Animation") 
	number DELAY 		 = The time of the transition in miliseconds.
	number OUT 			 = How To exit the dialog. (See Constants: "Dialog Animation") 
					  
	--------------------
	|  Return (String) |
	--------------------
	
	OK = String from input, if input is blank then the dialog will not close (flashes dialog)
	Cancel = "CANCEL"
	
	If the dialog time runs down and TimeoutReturn = "" then "TIMEOUT" is returned, 
	if TimeoutReturn = "MyReturn" then "MyReturn" is the return string.
	
	Exit button on window returns "CANCEL"
]]
----------------------------------------------------------------
function DialogEX.TimedInput(sTitle,sMessage,nInputType,cAlign,nTime,sTimeoutReturn,sDefault,cDisplay,nX,nY,nBackCol,nFrontCol,nWinType,cIN,cDELAY,cOUT)
	local args = "\""..sTitle.."\",\""..sMessage.."\","..nInputType..","..cAlign..","..nTime..",\""..sTimeoutReturn.."\",\""..sDefault.."\","..cDisplay..","..nX..","..nY..","..nBackCol..","..nFrontCol..","..nWinType..","..cIN..","..cDELAY..","..cOUT..","..Application.GetWndHandle()
	return DLL.CallFunction(DEX_DLLPATH, "Open_TimedInputDlg", args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
----------------------------------------------------------------
-- END DialogEX.TimedInput()
----------------------------------------------------------------


----------------------------------------------------------------
-- DialogEX.IPInput()
----------------------------------------------------------------
--[[ Presents a input dialog To collect an IP address from the user.
	
	-------------
	| Arguments |
	-------------
	Below is a list of the function arguments (In order)
	
	string Title 	 = The title of the dialog window.
	string Message 	 = The text that will appear on the dialog.
	number Align 	 = Where To align the message text. (See Constants: "Dialog Text Align")
	string DefaultIP = The Default IP address To show in the input.
	number Display 	 = Where To display the dialog on the screen. (See Constants: "Display type")
	number X 		 = The X position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number Y 		 = The Y position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number BackCol   = The background color of the dialog. (Use -1 to disable else any decimal color)
	number FrontCol  = The background color of the dialog. (Use -1 to disable else any decimal color)
	number WinType 	 = What style To apply To the window. (See Constants: "Dialog Type")
	number IN 		 = How To show the dialog. (See Constants: "Dialog Animation") 
	number DELAY 	 = The time of the transition in miliseconds.
	number OUT 		 = How To exit the dialog. (See Constants: "Dialog Animation") 
	number Timeout 	 = How long To display the dialog for in miliseconds, (set To 0 To disable).
					   This can be used to end the dialog if the user takes to long to respond. 
					  
	--------------------
	|  Return (String) |
	--------------------
	
	OK = IP address from input, if input is blank then the dialog will not close (flashes dialog)
	Cancel = "CANCEL"
	
	If the Timeout is not set to zero and timeout reached then "TIMEOUT" is returned
	Exit button on window also returns "CANCEL"
]]
----------------------------------------------------------------
function DialogEX.IPInput(sTitle,sMessage,cAlign,sIP,cDisplay,nX,nY,nBackCol,nFrontCol,nWinType,cIN,cDELAY,cOUT,nTimeout)
	local args = "\""..sTitle.."\",\""..sMessage.."\","..cAlign..",\""..sIP.."\","..cDisplay..","..nX..","..nY..","..nBackCol..","..nFrontCol..","..nWinType..","..cIN..","..cDELAY..","..cOUT..","..nTimeout..","..Application.GetWndHandle()
	return DLL.CallFunction(DEX_DLLPATH, "Open_IPDlg", args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end	
----------------------------------------------------------------
-- END DialogEX.IPInput()
----------------------------------------------------------------


----------------------------------------------------------------
-- DialogEX.TimedCustomMessage()
----------------------------------------------------------------
--[[ Presents a dialog to the user With an timed informative message on it, 
	 the user has xx amount of seconds to click a button.
	 
	-------------
	| Arguments |
	-------------
	Below is a list of the function arguments (In order)
	
	string Title 	 	 = The title of the dialog window.
	string Message 	 	 = The text that will appear on the dialog.
	number Align 	 	 = Where To align the message text. (See Constants: "Dialog Text Align")		   
	string ButtonText 	 = A delimited string of the button titles, from 0 To 3 buttons 
						   ("Button1" = 1 button)
						   ("Button1|Button 2" = 2 buttons)
						   ("Button1|Button 2|Button 3" = 3 buttons)
						   
	number TimedButton	 = The index of the button that will dispaly the countdown timer.
						   (1 = 1st button)
						   (2 = 2nd button)
						   (3 = 3rd button)
						   (set to 0 to not display the countdown timer)
						   
	number ForcedReturn	 = Forced Return For when the dialog timesout (counter reached zero), this is to force the return of the selecded button if the dialog timesout. 
						   (-1 = "CANCEL")
						   (0 = no forced Return, "TIMEOUT" is returned) 
						   (1 = "BUTTON1")
						   (2 = "BUTTON2")
						   (3 = "BUTTON3")
	
	number Time			 = The time in miliseconds to show the dialog,
						   the count down will be displayed in the button set in "TimedButton".
						   
	number Width 		 = The width of the dialog.
	number Height 		 = The height of the dialog.					   
	number Display 	 	 = Where To display the dialog on the screen. (See Constants: "Display type")
	number X 		 	 = The X position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number Y 		 	 = The Y position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number BackCol  	 = The background color of the dialog. (Use -1 to disable else any decimal color)
	number FrontCol  	 = The background color of the dialog. (Use -1 to disable else any decimal color)
	number WinType 	 	 = What style To apply To the window. (See Constants: "Dialog Type")
	number IN 			 = How To show the dialog. (See Constants: "Dialog Animation") 
	number DELAY 		 = The time of the transition in miliseconds.
	number OUT 			 = How To exit the dialog. (See Constants: "Dialog Animation") 
	number Timeout 	 	 = How long To display the dialog for in miliseconds, (set To 0 To disable).
					   	   This can be used to end the dialog if the user takes to long to respond.
					   	   For a more detailed custom timer see DialogEX.TimedCustomMessage()	  
	--------------------
	|  Return (String) |
	--------------------
	
	Button 1 = "BUTTON1"
	Button 2 = "BUTTON2"
	Button 3 = "BUTTON3"
	
	If the Timeout is reached then the result of "ForcedReturn" will be returned, see notes above
	Exit button on window returns "CANCEL".
]]
function DialogEX.TimedCustomMessage(sTitle,sMessage,cAlign,sButtonText,nTimedButton,nForceReturn,nTime,nWidth,nHeight,cDisplay,nX,nY,nBackCol,nFrontCol,cWinType,cIN,cDELAY,cOUT)
	local args = "\""..sTitle.."\",\""..sMessage.."\","..cAlign..",\""..sButtonText.."\","..nTimedButton..","..nForceReturn..","..nTime..","..nWidth..","..nHeight..","..cDisplay..","..nX..","..nY..","..nBackCol..","..nFrontCol..","..cWinType..","..cIN..","..cDELAY..","..cOUT..","..Application.GetWndHandle()
	return DLL.CallFunction(DEX_DLLPATH, "Open_TimedMessageDlg", args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end	
----------------------------------------------------------------
-- END DialogEX.TimedCustomMessage()
----------------------------------------------------------------


----------------------------------------------------------------
-- DialogEX.CustomMessage()
----------------------------------------------------------------
--[[ Presents a Custom dialog To the user With an informative message on it.
	
	-------------
	| Arguments |
	-------------
	Below is a list of the function arguments (In order)
	
	string Title 	 	 = The title of the dialog window.
	string Message 	 	 = The text that will appear on the dialog.
	number Align 	 	 = Where To align the message text. (See Constants: "Dialog Text Align")	   
	string ButtonText 	 = A delimited string of the button titles, from 0 To 3 buttons 
						   ("Button1" = 1 button)
						   ("Button1|Button 2" = 2 buttons)
						   ("Button1|Button 2|Button 3" = 3 buttons)
						   
	number Width 		 = The width of the dialog.
	number Height 		 = The height of the dialog.					   
	number Display 	 	 = Where To display the dialog on the screen. (See Constants: "Display type")
	number X 		 	 = The X position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number Y 		 	 = The Y position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number BackCol  	 = The background color of the dialog. (Use -1 to disable else any decimal color)
	number FrontCol  	 = The background color of the dialog. (Use -1 to disable else any decimal color)
	number WinType 	 	 = What style To apply To the window. (See Constants: "Dialog Type")
	number IN 			 = How To show the dialog. (See Constants: "Dialog Animation") 
	number DELAY 		 = The time of the transition in miliseconds.
	number OUT 			 = How To exit the dialog. (See Constants: "Dialog Animation") 
	number Timeout 	 	 = How long To display the dialog for in miliseconds, (set To 0 To disable).
					   	   This can be used to end the dialog if the user takes to long to respond.
					   	   For a more detailed custom timer see DialogEX.TimedCustomMessage()	  
	--------------------
	|  Return (String) |
	--------------------
	
	Button 1 = "BUTTON1"
	Button 2 = "BUTTON2"
	Button 3 = "BUTTON3"
	
	If the Timeout is not set to zero and timeout reached then "TIMEOUT" is returned.
	Exit button on window returns "CANCEL".
]]
----------------------------------------------------------------
function DialogEX.CustomMessage(sTitle,sMessage,cAlign,sButtonText,nWidth,nHeight,cDisplay,nX,nY,nBackCol,nFrontCol,cWinType,cIN,cDELAY,cOUT,nTimeout)
	local args = "\""..sTitle.."\",\""..sMessage.."\","..cAlign..",\""..sButtonText.."\","..nWidth..","..nHeight..","..cDisplay..","..nX..","..nY..","..nBackCol..","..nFrontCol..","..cWinType..","..cIN..","..cDELAY..","..cOUT..","..nTimeout..","..Application.GetWndHandle()
	return DLL.CallFunction(DEX_DLLPATH, "Open_CustomMessageDlg", args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end	
----------------------------------------------------------------
-- END DialogEX.CustomMessage()
----------------------------------------------------------------


----------------------------------------------------------------
-- DialogEX.FolderBrowse()
----------------------------------------------------------------
--[[ Presents a folder browse dialog to the user to collect the path To a folder.
	
	-------------
	| Arguments |
	-------------
	Below is a list of the function arguments (In order)
	
	string Title 	 	 = The title of the dialog window.
	string Message 	 	 = The text that will appear on the dialog.
	number Align 	 	 = Where to align the message text. (See Constants: "Dialog Text Align")
	string Default 	 	 = The default folder to browse.
	number Display 	 	 = Where To display the dialog on the screen. (See Constants: "Display type")
	number X 		 	 = The X position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number Y 		 	 = The Y position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number BackCol  	 = The background color of the dialog. (Use -1 to disable else any decimal color)
	number FrontCol  	 = The background color of the dialog. (Use -1 to disable else any decimal color)
	number WinType 	 	 = What style To apply To the window. (See Constants: "Dialog Type")
	number IN 			 = How To show the dialog. (See Constants: "Dialog Animation") 
	number DELAY 		 = The time of the transition in miliseconds.
	number OUT 			 = How To exit the dialog. (See Constants: "Dialog Animation") 
	number Timeout 	 	 = How long To display the dialog for in miliseconds, (set To 0 To disable).
					  	   This can be used to end the dialog if the user takes to long to respond. 
			  
	--------------------
	|  Return (String) |
	--------------------
	
	OK = Full path to selected folder, if no folder is selected the dialog will not close (flashes dialog).
	Cancel = "CANCEL".
	
	If the Timeout is not set to zero and timeout reached then "TIMEOUT" is returned.
	Exit button on window returns "CANCEL".
]]
function DialogEX.FolderBrowse(sTitle,sMessage,cAlign,sDefault,cDisplay,nX,nY,nBackCol,nFrontCol,nWinType,cIN,cDELAY,cOUT,nTimeout)
	local args = "\""..sTitle.."\",\""..sMessage.."\","..cAlign..",\""..sDefault.."\","..cDisplay..","..nX..","..nY..","..nBackCol..","..nFrontCol..","..nWinType..","..cIN..","..cDELAY..","..cOUT..","..nTimeout..","..Application.GetWndHandle()
	return DLL.CallFunction(DEX_DLLPATH, "Open_FolderDlg", args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end	
----------------------------------------------------------------
-- END DialogEX.FolderBrowse()
----------------------------------------------------------------


----------------------------------------------------------------
-- DialogEX.FileBrowse()
----------------------------------------------------------------
--[[ Presents a file browse dialog to the user to collect the path To a file.
	
	-------------
	| Arguments |
	-------------
	Below is a list of the function arguments (In order)
	
	string Title 	 	 = The title of the dialog window.
	string FileOpen 	 = Whether To make the dialog a "file open" dialog.
	string Default 	 	 = The Default folder or file To browse.
	string Filters		 = The file type filters that will be used in the dialog. EG: "Text Files(*.txt);*.txt|All Files(*.*);*.*".
	number DefFilter	 = This allows you To set the file filter that should be selected by Default, (1ST = 0, 2ND = 1 ETC)
	number Display 	 	 = Where To display the dialog on the screen. (See Constants: "Display type")
	number X 		 	 = The X position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number Y 		 	 = The Y position of the dialog, (Ignored unless Display is set To DEX_SHOW_CUSTOM).
	number BackCol  	 = The background color of the dialog. (Use -1 to disable else any decimal color)
	number FrontCol  	 = The background color of the dialog. (Use -1 to disable else any decimal color)
	number WinType 	 	 = What style To apply To the window. (See Constants: "Dialog Type")
	number IN 			 = How To show the dialog. (See Constants: "Dialog Animation") 
	number DELAY 		 = The time of the transition in miliseconds.
	number OUT 			 = How To exit the dialog. (See Constants: "Dialog Animation") 
	number Timeout 	 	 = How long To display the dialog for in miliseconds, (set To 0 To disable).
					  	   This can be used to end the dialog if the user takes to long to respond. 
			  
	--------------------
	|  Return (String) |
	--------------------
	
	OK = Full path to selected file, if no file selected the dialog will not close (flashes dialog)
	Cancel = "CANCEL"
	
	If the Timeout is not set to zero and timeout reached then "TIMEOUT" is returned.
	Exit button on window returns "CANCEL".
]]
----------------------------------------------------------------
function DialogEX.FileBrowse(sTitle,bFileOpen,sDefault,sFilters,nDefFilter,cDisplay,nX,nY,nBackCol,nFrontCol,cWinType,cIN,cDELAY,cOUT,nTimeout)
	if bFileOpen then bFileOpen = 1 else bFileOpen = 0 end
	local Args = "\""..sTitle.."\","..bFileOpen..",\""..sDefault.."\",\""..sFilters.."\","..nDefFilter..","..cDisplay..","..nX..","..nY..","..cWinType..","..nBackCol..","..nFrontCol..","..cIN..","..cDELAY..","..cOUT..","..nTimeout..","..Application.GetWndHandle()
	return DLL.CallFunction(DEX_DLLPATH, "Open_FileDlg", Args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
----------------------------------------------------------------
-- END DialogEX.FileBrowse()
----------------------------------------------------------------