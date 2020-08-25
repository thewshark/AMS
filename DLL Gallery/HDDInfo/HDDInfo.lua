
function GetHDDInfo(sDRIVE)
	sDRIVE=String.Replace(sDRIVE,":","",false)
	sDRIVE=String.Replace(sDRIVE,"\\","",false)
	tbDrives = Drive.Enumerate();
	if tbDrives then
		nHDDCount=0
		for i in pairs(tbDrives) do
			if Drive.GetType(tbDrives[i]) == 3 then
				cDRIVE=String.Replace(tbDrives[i],":\\","",false)
				cDRIVE=String.Upper(cDRIVE)
				if String.Upper(sDRIVE) == cDRIVE then
					tbRet={}
					tbRet.VendorModel = DLL.CallFunction("AutoPlay\\Docs\\HDDInfo.dll", "GetHDDVendorModel", nHDDCount, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
					tbRet.HardwareSerial = DLL.CallFunction("AutoPlay\\Docs\\HDDInfo.dll", "GetHDDHardwareSerial", nHDDCount, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
					tbRet.FirmwareVersion = DLL.CallFunction("AutoPlay\\Docs\\HDDInfo.dll", "GetHDDFirmwareVersion", nHDDCount, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
					nHDDCount=nHDDCount+1
				end
			end
		end
	else
		tbRet = 0
	end
	return tbRet
end


tbHDD=GetHDDInfo(_SourceDrive)
test="HDDVendorModel: "..tbHDD.VendorModel.."\r\n"
test=test.."HDDHardwareSerial: "..tbHDD.HardwareSerial.."\r\n"
test=test.."HDDFirmwareVersion: "..tbHDD.FirmwareVersion.."\r\n"
Dialog.Message("",test)

tbHDD=GetHDDInfo("c:\\")
test="HDDVendorModel: "..tbHDD.VendorModel.."\r\n"
test=test.."HDDHardwareSerial: "..tbHDD.HardwareSerial.."\r\n"
test=test.."HDDFirmwareVersion: "..tbHDD.FirmwareVersion.."\r\n"
Dialog.Message("",test)

tbHDD=GetHDDInfo("c")
test="HDDVendorModel: "..tbHDD.VendorModel.."\r\n"
test=test.."HDDHardwareSerial: "..tbHDD.HardwareSerial.."\r\n"
test=test.."HDDFirmwareVersion: "..tbHDD.FirmwareVersion.."\r\n"
Dialog.Message("",test)


tbHDD=GetHDDInfo("C:\\")
test="HDDVendorModel: "..tbHDD.VendorModel.."\r\n"
test=test.."HDDHardwareSerial: "..tbHDD.HardwareSerial.."\r\n"
test=test.."HDDFirmwareVersion: "..tbHDD.FirmwareVersion.."\r\n"
Dialog.Message("",test)


tbHDD=GetHDDInfo("C")
test="HDDVendorModel: "..tbHDD.VendorModel.."\r\n"
test=test.."HDDHardwareSerial: "..tbHDD.HardwareSerial.."\r\n"
test=test.."HDDFirmwareVersion: "..tbHDD.FirmwareVersion.."\r\n"
Dialog.Message("",test)

tbHDD=GetHDDInfo("C:")
test="HDDVendorModel: "..tbHDD.VendorModel.."\r\n"
test=test.."HDDHardwareSerial: "..tbHDD.HardwareSerial.."\r\n"
test=test.."HDDFirmwareVersion: "..tbHDD.FirmwareVersion.."\r\n"
Dialog.Message("",test)

tbHDD=GetHDDInfo("c:")
test="HDDVendorModel: "..tbHDD.VendorModel.."\r\n"
test=test.."HDDHardwareSerial: "..tbHDD.HardwareSerial.."\r\n"
test=test.."HDDFirmwareVersion: "..tbHDD.FirmwareVersion.."\r\n"
Dialog.Message("",test)