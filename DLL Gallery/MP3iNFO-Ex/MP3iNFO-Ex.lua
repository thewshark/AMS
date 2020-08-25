--Personal Note--
--I was going to wait till after the competition to release this but wth. Here m8's [Leave some feedback as usual plz ]

--Functions--
--ID3Album
--ID3Artist
--ID3Genre
--ID3Image
--ID3Title
--ID3Track
--ID3Year

--Operational Notes--
--When using ID3Image the image file outputs to your system's temp directory. [I may change this in future version's or]

mp3f = _SourceFolder.."\\mymp3.mp3"

album  = DLL.CallFunction("AutoPlay\\Docs\\MP3iNFO-Ex.dll", "ID3Album", mp3f, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
artist = DLL.CallFunction("AutoPlay\\Docs\\MP3iNFO-Ex.dll", "ID3Artist", mp3f, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
title  = DLL.CallFunction("AutoPlay\\Docs\\MP3iNFO-Ex.dll", "ID3Title", mp3f, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
year   = DLL.CallFunction("AutoPlay\\Docs\\MP3iNFO-Ex.dll", "ID3Year", mp3f, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
genre  = DLL.CallFunction("AutoPlay\\Docs\\MP3iNFO-Ex.dll", "ID3Genre", mp3f, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
track  = DLL.CallFunction("AutoPlay\\Docs\\MP3iNFO-Ex.dll", "ID3Track", mp3f, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

cover = DLL.CallFunction("AutoPlay\\Docs\\MP3iNFO-Ex.dll", "ID3Image", mp3f, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

if cover == "Ok" then
	Image.Load("CurAlbum", _TempFolder.."\\Temp.jpg");
end