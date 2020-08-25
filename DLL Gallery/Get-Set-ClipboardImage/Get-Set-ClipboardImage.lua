function WrapDLLText(strText)
	return "\""..strText.."\""
end

function ClipboardSetImage(strFilePath)
	return String.ToNumber(DLL.CallFunction("AutoPlay\\Docs\\Get-Set-ClipboardImage.dll", "ClipboardSetImage", WrapDLLText(strFilePath), DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL));
end

function ClipboardGetImage(FilePath,ImageType,Comp)
	return String.ToNumber(DLL.CallFunction("AutoPlay\\Docs\\Get-Set-ClipboardImage.dll", "ClipboardGetImage", "\""..FilePath.."\", "..ImageType..", "..Comp, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL));
end


strFilePath= _SourceFolder.."\\AutoPlay\\Images\\630A01301.jpg"
if ClipboardSetImage(strFilePath) == 0 then
	Dialog.Message("Error","There was a error sending image to clipboard")
else
	Dialog.Message("Notice","Image has been sent to clipboard and is ready for use")
	Button.SetEnabled("Button1", true);
end


FilePath=_DesktopFolder.."\\bmptest.jpg"-- full path to save image to
ImageType=2 --0=bmp,1=png,2=jpg
Comp=10 -- image quality, 0 worst, 10 best (png and jpg only

strFilePath= _SourceFolder.."\\AutoPlay\\Images\\630A01301.jpg"
if ClipboardGetImage(FilePath,ImageType,Comp) == 0 then
	Dialog.Message("Error","There was a error retriving image from clipboard")
else
	Dialog.Message("Notice","Image has been retrivrd from clipboard and is on desktop")
	File.Open(FilePath, "", SW_SHOWNORMAL);
end