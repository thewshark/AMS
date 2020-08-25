-- GetTagInfo.dll Example:

Cancion = "\"AutoPlay\\Audio\\Track 01.mp3\"";

sTitulo = DLL.CallFunction("AutoPlay\\Docs\\GetTagInfo.dll", "GetTagInfo", Cancion..",1", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
sArtista = DLL.CallFunction("AutoPlay\\Docs\\GetTagInfo.dll", "GetTagInfo", Cancion..",2", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
sGenero = DLL.CallFunction("AutoPlay\\Docs\\GetTagInfo.dll", "GetTagInfo", Cancion..",3", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
sAlbum = DLL.CallFunction("AutoPlay\\Docs\\GetTagInfo.dll", "GetTagInfo", Cancion..",4", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

MP3Info_Inicio = "Mp3 Info\r\nTitulo: " ..sTitulo .."\r\nArtista: " ..sArtista.."\r\nGenero: "..sGenero.."\r\nAlbum: "..sAlbum
Paragraph.SetText("Paragraph3", MP3Info_Inicio);
