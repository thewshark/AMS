-------------------------------------------------------------------------------------------------------
-- GetVideoInfo(Item,ShowText)
--
-- Item: 0 = Manufacturer
--       1 = VideoDriver
--       2 = VideoMemory
--       3 = VideoDriverDLL
--       4 = VideoDriverVersion
--       5 = Width
--       6 = Height
--       7 = Depth
--       8 = Frequency
        
-- ShowText: 0 = Dont show text
--           1 = Do show text
------------------------------------------------------------------------------------------------------



strText=""
for i=1, 9 do
	Item=i-1
	ShowText=0
	DLLReturn = DLL.CallFunction("AutoPlay\\Docs\\VideoCardInfo.dll", "GetVideoInfo", Item..", "..ShowText, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	strText=strText..DLLReturn.."\r\n"
end

result = Dialog.Message("Notice", strText, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);



-------------------------------------------------------------------------------------------------------
-- GetVideoInfo(Item,ShowText)
--
-- Item: 0 = Manufacturer
--       1 = VideoDriver
--       2 = VideoMemory
--       3 = VideoDriverDLL
--       4 = VideoDriverVersion
--       5 = Width
--       6 = Height
--       7 = Depth
--       8 = Frequency
        
-- ShowText: 0 = Dont show text
--           1 = Do show text
------------------------------------------------------------------------------------------------------

strText=""
for i=1, 9 do
	Item=i-1
	ShowText=1
	DLLReturn = DLL.CallFunction("AutoPlay\\Docs\\VideoCardInfo.dll", "GetVideoInfo", Item..", "..ShowText, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	strText=strText..DLLReturn.."\r\n"
end

result = Dialog.Message("Notice", strText, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);

