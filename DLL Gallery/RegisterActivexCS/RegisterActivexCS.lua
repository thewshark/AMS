function RegisterActivexCS(val)
	local dlls = _SourceFolder.."\\AutoPlay\\Docs\\RegisterActivexCS.dll"
	DLL.CallFunction(dlls, "Register", "\""..val.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

RegisterActivexCS(_SourceFolder.."\\AutoPlay\\Docs\\MyLibrary.dll")