------------------------------[[ SCRIPT: Global Script ]]------------------------------
    -- Summary: Defines constants for drive types, including CDRom, Fixed, Network, NoRootDirectory, Ram, Removable, and Unknown.
    DriveType = {
        -- Summary: The type of drive is unknown.
        Unknown = 0,
        -- Summary: The drive does not have a root directory.
        NoRootDirectory = 1,
        -- Summary: The drive is a removable storage device, such as a floppy disk drive or a USB flash drive.
        Removable = 2,
        -- Summary: The drive is a fixed disk.
        Fixed = 3,
        -- Summary: The drive is a network drive.
        Network = 4,
        -- Summary: The drive is an optical disc device, such as a CD or DVD-ROM.
        CDRom = 5,
        -- Summary: The drive is a RAM disk.
        Ram = 6,
    };



--[[
        -- Summary: Indicates the amount of available free space on a drive.
        -- Returns: The amount of free space available on the drive, in bytes.
        -- Exceptions: An I/O error occurred (for example, a disk error or a drive was not ready).
        number AvailableFreeSpace { get; }
        
        -- Summary: Gets the name of the file system, such as NTFS or FAT32.
        -- Returns: The name of the file system on the specified drive.
        -- Exceptions: An I/O error occurred (for example, a disk error or a drive was not ready).
        string DriveFormat { get; }
        
        -- Summary: Gets the drive type.
        -- Returns: One of the DriveType values.
        -- Exceptions: An I/O error occurred.
        number DriveType { get; }
        
        -- Summary: Gets the drive type.
        -- Returns: String representation of the DriveType values.
        -- Exceptions: An I/O error occurred.
        number DriveTypeString { get; }
        
        -- Summary: Gets a value indicating whether a drive is ready.
        -- Returns: true if the drive is ready; false if the drive is not ready.
        bool IsReady { get; }
        
        -- Summary: Gets the name of a drive.
        -- Returns: The name of the drive.
        string Name { get; }
        
        -- Summary: Gets the total amount of free space available on a drive.
        -- Returns: The total free space available on a drive, in bytes.
        -- Exceptions: An I/O error occurred (for example, a disk error or a drive was not ready).
        number TotalFreeSpace { get; }
        
        -- Summary: Gets the total size of storage space on a drive.
        -- Returns: The total size of the drive, in bytes.
        -- Exceptions: An I/O error occurred (for example, a disk error or a drive was not ready).
        number TotalSize { get; }
        
        -- Summary: Gets or sets the volume label of a drive.
        -- Returns: The volume label.
        -- Exceptions: 1.An I/O error occurred (for example, a disk error or a drive was not ready).
        -- 			   2.The caller does not have the required permission.
        -- 			   3.The volume label is being set on a network or CD-ROM drive.
        string VolumeLabel { get; }
]]--




Events = {};
function Events:DriveAdded(sender, e)
	--[[e (eventargs) members:
		e.AvailableFreeSpace 
		e.DriveFormat 
		e.DriveType 
		e.DriveTypeString 
		e.IsReady 
		e.Name 
		e.TotalFreeSpace 
		e.TotalSize 
		e.VolumeLabel	
	]]--
	
	ListBox.AddItem("ListBox1", "DriveAdded: "..e.Name..", "..e.DriveTypeString..", "..e.DriveFormat, "");
end
function Events:DriveRemoved(sender, e)
	--[[e (eventargs) members:
		e.AvailableFreeSpace 
		e.DriveFormat 
		e.DriveType 
		e.DriveTypeString 
		e.IsReady 
		e.Name 
		e.TotalFreeSpace 
		e.TotalSize 
		e.VolumeLabel	
	]]--
	
	ListBox.AddItem("ListBox1", "DriveRemoved: "..e.Name..", "..e.DriveTypeString, "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonUnregisterActiveX, Event: On Click Script ]]------------------------------
System.UnregisterActiveX(Folder.GetCurrent().."\\AutoPlay\\Docs\\DriveWatcher.dll");

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStop, Event: On Click Script ]]------------------------------
dw:Stop();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonStart, Event: On Click Script ]]------------------------------
dw:Start();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCreate, Event: On Click Script ]]------------------------------
dw = luacom.CreateObject("DriveWatcher.DriveWatcherClass");
luacom.Connect(dw, Events);

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonRegisterActiveX, Event: On Click Script ]]------------------------------
System.RegisterActiveX(Folder.GetCurrent().."\\AutoPlay\\Docs\\DriveWatcher.dll");

