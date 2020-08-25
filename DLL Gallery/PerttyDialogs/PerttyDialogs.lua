--[[ D-Net Dialog - Input Dialog
returns:

button1 = string
button2 = "CANCEL"
EXIT BUTTON = "0"
]]

Title = "D-Net Dialog" -- title text
Text = "Enter some text" -- header text
Default = "Default Text" -- default text of input
ButtonA = "Enter" -- button 1 text
ButtonB = "Cancel" -- button 2 text
Border = 0 -- 0 with border, 1 without border
App = Application.GetWndHandle(); -- app handle
-- combine the arguments
Args = "\""..Title.."\",\""..Text.."\",\""..Default.."\",\""..ButtonA.."\",\""..ButtonB.."\","..Border..","..App
-- call the dll
result = DLL.CallFunction("AutoPlay\\Docs\\PerttyDialogs.dll", "ShowPrettyInput", Args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
-- display the result
Label.SetText("Label1", result);


--[[ D-Net Dialog - OK Dialog
returns:

button1 = "1"
EXIT BUTTON = "0"
]]



Title = "D-Net Dialog" -- title text
Text = "This is a starndard message dialog\r\n\r\nPretty isent it ??" -- body text
Align = 1 --0 left, 1 center, 2 right
ButtonA = "OK" -- button text
Width = 270 -- window width
Height = 110 -- window height
Border = 0 -- 0 with border, 1 without border
App = Application.GetWndHandle(); -- app handle, to center the dialog to the app window
-- combine the arguments
Args = "\""..Title.."\",\""..Text.."\","..Align..",\""..ButtonA.."\","..Width..","..Height..","..Border..","..App
-- call the dll
result = DLL.CallFunction("AutoPlay\\Docs\\PerttyDialogs.dll", "ShowPrettyOK", Args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
-- display the result
Label.SetText("Label1", result);



--[[ D-Net Dialog - Input Dialog
returns:

button1 = "1"
button2 = "2"
EXIT BUTTON = "0"
]]


Title = "D-Net Dialog" -- title text
Text = "This is a ok/cancel dialog\r\n\r\nPretty isent it ??" -- body text
Align = 1 --0 left, 1 center, 2 right
ButtonA = "OK" -- button text
ButtonB = "Cancel" -- button text
Width = 270 -- window width
Height = 110 -- window height
Border = 0 -- 0 with border, 1 without border
App = Application.GetWndHandle(); -- app handle, to center the dialog to the app window
-- combine the arguments
Args = "\""..Title.."\",\""..Text.."\","..Align..",\""..ButtonA.."\",\""..ButtonB.."\","..Width..","..Height..","..Border..","..App
-- call the dll
result = DLL.CallFunction("AutoPlay\\Docs\\PerttyDialogs.dll", "ShowPretty2Button", Args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
-- display the result
Label.SetText("Label1", result);


--[[ D-Net Dialog - Input Dialog
returns:

button1 = "1"
button2 = "2"
button3 = "3"
EXIT BUTTON = "0"
]]


Title = "D-Net Dialog" -- title text
Text = "This is a Yes/No/Cancel dialog\r\n\r\nPretty isent it ??" -- body text
Align = 1 --0 left, 1 center, 2 right
ButtonA = "Yes" -- button text
ButtonB = "No" -- button text
ButtonC = "Cancel" -- button text
Width = 270 -- window width
Height = 110 -- window height
Border = 0 -- 0 with border, 1 without border
App = Application.GetWndHandle(); -- app handle, to center the dialog to the app window
-- combine the arguments
Args = "\""..Title.."\",\""..Text.."\","..Align..",\""..ButtonA.."\",\""..ButtonB.."\",\""..ButtonC.."\","..Width..","..Height..","..Border..","..App
-- call the dll
result = DLL.CallFunction("AutoPlay\\Docs\\PerttyDialogs.dll", "ShowPretty3Button", Args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
-- display the result
Label.SetText("Label1", result);



--[[ D-Net Dialog - Input Dialog
returns:

if one input is left balnk then a empty string is returned ""
button1 = string
button2 = "0"
EXIT BUTTON = "0"
]]


Title = "D-Net Dialog" -- title text
TextA = "Enter Username" -- body text
TextB = "Enter Password"
DefA = "username"
DefB = "password"
ButtonA = "Enter" -- button text
ButtonB = "Cancel" -- button text
Border = 0 -- 0 with border, 1 without border

App = Application.GetWndHandle(); -- app handle, to center the dialog to the app window
-- combine the arguments
Args = "\""..Title.."\",\""..TextA.."\",\""..TextB.."\",\""..DefA.."\",\""..DefB.."\",\""..ButtonA.."\",\""..ButtonB.."\","..Border..","..App
-- call the dll
result = DLL.CallFunction("AutoPlay\\Docs\\PerttyDialogs.dll", "ShowPrettyDaulInput", Args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
-- display the result
if result ~= "0" and result ~= "" then
	tbResults = DelimitedStringToTable(result,"|");
	Label.SetText("Label1", tbResults[1].."\r\n"..tbResults[2]);
else
Label.SetText("Label1", result);
end