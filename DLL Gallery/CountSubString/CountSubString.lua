--CountSubString Example

strString = Input.GetText("Input1");
strFind = Input.GetText("Input2");

result = DLL.CallFunction("AutoPlay\\Docs\\CountSubString.dll", "CountSubString", "\""..strString.."\",\""..strFind.."\"", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
Dialog.Message("","String: '"..strFind.."' Found: "..result.." Times.")