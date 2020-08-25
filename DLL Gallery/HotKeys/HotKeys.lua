------------------------------[[ SCRIPT: Global Script ]]------------------------------
Modifiers = { None = "None", Alt = "Alt", Control = "Control", Shift = "Shift", Win = "Win" };
Keys = {
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

------------------------------[[ SCRIPT: Page: Page1, Event: On Show Script ]]------------------------------
Page.StartTimer(100);


------------------------------[[ SCRIPT: Page: Page1, Event: On Timer Script ]]------------------------------
pressedHotKey = DLL.CallFunction("AutoPlay\\Docs\\HotKeys.dll", "GetPressedHotKey", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

if (pressedHotKey ~= "") then
	ListBox.AddItem("ListBox1", pressedHotKey, "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: Button3, Event: On Click Script ]]------------------------------
hotKeys = DLL.CallFunction("AutoPlay\\Docs\\HotKeys.dll", "GetHotKeys", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
Dialog.Message("HotKeys", hotKeys, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: Button2, Event: On Click Script ]]------------------------------
DLL.CallFunction("AutoPlay\\Docs\\HotKeys.dll", "RemoveHotKey", "\""..Modifiers.Alt.."\""..","..Keys.Backspace, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
DLL.CallFunction("AutoPlay\\Docs\\HotKeys.dll", "RemoveHotKey", "\""..Modifiers.Control.."\""..","..Keys.Enter, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);


------------------------------[[ SCRIPT: Page: Page1, Object: Button1, Event: On Click Script ]]------------------------------
DLL.CallFunction("AutoPlay\\Docs\\HotKeys.dll", "AddHotKey", "\""..Modifiers.Alt.."\""..","..Keys.Backspace, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
DLL.CallFunction("AutoPlay\\Docs\\HotKeys.dll", "AddHotKey", "\""..Modifiers.Control.."\""..","..Keys.Enter, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);


