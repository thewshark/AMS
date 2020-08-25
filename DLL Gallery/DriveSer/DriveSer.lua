-- ############################################################################################
-- ## This function differentiates between genuine USB sticks and the false-positives which get
-- ## returned by Floppy-Drives and/or USB-Modems, via the Serial-Number unique to USB sticks.
-- ############################################################################################

-- Set the USB DriveType variable
drive_type = "2"

-- Enumerate the Drives on the system
tblDrives = Drive.Enumerate();

-- Step thru the table to process each drive
for n, DriveLetter in pairs (tblDrives) do

-- Get the DriveType
nType = Drive.GetType(DriveLetter)

-- If the DriveType equals the DriveType string, get its Serial-Number, and display.
	if nType == String.ToNumber(drive_type) then
	 sSerial = DLL.CallFunction("AutoPlay\\Docs\\DriveSer.dll", "DriveSerialNumber", "\""..DriveLetter.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)
		if sSerial ~= "ERROR" then	   
		 Dialog.Message("Notice", "Valid USB Flash Drive detected on: Drive " .. DriveLetter, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
		end
	end
end

-- Otherwise display a "No Valid USB Flash Drives" Message
if sSerial == "ERROR" then
 Dialog.Message("No USB Drives Detected", "No valid USB Flash Drives detected.\r\nPlease insert a valid drive\r\nand then restart this application.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end