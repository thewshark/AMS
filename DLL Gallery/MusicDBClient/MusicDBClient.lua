------------------------------[[ SCRIPT: Global Script ]]------------------------------
MusicdbClient = { };
function MusicdbClient.GetArtistId(artistName)
	return DLL.CallFunction("AutoPlay\\Docs\\MusicdbClient.dll", "GetArtistId", "\""..artistName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function MusicdbClient.GetAlbums(artistId, artistName)
	albumCount = DLL.CallFunction("AutoPlay\\Docs\\MusicdbClient.dll", "GetAlbums", "\""..artistId.."\""..",".."\""..artistName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	return String.ToNumber(albumCount);
end
function MusicdbClient.GetAlbumId(albumIndex)
	return DLL.CallFunction("AutoPlay\\Docs\\MusicdbClient.dll", "GetAlbumId", albumIndex, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function MusicdbClient.GetAlbumDate(albumIndex)
	return DLL.CallFunction("AutoPlay\\Docs\\MusicdbClient.dll", "GetAlbumDate", albumIndex, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function MusicdbClient.GetAlbumTitle(albumIndex)
	return DLL.CallFunction("AutoPlay\\Docs\\MusicdbClient.dll", "GetAlbumTitle", albumIndex, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function MusicdbClient.GetTracks(albumId)
	trackCount = DLL.CallFunction("AutoPlay\\Docs\\MusicdbClient.dll", "GetTracks", "\""..albumId.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	return String.ToNumber(trackCount);
end
function MusicdbClient.GetTrackId(trackIndex)
	return DLL.CallFunction("AutoPlay\\Docs\\MusicdbClient.dll", "GetTrackId", trackIndex, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function MusicdbClient.GetTrackDuration(trackIndex)
	return DLL.CallFunction("AutoPlay\\Docs\\MusicdbClient.dll", "GetTrackDuration", trackIndex, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function MusicdbClient.GetTrackTitle(trackIndex)
	return DLL.CallFunction("AutoPlay\\Docs\\MusicdbClient.dll", "GetTrackTitle", trackIndex, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function MusicdbClient.GetLyrics(artistName, songTitle)
	return DLL.CallFunction("AutoPlay\\Docs\\MusicdbClient.dll", "GetLyrics", "\""..artistName.."\""..",".."\""..songTitle.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

function MusicdbClient.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\MusicdbClient.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_CDECL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ListBoxTracks, Event: On Select Script ]]------------------------------
Input.SetText("InputLyrics", "");

if (ListBox.GetSelectedCount("ListBoxTracks") > 0) then
	songTitle = ListBox.GetItemText("ListBoxTracks", ListBox.GetSelected("ListBoxTracks")[1]);
	songTitle = String.Mid(songTitle, 12, -1);

	Input.SetText("InputLyrics", MusicdbClient.GetLyrics(artistName, songTitle));
end

------------------------------[[ SCRIPT: Page: Page1, Object: ListBoxAlbums, Event: On Select Script ]]------------------------------
ListBox.DeleteItem("ListBoxTracks", -1);
Input.SetText("InputLyrics", "");

if (ListBox.GetSelectedCount("ListBoxAlbums") > 0) then
	albumId = ListBox.GetItemData("ListBoxAlbums", ListBox.GetSelected("ListBoxAlbums")[1]);
	trackCount = MusicdbClient.GetTracks(albumId);

	for i = 0, trackCount - 1 do
		ListBox.AddItem("ListBoxTracks", "["..MusicdbClient.GetTrackDuration(i).."] "..MusicdbClient.GetTrackTitle(i), MusicdbClient.GetTrackId(i));
	end
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonTest, Event: On Click Script ]]------------------------------
Input.SetText("InputLyrics", MusicdbClient.GetLyrics("Manowar", "The Ascension"));

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSearch, Event: On Click Script ]]------------------------------
ListBox.DeleteItem("ListBoxAlbums", -1);
ListBox.DeleteItem("ListBoxTracks", -1);
Input.SetText("InputLyrics", "");

artistName = Input.GetText("InputArtistName");
artistId = MusicdbClient.GetArtistId(artistName);
albumCount = MusicdbClient.GetAlbums(artistId, artistName);

for i = 0, albumCount - 1 do
	ListBox.AddItem("ListBoxAlbums", "["..MusicdbClient.GetAlbumDate(i).."] "..MusicdbClient.GetAlbumTitle(i), MusicdbClient.GetAlbumId(i));
end

