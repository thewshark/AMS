-- wTrans Example

--On Startup
op = 0;
handle = Application.GetWndHandle();
result = DLL.CallFunction("AutoPlay\\Docs\\wTrans.dll", "SetWindowTransparency", handle..","..op, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)


--On Shutdown
while (op > 0) do
	-- Do something here
	op = op - 1;
	DLL.CallFunction("AutoPlay\\Docs\\wTrans.dll", "SetWindowTransparency", handle..","..op, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)
end