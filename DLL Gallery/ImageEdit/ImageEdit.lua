------------------------------[[ SCRIPT: Global Script ]]------------------------------
RotateType = {};			--RotateType enumeration.
RotateType.Left = 3;		--Rotate image left.
RotateType.Right = 1;		--Rotate image right.

FlipType = {};				--FlipType enumeration.
FlipType.X = 4;				--Flip image X.
FlipType.Y = 6;				--Flip image Y.

--Open an image from a file. You can open an image file saved as base64string format (.txt). Nothing interesting here. In future support for more image formats will be added: psd etc
function FromFile(imageFile)
	return DLL.CallFunction("AutoPlay\\Docs\\ImageEdit.dll", "FromFile", "\""..imageFile.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Open an image from the specified url. You could achieve the same with HTTP.Download.
function FromUrl(url)
	return DLL.CallFunction("AutoPlay\\Docs\\ImageEdit.dll", "FromUrl", "\""..url.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Open an image from base64 string. Think on e-mail attachments.
function FromBase64String(base64String)
	return DLL.CallFunction("AutoPlay\\Docs\\ImageEdit.dll", "FromBase64String", "\""..base64String.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Get general image info.
function GetImageInfo(imageFile)
	return DLL.CallFunction("AutoPlay\\Docs\\ImageEdit.dll", "GetImageInfo", "\""..imageFile.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Resize an image by specifying an imageFile and the percentage. Percentage 50 means 50% of the original image size. Percentage 200 means 200% of the original image size. Or, percentage < 100 = ZoomOut; percentage > 100 = ZoomIn;
function Resize(imageFile, percentage)
	return DLL.CallFunction("AutoPlay\\Docs\\ImageEdit.dll", "Resize", "\""..imageFile.."\""..","..percentage, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Crop an image.
function Crop(imageFile, x, y, width, height)
	return DLL.CallFunction("AutoPlay\\Docs\\ImageEdit.dll", "Crop", "\""..imageFile.."\""..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Rotate an image.
function Rotate(imageFile, rotateType)
	return DLL.CallFunction("AutoPlay\\Docs\\ImageEdit.dll", "Rotate", "\""..imageFile.."\""..","..rotateType, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Flip an image.
function Flip(imageFile, flipType)
	return DLL.CallFunction("AutoPlay\\Docs\\ImageEdit.dll", "Flip", "\""..imageFile.."\""..","..flipType, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Save an image another image format. bmp, gif, jpeg, png, tiff, base64 formats are supported.
function Save(srcImageFile, destImageFile)
	DLL.CallFunction("AutoPlay\\Docs\\ImageEdit.dll", "Save", "\""..srcImageFile.."\""..",".."\""..destImageFile.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Get an error description if any error occur.
function GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\ImageEdit.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end


--[[
	With Kind Regards
	sside
]]--

------------------------------[[ SCRIPT: Page: Page1, Object: btSave, Event: On Click Script ]]------------------------------
fileName = Dialog.FileBrowse(false, "Save File As", _DesktopFolder, "Bmp (*.bmp)|*.bmp|Gif (*.gif)|*.gif|Jpeg (*.jpeg)|*.jpeg|Png (*.png)|*.png|Tiff (*.tiff)|*.tiff|Base64 (*.txt)|*.txt|", "", "bmp", false, false)[1];

if (fileName ~= "CANCEL") then
	Save(Image.GetFilename("pbImage"), fileName);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btFlipY, Event: On Click Script ]]------------------------------
Image.Load("pbImage", Flip(Image.GetFilename("pbImage"), FlipType.Y));


------------------------------[[ SCRIPT: Page: Page1, Object: btFlipX, Event: On Click Script ]]------------------------------
Image.Load("pbImage", Flip(Image.GetFilename("pbImage"), FlipType.X));


------------------------------[[ SCRIPT: Page: Page1, Object: btRotateRight, Event: On Click Script ]]------------------------------
Image.Load("pbImage", Rotate(Image.GetFilename("pbImage"), RotateType.Right));


------------------------------[[ SCRIPT: Page: Page1, Object: btRotateLeft, Event: On Click Script ]]------------------------------
Image.Load("pbImage", Rotate(Image.GetFilename("pbImage"), RotateType.Left));


------------------------------[[ SCRIPT: Page: Page1, Object: btCrop, Event: On Click Script ]]------------------------------
Image.Load("pbImage", Crop(Image.GetFilename("pbImage"), 75, 20, 75, 75));


------------------------------[[ SCRIPT: Page: Page1, Object: btResize, Event: On Click Script ]]------------------------------
Image.Load("pbImage", Resize(Image.GetFilename("pbImage"), 150));


------------------------------[[ SCRIPT: Page: Page1, Object: btImageInfo, Event: On Click Script ]]------------------------------
Dialog.Message("Notice", GetImageInfo(Image.GetFilename("pbImage")), MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);


------------------------------[[ SCRIPT: Page: Page1, Object: btFromBase64, Event: On Click Script ]]------------------------------
base64String = TextFile.ReadToString("AutoPlay\\Images\\Water lilies.txt");
Image.Load("pbImage", FromBase64String(base64String));


------------------------------[[ SCRIPT: Page: Page1, Object: btFromUrl, Event: On Click Script ]]------------------------------
Image.Load("pbImage", FromUrl("http://stb.msn.com/i/AA/89EDF394A71051614CA3B8767AFBEE.jpg"));


------------------------------[[ SCRIPT: Page: Page1, Object: btFromFile, Event: On Click Script ]]------------------------------
fileName = Dialog.FileBrowse(true, "Open File", _DesktopFolder, "ImageFile (*.bmp;*.gif;*.jpg;*.jpeg;*.png;*.tiff)|*.bmp;*.gif;*.jpg;*.jpeg;*.png;*.tiff|Base64 (*.txt)|*.txt|", "", "bmp", false, false)[1];
fileExtension = String.Right(fileName, 3);

if (fileName ~= "CANCEL") then
	Image.Load("pbImage", FromFile(fileName));
end

