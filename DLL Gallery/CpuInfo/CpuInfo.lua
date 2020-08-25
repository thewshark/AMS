CpuInfo = {};
function CpuInfo.GetDeviceIdList()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetDeviceIdList", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetAddressWidth()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetAddressWidth", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetArchitecture()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetArchitecture", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetAvailability()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetAvailability", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetCaption()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetCaption", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetConfigManagerErrorCode()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetConfigManagerErrorCode", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetConfigManagerUserConfig()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetConfigManagerUserConfig", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetCpuStatus()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetCpuStatus", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetCreationClassName()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetCreationClassName", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetCurrentClockSpeed()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetCurrentClockSpeed", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetCurrentVoltage()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetCurrentVoltage", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetDataWidth()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetDataWidth", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetDescription()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetDescription", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetDeviceID()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetDeviceID", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetErrorCleared()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetErrorCleared", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetErrorDescription()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetErrorDescription", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetExtClock()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetExtClock", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetFamily()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetFamily", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetInstallDate()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetInstallDate", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetL2CacheSize()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetL2CacheSize", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetL2CacheSpeed()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetL2CacheSpeed", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetL3CacheSize()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetL3CacheSize", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetL3CacheSpeed()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetL3CacheSpeed", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetLastErrorCode()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetLastErrorCode", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetLevel()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetLevel", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetLoadPercentage()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetLoadPercentage", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetManufacturer()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetManufacturer", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetMaxClockSpeed()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetMaxClockSpeed", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetName()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetName", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetNumberOfCores()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetNumberOfCores", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetNumberOfLogicalProcessors()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetNumberOfLogicalProcessors", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetOtherFamilyDescription()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetOtherFamilyDescription", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetPNPDeviceID()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetPNPDeviceID", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetPowerManagementCapabilities()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetPowerManagementCapabilities", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetPowerManagementSupported()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetPowerManagementSupported", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetProcessorId()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetProcessorId", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetProcessorType()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetProcessorType", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetRevision()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetRevision", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetRole()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetRole", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetSocketDesignation()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetSocketDesignation", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetStatus()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetStatus", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetStatusInfo()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetStatusInfo", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetStepping()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetStepping", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetSystemCreationClassName()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetSystemCreationClassName", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetSystemName()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetSystemName", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetUniqueId()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetUniqueId", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetUpgradeMethod()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetUpgradeMethod", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetUsage()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetUsage", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetVersion()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetVersion", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetVoltageCaps()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetVoltageCaps", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function CpuInfo.SetDeviceID(deviceid)
	DLL.CallFunction("AutoPlay\\Docs\\CpuInfo.dll", "SetDeviceID", "\""..deviceId.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
