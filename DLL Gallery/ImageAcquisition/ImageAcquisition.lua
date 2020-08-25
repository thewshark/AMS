------------------------------[[ SCRIPT: Global Script ]]------------------------------
imageCount = 0;					--The total number of the acquired images.
lastAcquiredImageIndex = 0;		--The index of the last acquired image.

--Select image acquisition source
function Select()
	DLL.CallFunction("AutoPlay\\Docs\\ImageAcquisition.dll", "Select", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Acquire image
function Acquire()
	DLL.CallFunction("AutoPlay\\Docs\\ImageAcquisition.dll", "Acquire", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Acquired images are stored in an internal list. GetImageCount returns the total number of images in that list.
function GetImageCount()
	imgCount = DLL.CallFunction("AutoPlay\\Docs\\ImageAcquisition.dll", "GetImageCount", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
	return String.ToNumber(imgCount);		--As strange as it may sound, with the return type set to integer still returns a string.
end

--Get the acquired image in the specified index. List index is zero based, from there the [index - 1]
function GetImage(index)
	return DLL.CallFunction("AutoPlay\\Docs\\ImageAcquisition.dll", "GetImage", index - 1, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Remove an acquired image from the specified index.
function RemoveImage(index)
	return DLL.CallFunction("AutoPlay\\Docs\\ImageAcquisition.dll", "RemoveImage", index - 1, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

--Remove all images from the internal list.
function RemoveImages()
	DLL.CallFunction("AutoPlay\\Docs\\ImageAcquisition.dll", "RemoveImages", "", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

--Get an error description if any error occurs
function GetError()
	DLL.CallFunction("AutoPlay\\Docs\\ImageAcquisition.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end


--[[
	With Kind Regards
	sside
]]--

------------------------------[[ SCRIPT: Page: Page1, Event: On Show Script ]]------------------------------
Page.StartTimer(100);


------------------------------[[ SCRIPT: Page: Page1, Event: On Close Script ]]------------------------------
Page.StopTimer();


------------------------------[[ SCRIPT: Page: Page1, Event: On Timer Script ]]------------------------------
imageCount = GetImageCount();
Label.SetText("lblImageCount", "ImageCount: "..imageCount);

if (imageCount > lastAcquiredImageIndex) then
	Image.Load("pbImage", GetImage(imageCount));
	lastAcquiredImageIndex = imageCount;
end

------------------------------[[ SCRIPT: Page: Page1, Object: btGetImage, Event: On Click Script ]]------------------------------
Image.Load("pbImage", GetImage(Input.GetText("tbImageIndex")));

------------------------------[[ SCRIPT: Page: Page1, Object: btAcquire, Event: On Click Script ]]------------------------------
Acquire();

------------------------------[[ SCRIPT: Page: Page1, Object: btSelect, Event: On Click Script ]]------------------------------
Select();

