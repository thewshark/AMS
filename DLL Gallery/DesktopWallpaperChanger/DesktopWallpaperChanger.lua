local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\DesktopWallpaperChanger.dll"
local ImagePath = _SourceFolder.."\\Autoplay\\Docs\\image.jpg";
-- 0 = Center, 1 = Mosaic, 2 = Expand, 3 = Ajusted, 4 = Fill
local Style =  0 

DLL.CallFunction(DLLFile, "ChangeWallpaper", "\""..ImagePath.."\","..Style, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);