function Extract7z(nProgressBar, sArcPath, sOutPath, sPass)
	if 	nProgressBar == nil then
		nProgressBar = 0
	else
		if Page.GetObjectType(nProgressBar) == OBJECT_PROGRESS then
			nProgressBar = Progress.GetProperties(nProgressBar).WindowHandle;
		else
			nProgressBar = 0
		end
	end
	local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\Extract7z.dll"
	local hWnd = Application.GetWndHandle();
	local arg = hWnd..","..nProgressBar..",0,\""..sArcPath.."\",\""..sOutPath.."\",\""..sPass.."\""
    DLL.CallFunction(DLLFile, "Extract7z", arg, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function CancelExtract()
	local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\Extract7z.dll"
    local result = DLL.CallFunction(DLLFile, "CancelExtract", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
    if result == "0" then
    	return "CANCEL"
    end
end