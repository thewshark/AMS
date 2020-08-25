--StringConvert(cp.dll)

-- Путь к cp.dll
sPathDll = "AutoPlay\\Docs\\cp.dll";

-- Функция конвертирования строки из одной кодировки в другую
function Convert(sStr, nInCp, nOutCp)
	return  DLL.CallFunction(sPathDll, "Convert", "\""..sStr.."\","..nInCp..","..nOutCp, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)
end