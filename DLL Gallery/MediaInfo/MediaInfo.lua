-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
----------------------------------------MEDIAINFO DLL------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-- Kinds of Stream

Stream_General = 0
Stream_Video = 1
Stream_Audio = 2
Stream_Text = 3
Stream_Chapters = 4
Stream_Image = 5
Stream_Menu = 6
Stream_Max = 7


function MediaInfo_Init()
	Memory.OpenLibrary(60, "datos\\MediaInfo.dll")
	
	_MediaInfo_New = Memory.OpenFunction(60, "MediaInfoA_New", DLL_CALL_STDCALL, DLL_RETURN_LONG)
	_MediaInfo_Option = Memory.OpenFunction(60, "MediaInfoA_Option", DLL_CALL_STDCALL, DLL_RETURN_INT)
	_MediaInfo_Delete = Memory.OpenFunction(60, "MediaInfoA_Delete", DLL_CALL_STDCALL, DLL_RETURN_INT)
	_MediaInfo_Close = Memory.OpenFunction(60, "MediaInfoA_Close", DLL_CALL_STDCALL, DLL_RETURN_INT)
	_MediaInfo_Get = Memory.OpenFunction(60, "MediaInfoA_Get", DLL_CALL_STDCALL, DLL_RETURN_INT)
	
	_MediaInfo_Inform = Memory.OpenFunction(60, "MediaInfoA_Inform", DLL_CALL_STDCALL, DLL_RETURN_INT)
	_MediaInfo_Open = Memory.OpenFunction(60, "MediaInfoA_Open", DLL_CALL_STDCALL, DLL_RETURN_INT)
end


function MediaInfo_New()
	return Memory.CallFunction(_MediaInfo_New)
end

function MediaInfo_Option(Handle, Option, Value)
	if Value == nil then
		Value = ""
	end
	return Memory.GetString(Memory.CallFunction(_MediaInfo_Option, Handle, Option, Value), -1, "Ascii")
end

function MediaInfo_Delete(Handle)
	return Memory.CallFunction(_MediaInfo_Delete, Handle)
end

function MediaInfo_Close(Handle)
	return Memory.CallFunction(_MediaInfo_Close, Handle)
end

function MediaInfo_Get(Handle, StreamKind, StreamNumber, Parameter, InfoKind, SearchKind)
	if InfoKind == nil then
		InfoKind = Info_Text
	end
	if SearchKind == nil then
		SearchKind = Info_Name
	end
	return Memory.GetString(Memory.CallFunction(_MediaInfo_Get, Handle, StreamKind, StreamNumber, Parameter, InfoKind, SearchKind), -1, "Ascii")
end

function MediaInfo_Inform(Handle, reserved)
	if reserved == nil then
		reserved = 0
	end
	return Memory.GetString(Memory.CallFunction(_MediaInfo_Inform, Handle, reserved), -1, "Ascii")
end

function MediaInfo_Open(Handle, file)
	return Memory.CallFunction(_MediaInfo_Open, Handle, file)
end

function MediaInfo_Exit()
	Memory.CloseLibrary(60)
end

-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
----------------------------------------MEDIAINFO DLL END--------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
------------------------------------MEDIAINFO GET INFO-----------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
function mediainfo(file)
	MediaInfo_Init()
	hwnd = MediaInfo_New()
	if MediaInfo_Open(hwnd, file) > 0 then
		local datos = {}
		
		MediaInfo_Option(hwnd, "Inform", "Video;%Height%")
		datos.alto = MediaInfo_Inform(hwnd);
		
		MediaInfo_Option(hwnd, "Inform", "Video;%Width%")
		datos.ancho = MediaInfo_Inform(hwnd);
		
		MediaInfo_Option(hwnd, "Inform", "Video;%Duration/String1%")
		datos.duracion = MediaInfo_Inform(hwnd);
		
		MediaInfo_Option(hwnd, "Inform", "Video;%FrameCount%")
		datos.frames = String.ToNumber(MediaInfo_Inform(hwnd));

		--MediaInfo_Option(hwnd, "Inform", "Video;%FrameRate%")
		--datos.framerate = String.ToNumber(MediaInfo_Inform(hwnd));
		
		MediaInfo_Option(hwnd, "Inform", "Video;%Duration%")
		datos.duracionms = String.ToNumber(MediaInfo_Inform(hwnd));

		MediaInfo_Close(hwnd)
		MediaInfo_Delete(hwnd)
		MediaInfo_Exit()	
		return datos
	else
		return "error"
	end
end
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------MEDIAINFO GET INFO END--------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------