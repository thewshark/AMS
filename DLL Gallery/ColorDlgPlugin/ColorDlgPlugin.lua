--ColorDlgPlugin Example

-------------------
--Show Color Dialog
-------------------

-- show the color dialog
result = DLL.CallFunction("AutoPlay\\Docs\\ColorDlgPlugin.dll", "ShowColorDlg", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
-- convert the returned string to a table (function in globals)
tbResults = DelimitedStringToTable(result,"|");

-- convert the table stringe in to numbers
Dec = String.ToNumber(tbResults[1]);
Red = String.ToNumber(tbResults[2]);
Green = String.ToNumber(tbResults[3]);
Blue = String.ToNumber(tbResults[4]);

-- show the result
Input.SetText("inp_dec", Dec)
Shape.SetFillColor("Plugin1", Dec);
Input.SetText("inp_red", Red)
Input.SetText("inp_green", Green)
Input.SetText("inp_blue", Blue)
-- get the hex value from the red, green, blue values (function in globals)
Hex = GetHexString(Red, Green, Blue) 
Input.SetText("inp_hex", Hex)

--------------------------
--Get Color From Mouse X,Y
--------------------------

-- the the pixel color from the mouse cords
result = DLL.CallFunction("AutoPlay\\Docs\\ColorDlgPlugin.dll", "GetPixelCol", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
-- convert the returned string to a table (function in globals)
tbResults = DelimitedStringToTable(result,"|");
-- convert the tabel elaments to numbers
Dec = String.ToNumber(tbResults[1]);
Red = String.ToNumber(tbResults[2]);
Green = String.ToNumber(tbResults[3]);
Blue = String.ToNumber(tbResults[4]);
-- show the result
Shape.SetFillColor("Plugin1", Dec);
Input.SetText("inp_dec", Dec);
Input.SetText("inp_red", Red);
Input.SetText("inp_green", Green);
Input.SetText("inp_blue", Blue);
-- get the hex value from the red, green, blue values (function in globals)
Hex = GetHexString(Red, Green, Blue)
Input.SetText("inp_hex", Hex);

-- if the left mouse button is clicked then stop the timer
-- you can use any of the keys in the (VK) list in globals
if System.IsKeyDown(1) then
	Page.StopTimer();
end

---------------------
--Get Color From  X,Y
---------------------

-- get the x,y to check
x = Input.GetText("X");
y = Input.GetText("Y");
-- make sure the inputs are not blank
if x ~= "" and y ~= "" then
	-- convert the string x,y to numbers
	x = String.ToNumber(x);
	y = String.ToNumber(y);
	-- get the color from the x,y
	result = DLL.CallFunction("AutoPlay\\Docs\\ColorDlgPlugin.dll", "GetPixelColXY", x..","..y, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	-- convert the returned string to a table (function in globals)
	tbResults = DelimitedStringToTable(result,"|");
	-- convert the table stringe in to numbers
	Dec = String.ToNumber(tbResults[1]);
	Red = String.ToNumber(tbResults[2]);
	Green = String.ToNumber(tbResults[3]);
	Blue = String.ToNumber(tbResults[4]);
	-- show the result
	Shape.SetFillColor("Plugin1", Dec);
	Input.SetText("inp_dec", Dec);
	Input.SetText("inp_red", Red);
	Input.SetText("inp_green", Green);
	Input.SetText("inp_blue", Blue);
	-- get the hex value from the red, green, blue values (function in globals)
	Hex = GetHexString(Red, Green, Blue)
	Input.SetText("inp_hex", Hex);
end	




--------------------------------------------------------------
-- GLOBAL FUNCTIONS
--------------------------------------------------------------




function FilterKeyPress(InputObject, e_Key, sAllowed)
	sOrig = Input.GetText(InputObject)
	sFilter = String.TrimLeft(sOrig, sAllowed)
	sFilteredLeft = String.TrimLeft(sOrig, sFilter)
	sFilteredRight = String.TrimRight(sFilteredLeft, sFilter)
	Input.SetText(InputObject, sFilteredRight)
	
	Input.SetSelection(InputObject, String.Length(Input.GetText(InputObject)) + 1, String.Length(Input.GetText(InputObject)))
end


function GetHexString(Red,Green,Blue)
	return string.format("#%02X%02X%02X",Red,Green,Blue);
end


function DelimitedStringToTable(DelimitedString, Delimiter)
	tbReturn = {};
	local strWorking;
	local nPos = nil;
	local strData;
	local nTableIndex = 1;
	local nDelimiterLength = String.Length(Delimiter);
	
	if(nDelimiterLength < 1)then
		tbReturn[nTableIndex] = DelimitedString;
		return tbReturn;
	end
	
	strWorking = DelimitedString;
	nPos = String.Find(strWorking,Delimiter);
	while(nPos ~= -1)do
		strData = String.Left(strWorking,nPos-1);
		tbReturn[nTableIndex] = strData;
		nTableIndex = nTableIndex + 1;
		local nLength = String.Length(strWorking);
		strWorking = String.Right(strWorking,nLength - (nPos + (nDelimiterLength-1)));
		nPos = String.Find(strWorking,Delimiter);
	end
	if(strWorking ~= "")then
		tbReturn[nTableIndex] = strWorking;
	end
	
	return tbReturn;
end

VK = {
	LeftMouseButton = 1,
	RightMouseButton = 2,
	MiddleMouseButton = 4,
	Backspace = 8,
	Tab = 9,
	Enter = 13,
	Shift = 16,
	Ctrl = 17,
	Pause = 19,
	CapsLock = 20,
	Esc = 27,
	Spacebar = 32,
	PageUp = 33,
	PageDown = 34,
	End = 35,
	Home = 36,
	Left = 37,
	Up = 38,
	Right = 39,
	Down = 40,
	Insert = 45,
	Delete = 46,
	Zero = 48,
	One = 49,
	Two = 50,
	Three = 51,
	Four = 52,
	Five = 53,
	Six = 54,
	Seven = 55,
	Eight = 56,
	Nine = 57,
	A = 65,
	B = 66,
	C = 67,
	D = 68,
	E = 69,
	F = 70,
	G = 71,
	H = 72,
	I = 73,
	J = 74,
	K = 75,
	L = 76,
	M = 77,
	N = 78,
	O = 79,
	P = 80,
	Q = 81,
	R = 82,
	S = 83,
	T = 84,
	U = 85,
	V = 86,
	W = 87,
	X = 88,
	Y = 89,
	Z = 90,
	a = 65,
	b = 66,
	c = 67,
	d = 68,
	e = 69,
	f = 70,
	g = 71,
	h = 72,
	i = 73,
	j = 74,
	k = 75,
	l = 76,
	m = 77,
	n = 78,
	o = 79,
	p = 80,
	q = 81,
	r = 82,
	s = 83,
	t = 84,
	u = 85,
	v = 86,
	w = 87,
	x = 88,
	y = 89,
	z = 90,
	WindowsLeft = 91,
	WindowsRight = 92,
	Application = 93,
	Numpad0 = 96,
	Numpad1 = 97,
	Numpad2 = 98,
	Numpad3 = 99,
	Numpad4 = 100,
	Numpad5 = 101,
	Numpad6 = 102,
	Numpad7 = 103,
	Numpad8 = 104,
	Numpad9 = 105,
	NumpadAsterisk = 106,
	NumpadPlus = 107,
	NumpadDash = 109,
	NumpadPeriod = 110,
	NumpadForwardslash = 111,
	F1 = 112,
	F2 = 113,
	F3 = 114,
	F4 = 115,
	F5 = 116,
	F6 = 117,
	F7 = 118,
	F8 = 119,
	F9 = 120,
	F11 = 122,
	F12 = 123,
	NumLock = 144,
	ScrollLock = 145,
	SemiColon = 186,
	Equal = 187,
	Comma = 188,
	Dash = 189,
	Period = 190,
	Forwardslash = 191,
	Backquote = 192,
	OpenSquare = 219,
	Backslash = 220,
	CloseSquare = 221,
	SingleQuote = 222
};