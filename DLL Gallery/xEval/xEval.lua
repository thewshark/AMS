Exp = Input.GetText("exp")

result = DLL.CallFunction(_SourceFolder.."\\AutoPlay\\Docs\\xEval.dll", "EvalExp", "\""..Exp.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)

Input.SetText("result", result)