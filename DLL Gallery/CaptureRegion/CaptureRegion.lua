-- Example CaptureRegion

function CapRegionToClipboard()
	result = DLL.CallFunction("AutoPlay\\Docs\\CaptureRegion.dll", "CapRegionToClipboard", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

function CapRegionToFile(strFile, ImageFormat, Comp)
	result = DLL.CallFunction("AutoPlay\\Docs\\CaptureRegion.dll", "CapRegionToFile", "\""..strFile.."\", "..ImageFormat..", "..Comp, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

function SendImageToClipboard(strFilePath)
	return String.ToNumber(DLL.CallFunction("AutoPlay\\Docs\\CaptureRegion.dll", "ClipboardSetImage", "\""..strFilePath.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL));
end

function GetImageFromClipboard(FilePath,ImageType,Comp)
	return String.ToNumber(DLL.CallFunction("AutoPlay\\Docs\\CaptureRegion.dll", "ClipboardGetImage", "\""..FilePath.."\", "..ImageType..", "..Comp, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL));
end