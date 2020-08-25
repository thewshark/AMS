-- PCPowerDLL Example

State = 1	--1 = Hibernate
			--2 = Standby
			--3 = LogOffUser
			--4 = Reboot
			--5 = ShutDown
			
Force = 0 	-- 0 no force
			-- 1 force

			
result = DLL.CallFunction("AutoPlay\\Docs\\PCPowerDLL.dll", "SetPCPowerState", State..", "..Force, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
