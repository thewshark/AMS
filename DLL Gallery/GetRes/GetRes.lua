Filepath = _SourceFolder.."\\File.exe"
Resource = "#2000"
ResType = "TEXTFILE"
strTextsc = DLL.CallFunction("GetRes.dll", "GetTextResource", "\""..Filepath.."\",\""..Resource.."\",\""..ResType.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);