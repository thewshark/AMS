CaptureFlag = {
	--Captures all other windows that may be above the window that has to be captured.
	Simple = 0,
	--Captures only the given window even though it may be covered with other windows. Captures also hidden windows.
	Extended = 1 
};

WindowCapture = {};
function WindowCapture.CaptureFromHwnd(hWnd, captureFlag)
	DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "CaptureFromHwnd", hWnd..","..captureFlag, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WindowCapture.CaptureRectangle(x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "CaptureRectangle", x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function WindowCapture.CaptureScreen(captureCursor)
	if (captureCursor == true) then captureCursor = 1; else captureCursor = 0; end
	DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "CaptureScreen", captureCursor, DLL_RETURN_TYPE_LONG, DLL_CALL_CDECL);
end
function WindowCapture.CaptureFromProcessId(processId, captureFlag)
	DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "CaptureFromProcessId", processId..","..captureFlag, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WindowCapture.CaptureFromProcessName(processName, captureFlag)
	DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "CaptureFromProcessName", "\""..processName.."\""..","..captureFlag, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WindowCapture.CaptureWindowOpen(modifiers, keys)
	DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "CaptureWindowOpen", modifiers..","..keys, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WindowCapture.CaptureWindowClose()
	DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "CaptureWindowClose", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WindowCapture.CaptureHighlightedWindowStart(modifiers, keys)
	DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "CaptureHighlightedWindowStart", modifiers..","..keys, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WindowCapture.CaptureHighlightedWindowStop()
	DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "CaptureHighlightedWindowStop", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WindowCapture.CaptureFromPrtScrStart()
	DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "CaptureFromPrtScrStart", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WindowCapture.CaptureFromPrtScrStop()
	DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "CaptureFromPrtScrStop", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WindowCapture.GetImageCount()
	imageCount = DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "GetImageCount", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	return String.ToNumber(imageCount);
end
function WindowCapture.SaveImage(fileName)
	DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "SaveImage", "\""..fileName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function WindowCapture.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\WindowCapture.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

VK = {
	None=0,
	LButton=1,
	RButton=2,
	Cancel=3,
	MButton=4,
	XButton1=5,
	XButton2=6,
	Back=8,
	Tab=9,
	LineFeed=10,
	Clear=12,
	Enter=13,
	ShiftKey=16,
	ControlKey=17,
	Menu=18,
	Pause=19,
	CapsLock=20,
	Escape=27,
	Space=32,
	PageUp=33,
	PageDown=34,
	End=35,
	Home=36,
	Left=37,
	Up=38,
	Right=39,
	Down=40,
	Select=41,
	Print=42,
	Execute=43,
	PrintScreen=44,
	Insert=45,
	Delete=46,
	Help=47,
	D0=48,
	D1=49,
	D2=50,
	D3=51,
	D4=52,
	D5=53,
	D6=54,
	D7=55,
	D8=56,
	D9=57,
	A=65,
	B=66,
	C=67,
	D=68,
	E=69,
	F=70,
	G=71,
	H=72,
	I=73,
	J=74,
	K=75,
	L=76,
	M=77,
	N=78,
	O=79,
	P=80,
	Q=81,
	R=82,
	S=83,
	T=84,
	U=85,
	V=86,
	W=87,
	X=88,
	Y=89,
	Z=90,
	LWin=91,
	RWin=92,
	Apps=93,
	Sleep=95,
	NumPad0=96,
	NumPad1=97,
	NumPad2=98,
	NumPad3=99,
	NumPad4=100,
	NumPad5=101,
	NumPad6=102,
	NumPad7=103,
	NumPad8=104,
	NumPad9=105,
	Multiply=106,
	Add=107,
	Separator=108,
	Subtract=109,
	Decimal=110,
	Divide=111,
	F1=112,
	F2=113,
	F3=114,
	F4=115,
	F5=116,
	F6=117,
	F7=118,
	F8=119,
	F9=120,
	F10=121,
	F11=122,
	F12=123,
	F13=124,
	F14=125,
	F15=126,
	F16=127,
	F17=128,
	F18=129,
	F19=130,
	F20=131,
	F21=132,
	F22=133,
	F23=134,
	F24=135,
	NumLock=144,
	Scroll=145,
	LShiftKey=160,
	RShiftKey=161,
	LControlKey=162,
	RControlKey=163,
	LMenu=164,
	RMenu=165,
	BrowserBack=166,
	BrowserForward=167,
	BrowserRefresh=168,
	BrowserStop=169,
	BrowserSearch=170,
	BrowserFavorites=171,
	BrowserHome=172,
	VolumeMute=173,
	VolumeDown=174,
	VolumeUp=175,
	MediaNextTrack=176,
	MediaPreviousTrack=177,
	MediaStop=178,
	MediaPlayPause=179,
	LaunchMail=180,
	SelectMedia=181,
	LaunchApplication1=182,
	LaunchApplication2=183,
	OemSemicolon=186,
	Oemplus=187,
	Oemcomma=188,
	OemMinus=189,
	OemPeriod=190,
	OemQuestion=191,
	Oemtilde=192,
	OemOpenBrackets=219,
	OemPipe=220,
	OemCloseBrackets=221,
	OemQuotes=222,
	OemBackslash=226,
	ProcessKey=229,
	Attn=246,
	Crsel=247,
	Exsel=248,
	EraseEof=249,
	Play=250,
	Zoom=251,
	Pa1=253,
	OemClear=254,
	Shift=65536,
	Control=131072,
	Alt=262144,
};