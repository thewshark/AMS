function ImageToIco(strFROM, strTORu, nNSize, copyVal)
	local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\ImageToIcoPabloko.dll";
	local arg = "\""..strFROM.."\",\""..strTORu.."\","..nNSize..","..copyVal
	
	DLL.CallFunction(DLLFile, "ImageToIco", arg, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end


strFROM = _SourceFolder.."\\AutoPlay\\Images\\name.bmp";
strTORu = _SourceFolder.."\\AutoPlay\\Icons\\name.ico";
ICOSize = 32;
copyVal = 1;

ImageToIco(strFROM, strTORu, nNSize, copyVal);