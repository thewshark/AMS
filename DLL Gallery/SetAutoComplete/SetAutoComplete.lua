

--[[
-----------------------------------------------------
SetAutoComplete(nHWnd,nType,nSuggest,nAppend)
-----------------------------------------------------
Arguments:
-----------------------------------------------------
nHWnd: 		Handle of the input object

nType:		0 = FileSystem And URL's (the type of autocompleat)
			1 = FileSystem (ALL)
			2 = URL's (ALL)

nSuggest:	0 = OFF  (show the dropdown box)
			1 = ON
		
nAppend:	0 = OFF (append the text when typed in the input)
			1 = ON
			
-----------------------------------------------------
Returns: 	Nothing

-----------------------------------------------------
Description:

This dll will add the windows shell autocompleat function and dropdown box to a AMS input object.

You can show filepath or url history or both, 
you can turn the dropdown selection box on/off, 
You can turn the autocompeat function on/off


-----------------------------------------------------
]]
function SetAutoComplete(nHWnd,nType,nSuggest,nAppend)
	result = DLL.CallFunction("AutoPlay\\Docs\\SetAutoComplete.dll", "SetAutoComplete", nHWnd..", "..nType..", "..nSuggest..", "..nAppend, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
end

hWnd = Input.GetProperties("Input1").WindowHandle;
Type=0
Suggest=1
Append=1
SetAutoComplete(hWnd,Type,Suggest,Append)

hWnd = Input.GetProperties("Input2").WindowHandle;
Type=1
Suggest=1
Append=1
SetAutoComplete(hWnd,Type,Suggest,Append)

hWnd = Input.GetProperties("Input3").WindowHandle;
Type=2
Suggest=1
Append=1
SetAutoComplete(hWnd,Type,Suggest,Append)

