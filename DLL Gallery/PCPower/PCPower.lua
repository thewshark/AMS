--[[ 
function:	SetMonitorPowerState

arguments:	1 = Show Screen Saver
			2 = Standby Monitor
			3 = Turn Off Monitor
			4 = Turn On Monitor			
						
returne:	nothing
]]

result = DLL.CallFunction("AutoPlay\\Docs\\PCPower.dll", "SetMonitorPowerState", 3, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
