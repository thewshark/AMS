--IMAGE FORMATS:
IMAGE_BMP	= 1;
IMAGE_EMF	= 2;
IMAGE_EXIF	= 3;
IMAGE_GIF	= 4;
IMAGE_ICON	= 5;
IMAGE_JPEG	= 6;
IMAGE_PNG	= 7;
IMAGE_TIFF	= 8;
IMAGE_WMF 	= 9;

-- CAPTUREWINDOW
handle = Application.GetWndHandle();
filename = _SourceFolder.."\\Autoplay\\Images\\Sample"..Math.Random(0, 999)..".png"
format = IMAGE_PNG

local args = handle..",\""..filename.."\","..format
local DllFile = _SourceFolder.."\\AutoPlay\\Docs\\CaptureGDIDLL.dll"
DLL.CallFunction(DllFile, "CaptureWindow", args, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);

-- CAPTURESCREEN
filename = _SourceFolder.."\\Autoplay\\Images\\Sample"..Math.Random(0, 999)..".bmp"
format = IMAGE_BMP;

local args = "\""..filename.."\","..format
local DllFile = _SourceFolder.."\\AutoPlay\\Docs\\CaptureGDIDLL.dll"
DLL.CallFunction(DllFile, "CaptureScreen", args, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);

-- CAPTUREWINDOWREGION
handle = Application.GetWndHandle();
filename = _SourceFolder.."\\Autoplay\\Images\\Sample"..Math.Random(0, 999)..".gif"
fomat = IMAGE_GIF
xvalue = 10
yvalue = 10
width = 100
height = 100

DLL.CallFunction("AutoPlay\\Docs\\CaptureGDIDLL.dll", "CaptureWindowRegion", handle..",\""..filename.."\","..format..","..xvalue..","..yvalue..","..width..","..height, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);

-- CAPTURESCREENREGION
filename = _SourceFolder.."\\Autoplay\\Images\\Sample"..Math.Random(0, 999)..".jpg"
fomat = IMAGE_JPEG
xvalue = 10
yvalue = 10
width = 400
height = 400

local args = "\""..filename.."\","..format..","..xvalue..","..yvalue..","..width..","..height
local DllFile = _SourceFolder.."\\AutoPlay\\Docs\\CaptureGDIDLL.dll"
DLL.CallFunction(DllFile, "CaptureScreenRegion", args, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);