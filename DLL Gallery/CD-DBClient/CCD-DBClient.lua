------------------------------[[ SCRIPT: Global Script ]]------------------------------
CddbClient = { };
function CddbClient.GetCdDriveCount()
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetCdDriveCount", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetCdDriveLetter(index)
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetCdDriveLetter", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetCdInfoFromCdDrive(cdDrive)
	DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetCdInfoFromCdDrive", "\""..cdDrive.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetCdInfoFromCategoryAndDiscId(category, discId)
	DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetCdInfoFromCategoryAndDiscId", "\""..category.."\""..",".."\""..discId.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetCdMatches(cdDrive)
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetCdMatches", "\""..cdDrive.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetCdMatchesCount()
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetCdMatchesCount", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetMatchArtist(index)
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetMatchArtist", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetMatchCategory(index)
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetMatchCategory", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetMatchDiscId(index)
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetMatchDiscId", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetMatchTitle(index)
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetMatchTitle", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetArtist()
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetArtist", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetDiscId()
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetDiscId", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetGenre()
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetGenre", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetTitle()
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetTitle", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetTrackCount()
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetTrackCount", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetTrackTitle(index)
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetTrackTitle", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetTrackDuration(index)
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetTrackDuration", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetYear()
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetYear", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CddbClient.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\CddbClient.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonTest, Event: On Click Script ]]------------------------------
CddbClient.GetCdInfoFromCategoryAndDiscId("rock", "c912490f");

ListBox.DeleteItem("ListBoxTracks", -1);
trackCount = CddbClient.GetTrackCount();
for i = 0, trackCount - 1 do
	ListBox.AddItem("ListBoxTracks", (i + 1).."."..CddbClient.GetTrackTitle(i), "");
	--ListBox.AddItem("ListBoxTracks", (i + 1).."."..CddbClient.GetArtist().." - "..CddbClient.GetTitle().." - "..CddbClient.GetTrackTitle(i), "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetCdInfo, Event: On Click Script ]]------------------------------
CddbClient.GetCdInfoFromCdDrive(ListBox.GetItemText("ListBoxDrives", ListBox.GetSelected("ListBoxDrives")[1]));

ListBox.DeleteItem("ListBoxMatches", -1);
matchCount = CddbClient.GetCdMatchesCount();
for i = 0, matchCount - 1 do
	ListBox.AddItem("ListBoxMatches", CddbClient.GetMatchArtist(i).." - "..CddbClient.GetMatchTitle(i), "");
end

ListBox.DeleteItem("ListBoxTracks", -1);
trackCount = CddbClient.GetTrackCount();
for i = 0, trackCount - 1 do
	ListBox.AddItem("ListBoxTracks", (i + 1).."."..CddbClient.GetArtist().." - "..CddbClient.GetTitle().." - "..CddbClient.GetTrackTitle(i).." ["..CddbClient.GetTrackDuration(i).."]", "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetCdDrive, Event: On Click Script ]]------------------------------
ListBox.DeleteItem("ListBoxDrives", -1);
cdDriveCount = CddbClient.GetCdDriveCount();
for i = 0, cdDriveCount - 1 do
	ListBox.AddItem("ListBoxDrives", CddbClient.GetCdDriveLetter(i), "");
end
ListBox.SelectItem("ListBoxDrives", 1);

