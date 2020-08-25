--On Preload:
MouseEX={

PopClick = function (Type,nX,nY,blnReturn)
	if blnReturn == true then
		strReturn=1
	else
		strReturn=0
	end
	result = DLL.CallFunction("AutoPlay\\Docs\\MouseHelper.dll", "PopMouse", Type..", "..nX..", "..nY..", "..strReturn, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end,

SetWheel = function (DIRECTION)
	result = DLL.CallFunction("AutoPlay\\Docs\\MouseHelper.dll", "SetMouseWheel", DIRECTION, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end}


--On Show:
Page.StartTimer(10);
blnAllowClick=true

--On Timer:
function MouseLSClick()
	result = DLL.CallFunction("AutoPlay\\Docs\\MouseHelper.dll", "MouseLSClick", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end
function MouseLDClick()
	result = DLL.CallFunction("AutoPlay\\Docs\\MouseHelper.dll", "MouseLDClick", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end
function MouseRSClick()
	result = DLL.CallFunction("AutoPlay\\Docs\\MouseHelper.dll", "MouseRSClick", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end
function MouseRDClick()
	result = DLL.CallFunction("AutoPlay\\Docs\\MouseHelper.dll", "MouseRDClick", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

-- press "S" to simulate a mouse left single click
if System.IsKeyDown(83) then
	if blnAllowClick == true then
		blnAllowClick=false
		MouseLSClick()
		blnAllowClick=true
	end
end

-- press "D" to simulate a mouse left double click
if System.IsKeyDown(68) then
	if blnAllowClick == true then
		blnAllowClick=false
		MouseLDClick()
		blnAllowClick=true
	end
end

-- press "F" to simulate a mouse right single click
if System.IsKeyDown(70) then
	if blnAllowClick == true then
		blnAllowClick=false
		MouseRSClick()
		blnAllowClick=true
	end
end

-- press "G" to simulate a mouse right double click
if System.IsKeyDown(71) then
	if blnAllowClick == true then
		blnAllowClick=false
		MouseRDClick()
		blnAllowClick=true
	end
end


-- SET THE MOUSE WHEEL STATE
-- press "H" to simulate a mouse wheel DOWN
if System.IsKeyDown(72) then
	if blnAllowClick == true then
		blnAllowClick=false
		MouseEX.SetWheel(0)
		blnAllowClick=true
	end
end

-- press "J" to simulate a mouse wheel UP
if System.IsKeyDown(74) then
	if blnAllowClick == true then
		blnAllowClick=false
		MouseEX.SetWheel(1)
		blnAllowClick=true
	end
end

--On Button Set Mouse XY
function SetMouseXY(nX,nY)
	result = DLL.CallFunction("AutoPlay\\Docs\\MouseHelper.dll", "SetMouseXY", nX..", "..nY, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

sX = String.ToNumber(Input.GetText("inp_X"));
sY = String.ToNumber(Input.GetText("inp_Y"));
SetMouseXY(sX,sY)


--[[
------------------------------------------------------------------------------
FUNCTION: MouseEX.PopClick(number Type, number X, number Y, boolean Return)

Pops the mouse to the given position, performs the preset click and returns (if true) to start position

ARGUMENTS: number Type  0 = no click
						1 = left single click
						2 = left double click
						3 = right single click
						4 = right double click
			
			number X (the X position for the mouse)
			number Y (the Y position for the mouse)
			
			boolean Return  true= return to stsrt position, 
						 	false = do not return

RETURNS: Nothing
]]


--Example (this example will move the cursor to the start button and left click it then return to its start position)
Type=1
sX = String.ToNumber(Input.GetText("inp_X"));
sY = String.ToNumber(Input.GetText("inp_Y"));

MouseEX.PopClick(Type,sX,sY, true)
