--------------------------------------
--------------------------------------
-- 	Index: 1	Name: AddGroupMembers
-- 	Index: 2	Name: ChangePassword
-- 	Index: 3	Name: DelGroupMembers
-- 	Index: 4	Name: UserAdd
-- 	Index: 5	Name: UserDel
-- 	Index: 6	Name: UserExists
--------------------------------------
--------------------------------------


-- Index: 1	Name: AddGroupMembers
local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\UserManagement.dll"
local Username = "Guest"
local Group = "Administrators"
	
DLL.CallFunction(DLLFile, "AddGroupMembers", "\""..Username.."\",\""..Group.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);



-- Index: 2	Name: ChangePassword
local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\UserManagement.dll"
local Username = "Guest"
local OldPassword = "OldPassword"
local NewPassword = "NewPassword"
	
DLL.CallFunction(DLLFile, "ChangePassword", "\""..Username.."\",\""..OldPassword.."\",\""..NewPassword.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);



-- Index: 3	Name: DelGroupMembers
local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\UserManagement.dll"
local Username = "Guest"
local Group = "Administrators"
	
DLL.CallFunction(DLLFile, "DelGroupMembers", "\""..Username.."\",\""..Group.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);



-- Index: 4	Name: UserAdd
local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\UserManagement.dll"
local Username = "Guest"
local Password = "Password"
	
DLL.CallFunction(DLLFile, "UserAdd", "\""..Username.."\",\""..Password.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);



-- Index: 5	Name: UserDel
local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\UserManagement.dll"
local Username = "Guest"
	
DLL.CallFunction(DLLFile, "UserDel", "\""..Username.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);



-- Index: 5	Name: UserExists
local DLLFile = _SourceFolder.."\\AutoPlay\\Docs\\UserManagement.dll"
local Username = "Guest"
local Password = "Password"
	
DLL.CallFunction(DLLFile, "UserExists", "\""..Username.."\",\""..Password.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
