str = [[
[b]negrita[/b]
[i]cursiva[/i]
[u]subrayado[/u]
[s]tachado[/s]
]]
result = DLL.CallFunction("AutoPlay\\Docs\\ConvertBBCodeToHTML.dll", "ConvertBBCodeToHTML", "\"" .. str .. "\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
Dialog.Message("", result);